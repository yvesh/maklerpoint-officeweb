<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#sparten_table_head_menu a').click(function() {		
			$("#hidden_ordering").val($(this).attr("ord"));
			loadSparten();
		});
			
		$('#tableitself').dataTable( {
			"aaSorting": [[ 2, "asc" ]],
			"bSort": true,
			"bJQueryUI": true,
			"iDisplayLength": 25, 
			"bStateSave": true,
			"sPaginationType": "full_numbers",
			"oLanguage": {
				"sLengthMenu": "Zeige _MENU_ Einträge pro Seite",
				"sZeroRecords": "Kein Ergebnis",
				"sInfo": "Zeige _START_ bis _END_ von _TOTAL_ Einträgen",
				"sInfoEmpty": "Zeige 0 bis 0 von 0 Einträgen",
				"sInfoFiltered": "(gefiltert von insgesamt _MAX_ Einträgen)",
				"oPaginate": {
					"sNext": "Weiter",
					"sLast": "Letzte",
					"sFirst": "Erste",
					"sPrevious": "Zurück"
				 }				
			}
		});
		
		$("button").button();
		
		$("#btnRefresh").button({
			icons: {primary: "refreshIcon"}
		});
		
		$("#btnRefresh").bind("click", loadSparten);	
		
		$("#btnArchiveSparte").button({
			icons: {primary: "archiveIcon"}
		});
		
		$("#btnArchiveSparte").click(function () {
			$( "#dialog_archive" ).dialog("open");
		});	
		
		$("#btnDeleteSparte").button({
			icons: {primary: "loeschenIcon"}
		});
		
		$("#btnDeleteSparte").click(function () {
			$( "#dialog_delete" ).dialog("open");
		});	
		
		$("#btnTabelleEinstellungen").button({
			icons: {primary: "tablesettingsIcon"}
		});
		
		$("#btnTabelleEinstellungen").click(function () {
			$( "#dialog_table_settings" ).dialog("open");
		});	
		
		$("#btnNeuSparte").button({
			icons: {primary: "neuIcon"}
		});
		
		$("#btnNeuSparte").click(function () {
			$( "#sparten_dialog" ).dialog("open");
		});	
		
		$("#btnTabelleEinstellungen").click(function () {
			$( "#dialog_table_settings" ).dialog("open");
		});	
		
		// Dialogs
		
		$( "#dialog_delete" ).dialog({
			autoOpen: false,
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Löschen": function() {
					$("#sparten_table_holder input:checkbox:checked").each(function(){
						$('#status_messages').load("<c:url value='/office/sparten/spartenajax.html'/>" + "?id=" + $(this).val() + "&todo=1", function(){loadSparten();});
						// alert($(this).val());
					});					
					
					loadSparten();
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		$( "#dialog_archive" ).dialog({
			autoOpen: false,
			resizable: false,
			height:140,
			modal: true,
			buttons: {
				"Archivieren": function() {
					$("#sparten_table_holder input:checkbox:checked").each(function(){
						$('#status_messages').load("<c:url value='/office/sparten/spartenajax.html'/>" + "?id=" + $(this).val() + "&todo=0", function(){loadSparten();});
					});					
					
					loadSparten();					
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
		/* hover */
		
		$(".tr_tf, .tr_tf_even").hover(function(){
			//alert("hover");
			$(this).toggleClass("tr_tf_hover");
		});
		
		
	});
	
	function loadSparten() 
	{
		loading_show();	
		var ordering = $("#hidden_ordering").val();
		var status = $("#hidden_status").val();
		//alert( "Lade Sparte " + content_show + " | eigene: " + eigene); 
		// ?orderby=id&status=0'/>");
		$('#sparten_table').load("<c:url value='/office/sparten/spartentable.html'/>" + "?orderby=" + ordering + "&status=" + status);
		loading_hide();
	}
	
	function showSpartenDialog(id) {
		$('#sparten_dialog').load("<c:url value='/office/sparten/spartenedit.html?id='/>" + id, function() {
			$( "#sparten_dialog" ).dialog("open");
			//$("#ui-dialog-title-sparten_dialog").text("<c:out value="${spartentitle}" />");
		});
	}
	
	function checkSparte(id){
		if($('#check_' + id).is(':checked') == true) {
			$('#check_' + id).attr('checked', false);
		} else {
			$('#check_' + id).attr('checked', true);
		}
	}
	
</script>
<div id="sparten_menu">
	<div id="sparten_control_menu" class="ui-widget-header ui-corner-all">
		<span id="toolbar">
			<button id="btnNeuSparte">Neu</button> | 			
			<button id="btnArchiveSparte">Archivieren</button>
			<button id="btnDeleteSparte">Löschen</button> | 
			<button id="btnTabelleEinstellungen">Tabelleneinstellung</button> |
			<button id="btnRefresh">Neu laden</button>
			<div class="toolbar_search">
				<input type="text" name="quicksearch" id="quicksearch" class="inputbox" value="Schnellsuche..." 
					onblur="if(this.value=='') this.value='Schnellsuche...';" 
					onfocus="if(this.value=='Schnellsuche...') this.value='';">
				<button>Suchen</button> 
			</div>			
		</span>
	</div>
</div><br />
<div id="sparten_table_holder">
	<table class="table_full" cellspacing="0" cellpadding="0" id="tableitself">
		<thead>		
			<tr id="sparten_table_head_menu">
				<c:forEach items="${tableColumns}" var="column" varStatus="stat">
					<th>
					<c:out value="${column}" /> 
					</th>
				</c:forEach>
			</tr>
		</thead>
		
		<c:forEach var="sparte" items="${dataAll}" varStatus="status">
			<tr onDblclick="showSpartenDialog(<c:out value="${sparten[status.index].id}" />)"
				onClick="checkSparte(<c:out value="${sparten[status.index].id}" />)" >
					<c:forEach var="data" items="${sparte}">
						<td>${data}</td>
					</c:forEach>
			</tr>
		</c:forEach>
		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>	
</div>
<input type="hidden" id="hidden_status" value="<c:out value="${status}" />" />
<input type="hidden" id="hidden_ordering" value="<c:out value="${ordering}" />" />
<input type="hidden" id="hidden_active" value="" />

<div id="dialog_delete" title="Wirklich löschen?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie die Sparte(n) wirklich löschen?</p>
</div>
<div id="dialog_archive" title="Wirklich archivieren?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie die Sparte(n) wirklich archivieren?</p>
</div>
