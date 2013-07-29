<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#selectable_gruppe .ui-selecting { background: #FECA40; }
	#selectable_gruppe .ui-selected { background: #F39814; color: white; }
	#selectable_gruppe { list-style-type: none; margin: 0; padding: 0; }
	#selectable_gruppe li { margin: 3px; padding: 0.4em; height: 18px; width: 80%}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#textbausteine_bausteine').load("<c:url value='/office/textbausteine/textbausteineshow.html?grp=0'/>");
		$('#textbausteine_stein').load("<c:url value='/office/textbausteine/textbausteineshowtb.html?id=0'/>");
		
		$("button").button();
		
		$("#btnRefresh").button({
			icons: {primary: "refreshIcon"}
		});
		
		$("#btnRefresh").bind("click", refresh);
		
		$("#btnArchiveTB").button({
			icons: {primary: "archiveIcon"}
		});
		
		$("#btnArchiveTB").click(function () {
			$( "#dialog_archive" ).dialog("open");
		});	
		
		$("#btnDeleteTB").button({
			icons: {primary: "loeschenIcon"}
		});
		
		$("#btnDeleteTB").click(function () {
			$( "#dialog_delete" ).dialog("open");
		});
		
		$("#btnNeuTB").button({
			icons: {primary: "neuIcon"}
		});
		
		$("#btnNeuTBGruppe").button({
			icons: {primary: "neuIcon"}
		});
		
		// Selectables
		
		$("#selectable_gruppe").selectable({
			selected: function() {
				var counter = 0;
				$(".ui-selected", this).each(function() {
					if(counter > 0){
						 $(this).removeClass("ui-selected");
						 return;
					}					
					counter++;	
				});				
			},
			stop: function(){
				$(".ui-selected", this).each(function(){
					var index = $( "#textbausteine_gruppe li" ).index( this );
					//alert($(".ui-selected").attr("which"));
					$('#textbausteine_bausteine').load("<c:url value='/office/textbausteine/textbausteineshow.html?grp='/>" 
							+ $(".ui-selected").attr("which"));					
				});
			}
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
						$('#status_messages').load("<c:url value='/office/sparten/spartenajax.html'/>" 
								+ "?id=" + $(this).val() + "&todo=1", function(){loadSparten();});
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
						$('#status_messages').load("<c:url value='/office/sparten/spartenajax.html'/>" 
								+ "?id=" + $(this).val() + "&todo=0", function(){loadSparten();});
					});					
					
					loadSparten();					
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
	});
	
	function refresh(){
		
	}
	
</script>
<div id="textbausteine_menu">
	<div id="textbausteine_control_menu" class="ui-widget-header ui-corner-all">
		<span id="toolbar">
			<button id="btnNeuTB">Neu</button>
			<button id="btnNeuTBGruppe">Neue Gruppe</button> | 			
			<button id="btnArchiveTB">Archivieren</button>
			<button id="btnDeleteTB">Löschen</button> | 
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
<div id="textbausteine_gruppe">
	<span style="padding-left: 6px;">Gruppen:</span><br /><br />
	<ol id="selectable_gruppe">
		<c:if test="${empty tbgroups}"><li class="ui-widget-content">Keine Gruppen</li></c:if>
		<c:forEach var="tbg" items="${tbgroups}" varStatus="status">
			<li class="ui-widget-content" which="<c:out value="${tbg.id}" />"><c:out value="${tbg.name}" /></li>
		</c:forEach>
	</ol>
</div>
<div id="textbausteine_bausteine">
	
</div>
<div id="textbausteine_stein">
	
</div>

<div id="dialog_delete" title="Wirklich löschen?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie den Textbaustein wirklich löschen?</p>
</div>
<div id="dialog_archive" title="Wirklich archivieren?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie den Textbaustein wirklich archivieren?</p>
</div>