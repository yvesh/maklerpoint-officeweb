<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
	
		$('#waehrungen_table').load("<c:url value='/office/waehrungen/waehrungentable.html?orderby=id&status=0'/>");
		$('#waehrungen_dialog').load("<c:url value='/office/waehrungen/waehrungenedit.html?id=0'/>");
		$('#dialog_table_settings').load("<c:url value='/office/waehrungen/waehrungentablesettings.html'/>");
		
		// Dialogs
		
		$( "#waehrungen_dialog" ).dialog({
			autoOpen: false,
			height: 260,
			width: 500,
			modal: true,
			buttons: {
				"Speichern": function() {
								
					$.ajax({
						url: "<c:url value='/office/waehrungen/waehrungenajax.html' />",
						type: "POST",
						data: $("form#waehrungen_edit_form").serialize(),
						async: false,
						success: function(result){
							var ordering = $("#hidden_ordering").val();
							var status = $("#hidden_status").val();
							$('#sparten_table').load("<c:url value='/office/waehrungen/waehrungentable.html'/>" + "?orderby=" + ordering + "&status=" + status);
							$('#sparten_dialog').load("<c:url value='/office/waehrungen/waehrungenedit.html?id=0'/>");
						}
					});
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$('#waehrungen_dialog').load("<c:url value='/office/waehrungen/waehrungenedit.html?id=0'/>");
					$( this ).dialog( "close" );
				}
			}		
		});	
		
		$( "#dialog_table_settings" ).dialog({
			autoOpen: false,
			height: 500,
			width: 700,
			modal: true,
			buttons: {
				"Speichern": function() {
					var result = $('#activeItems').sortable('toArray');
					$('#status_messages').load("<c:url value='/office/settings/settingsajax.html'/>" + "?which=tableColumnsWaehrungen&value=" + result,
					function() {
						var ordering = $("#hidden_ordering").val();
						var status = $("#hidden_status").val();
						//alert( "Lade Sparte " + content_show + " | eigene: " + eigene); 
						// ?orderby=id&status=0'/>");
						$('#waehrungen_table').load("<c:url value='/office/waehrungen/waehrungentable.html'/>" + "?orderby=" + ordering + "&status=" + status);						
					});									
					
					//alert("result: " + result); 
					
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
					$('#dialog_table_settings').load("<c:url value='/office/waehrungen/waehrungentablesettings.html'/>");
				}
			}
		});
		
	});		 	
</script>
<div id="waehrungen_table"></div>
<div id="waehrungen_dialog" title="Neue Währung"></div>
<div id="dialog_table_settings" title="Tabellen Einstellungen"></div>