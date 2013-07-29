<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		loading_show();
		$('#kunden_uebersicht').load("<c:url value='/office/privatkunden/privatkundentable.html?eigene=1&orderby=id'/>");
		$('#kunden_tabs_holder').load("<c:url value='/office/privatkunden/privatkundentabs.html?kdnr=0'/>");
		$('#kundeDialog').load("<c:url value='/office/privatkunden/privatkundenedit.html?kdnr=0'/>");
		$('#dialog_table_settings').load("<c:url value='/office/privatkunden/privatkundentablesettings.html'/>");
		
		$( "#kundeDialog" ).dialog({
			autoOpen: false,
			height: 700,
			width: 800,
			madal: true,
			buttons: {
				"Speichern": function() {
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$('#kundeDialog').load("<c:url value='/office/privatkunden/privatkundenedit.html?kdnr=0'/>");
					$( this ).dialog( "close" );
				}
			}
		});
		
		$( "#dialog_table_settings" ).dialog({
			autoOpen: false,
			height: 600,
			width: 750,
			madal: true,
			buttons: {
				"Speichern": function() {
					var result = $('#activeItems').sortable('toArray');
					$('#status_messages').load("<c:url value='/office/settings/settingsajax.html'/>" + "?which=tableColumnsPrivat&value=" + result,
					function() {
						var content_show = $("#hidden_ordering").val();
						var eigene = $("#hidden_eigene").val();
						//alert( "Lade kunden " + content_show + " | eigene: " + eigene); 
						$('#kunden_uebersicht').load("<c:url value='/office/privatkunden/privatkundentable.html'/>" + "?eigene=" + eigene + "&orderby=" + content_show);
					});									
					
					//alert("result: " + result); 
					
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
					$('#dialog_table_settings').load("<c:url value='/office/privatkunden/privatkundentablesettings.html'/>");
				}
			}
		});
		
		loading_hide();
	});		 	
</script>
<div id="kunden_uebersicht"></div>
<div id="kunden_tabs_holder"></div>
<div id="kundeDialog" title="Neuer Kunde"></div>
<div id="dialog_table_settings" title="Tabellen Einstellungen"></div>
<div id="status_messages"></div>