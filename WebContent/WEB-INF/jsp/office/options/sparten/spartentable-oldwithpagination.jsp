<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" 
%><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#sparten_table_head_menu a').click(function() {		
			$("#hidden_ordering").val($(this).attr("ord"));
			loadSparten();
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
	<c:set value="20" var="pageSize"/>

	<c:choose>
		<c:when test="${empty param.s}">
			<c:set var="rowStart" value="1"/>
		</c:when>
		<c:otherwise>
			<c:set var="rowStart" value="${param.s}"/>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${empty param.e}">
			<c:set var="rowEnd" value="${pageSize}"/>
		</c:when>
		<c:otherwise>
			<c:set var="rowEnd" value="${param.e}"/>
		</c:otherwise>
	</c:choose>
	
<div id="sparten_table_holder">
	<table class="table_full" cellspacing="0" cellpadding="0">
		<tr id="sparten_table_head_menu">
			<c:forEach items="${tableColumns}" var="column" varStatus="stat">
				<th><c:out value="${column}" /> <c:if test="${stat.count != 1}">
					<a href="#" ord="<c:out value="${columnDBNames[columnIds[stat.index -1]]}" /><c:if test="${columnDBNames[columnIds[stat.index -1]] == ordering}">_DESC</c:if>">				
						<c:if test="${columnDBNames[columnIds[stat.index -1]] != ordering}">
							<img src="<c:url value='/media/images/arrow_down.gif'/>" title="Nach <c:out value="${column}" /> sortieren">
						</c:if>
						<c:if test="${columnDBNames[columnIds[stat.index -1]] == ordering}">
							<img src="<c:url value='/media/images/arrow_up.gif'/>" title="Nach <c:out value="${column}" /> aufsteigend sortieren">
						</c:if>
					</a></c:if>
				</th>
			</c:forEach>
		</tr>
		<c:forEach begin="${rowStart-1}" step="1" end="${rowEnd-1}" var="sparte" items="${dataAll}" varStatus="status">
			<tr class="tr_tf<c:if test="${status.count % 2 == 0}">_even</c:if>" 
				onDblclick="showSpartenDialog(<c:out value="${sparten[status.index].id}" />)"
				onClick="checkSparte(<c:out value="${sparten[status.index].id}" />)" >
							<c:forEach var="data" items="${sparte}">
					<td>${data}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<table cellspacing="0" cellpadding="0" width="966px">
	<tr>
		<td class="tf_footer">
				<c:if test="${datenCount == 0}" >
					<font color="red">Keine Datensätze vorhanden</font>
				</c:if>
				<c:if test="${datenCount == 1}" >
					<font color="green">Ein Datensatz vorhanden</font>
				</c:if>
				<c:if test="${datenCount > 1}" >
					<font color="green"><c:out value="${datenCount}" /> Datensätze vorhanden</font>
				</c:if>
		</td>
		<td class="tf_footer">
			<c:set value="${fn:length(dataAll)}" var="rLen"/>
			<c:choose>
				<c:when test="${rLen lt rowEnd}">
					<c:set var="rCurrEnd" value="${rLen}"/>
				</c:when>
				<c:otherwise>
					<c:set var="rCurrEnd" value="${rowEnd}"/>
				</c:otherwise>
			</c:choose>
			Zeige Sparten ${rowStart} bis ${rCurrEnd} von ${rLen}
		</td>
		<td class="tf_footer" align="right">
			<c:if test="${rowStart gt 1}">
				<c:url value="/office/sparten/sparten.html?s=${rowStart-pageSize}&e=${rowEnd-pageSize}" var="urlPrev"/>
				<a href="${urlPrev}">< Vorherige</a>
			</c:if>
	
			<c:forEach var="pStart" varStatus="status" begin="0" end="${rLen-1}" step="${pageSize}">
				<c:url value="/office/sparten/sparten.html?s=${pStart+1}&e=${pStart+pageSize}" var="urlCurr"/>
				<span>
					<a href="${urlCurr}">${status.count}</a>
				</span>
			</c:forEach>
	
			<c:if test="${rowEnd lt rLen}">
				<c:url value="/office/sparten/sparten.html?s=${rowStart+pageSize}&e=${rowEnd+pageSize}" var="urlNext"/>
				<a href="${urlNext}">Nächste ></a>
			</c:if>
		</td>
	</tr>
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