<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	
	// sorting
	
	$('#kunden_table_head_menu a').click(function() {		
		$("#hidden_ordering").val($(this).attr("ord"));
		loadKunden();
	});
	
	// Buttons
	
	$("button").button();
	$("#kunden_radio_menu").buttonset();
	$("input[name='radiokunden']").bind("click", toogleKunden );
	
	$("#btnRefresh").button({
		icons: {primary: "refreshIcon"},
		text: false
	});
	
	$("#btnArchiveKunde").button({
		icons: {primary: "archiveIcon"},
	});
	
	$("#btnArchiveKunde").click(function () {
		$( "#dialog_archive" ).dialog("open");
	});	
	
	$("#btnDeleteKunde").button({
		icons: {primary: "loeschenIcon"},
	});
	
	$("#btnTabelleEinstellungen").button({
		icons: {primary: "tablesettingsIcon"},
		text: false
	});
	
	$("#btnTabelleEinstellungen").click(function () {
		$( "#dialog_table_settings" ).dialog("open");
	});	
	
	$("#btnDeleteKunde").click(function () {
		$( "#dialog_delete" ).dialog("open");
	});	
	
	$("#btnRefresh").bind("click", loadKunden);	
	
	$("#btnNeuKunde").button({
		icons: {primary: "neuIcon"}
	});
	
	$("#btnNeuKunde").click(function () {
		$( "#kundeDialog" ).dialog("open");
	});	
	
	$("#btnDokumente").button({
		icons: {primary: "dokumenteIcon"}
	});
	
	$("#btnExport").button({
		icons: {primary: "exportIcon"}
	});
	
	$("#btnPrint").button({
		icons: {primary: "druckenIcon"}
	});
	
	$("#btnBrief").button({
		icons: {primary: "briefIcon"}
	});
	
	$("#btnKarte").button({
		icons: {primary: "karteIcon"}
	});
	
	$("#btnReport").button({
		icons: {primary: "reportIcon"}
	});	
	
	// BUTTONS
	$('.fg-button').hover(
		function(){ $(this).removeClass('ui-state-default').addClass('ui-state-focus'); },
		function(){ $(this).removeClass('ui-state-focus').addClass('ui-state-default'); }
	);
	
	// Menus
		
	$('#ansichten-button').menu({ 
			content: $('#ansichten-div').html(), // grab content from this page
			showSpeed: 300 
	});
		
	// Dialoge 
	
	$( "#dialog_delete" ).dialog({
		autoOpen: false,
		resizable: false,
		height:140,
		modal: true,
		buttons: {
			"Löschen": function() {
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
				$( this ).dialog( "close" );
			},
			"Abbrechen": function() {
				$( this ).dialog( "close" );
			}
		}
	});	
	
	/* hover */
	
	$(".tr_kunde, .tr_kunde_even").hover(function(){
		//alert("hover");
		$(this).toggleClass("tr_kunde_hover");
	});
	
});
	
function toogleKunden() 
{		
		$("#hidden_eigene").val($(this).val());	
		loadKunden();					
}

function loadKunden() 
{
	loading_show();	
	var content_show = $("#hidden_ordering").val();
	var eigene = $("#hidden_eigene").val();
	//alert( "Lade kunden " + content_show + " | eigene: " + eigene); 
	$('#kunden_uebersicht').load("<c:url value='/office/privatkunden/privatkundentable.html'/>" + "?eigene=" + eigene + "&orderby=" + content_show);
	loading_hide();
}

function showKundeDialog(kdnr){
	$('#kundeDialog').load("<c:url value='/office/privatkunden/privatkundenedit.html?kdnr='/>" + kdnr, function() {
		$( "#kundeDialog" ).dialog("open");
	});
}

function activateKunde(kdnr){
	if($('#check_' + kdnr).is(':checked') == true) {
		$('#check_' + kdnr).attr('checked', false);
	} else {
		$('#check_' + kdnr).attr('checked', true);
	}
}
</script>
<!-- Table Menue -->
<div id="kunden_menu">
	<div id="kunden_control_menu" class="ui-widget-header ui-corner-all">
		<span id="toolbar">
			<button id="btnNeuKunde">Neu</button> 
			<button id="btnArchiveKunde">Archivieren</button>
			<button id="btnDeleteKunde">Löschen</button> | 
			<button id="btnDokumente">Dokumente</button> | 
			<button id="btnBrief">Brief / E-Mail</button><button id="btnExport">Export</button><button id="btnPrint">Drucken</button> | 
			<button id="btnKarte">Karte</button> | <button id="btnReport">Report</button>
		</span>
	</div>
	<div id="kunden_table_menu">
			<div id="kunden_search_menu">
				<input type="text" name="quicksearch" id="quicksearch" class="inputbox" value="Schnellsuche..." 
					onblur="if(this.value=='') this.value='Schnellsuche...';" 
					onfocus="if(this.value=='Schnellsuche...') this.value='';">
				<button>Suchen</button> 
				<select name="combofield" id="combosearch" style="width: 130px; height: 25px; margin-left: 10px;">
				<c:forEach items="${columnsWithField}" var="column" varStatus="star">				
					<option value="<c:out value="${column.type}" />"><c:out value="${column.name}" /></option>
				</c:forEach>
				</select>
				=  
				<input type="text" name="fieldsearch" id="fieldsearch" class="inputbox" value="Detailsuche..." 
					onblur="if(this.value=='') this.value='Detailsuche...';" onfocus="if(this.value=='Detailsuche...') this.value='';">
				<button id="btnfieldSearch">Suchen</button> 
				<button id="btnRefresh">Neu laden</button>	
				
				<button id="btnTabelleEinstellungen">Einstellungen Tabelle</button>	 
			</div>
			<div id="kunden_radio_menu">
			<a tabindex="0" href="#ansichten-div" id="ansichten-button" class="fg-button fg-button-icon-right ui-widget ui-state-default ui-corner-all">
				<span class="ui-icon ui-icon-triangle-1-s"></span>Tabellenansicht
			</a>
			<div id="ansichten-div" class="hidden">
				    <ul>
				      <li><a href="#">Child menu option</a></li>
				      <li><a href="#">Child menu option</a></li>
				      <li><a href="#">Child menu option</a></li>
				    </ul>
			</div>    
			<!-- 
				<input type="radio" id="radio_eigenekunden" name="radiokunden" value="1"<c:if test="${eigene == 1}"> checked="checked"</c:if>><label for="radio_eigenekunden">Eigene Kunden</label>
				<input type="radio" id="radio_allekunden" name="radiokunden" value="0"<c:if test="${eigene == 0}"> checked="checked"</c:if>><label for="radio_allekunden">Alle Kunden</label>
			-->
			</div>
	</div>
</div>

<!-- Table -->

<table class="table_full" cellspacing="0" cellpadding="0">
	<tr id="kunden_table_head_menu">
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
	<c:forEach var="kunde" items="${dataAll}" varStatus="status">
		<tr class="tr_kunde<c:if test="${status.count % 2 == 0}">_even</c:if>" 
			onDblclick="showKundeDialog(<c:out value="${alleKunden[status.index].kundenNr}" />)" 
			onClick="activateKunde(<c:out value="${alleKunden[status.index].kundenNr}" />)" >
			<c:forEach var="data" items="${kunde}">
				<td>${data}</td>
			</c:forEach>
		</tr>
	</c:forEach>
</table>
<table cellspacing="0" cellpadding="0" width="966px">
	<tr>
		<td class="kunde_footer">
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
		<td class="kunde_footer">
			<div id="active_kunde" style="text-align:right;">Aktiver Kunde:</div> 
		</td>
	</tr>
</table>
<input type="hidden" id="hidden_eigene" value="<c:out value="${eigene}" />" />
<input type="hidden" id="hidden_ordering" value="<c:out value="${ordering}" />" />
<input type="hidden" id="hidden_active" value="" />

<div id="dialog_delete" title="Wirklich löschen?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie den oder die Kunden wirklich löschen?</p>
</div>
<div id="dialog_archive" title="Wirklich archivieren?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span>Wollen Sie den oder die Kunden wirklich archivieren?</p>
</div>