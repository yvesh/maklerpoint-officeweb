<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
	
		$('#sparten_table').load("<c:url value='/office/sparten/spartentable.html?orderby=id&status=0'/>");
		$('#sparten_dialog').load("<c:url value='/office/sparten/spartenedit.html?id=0'/>");
		$('#dialog_table_settings').load("<c:url value='/office/sparten/spartentablesettings.html'/>");
		
		// Dialogs
		
		$( "#sparten_dialog" ).dialog({
			autoOpen: false,
			height: 220,
			width: 500,
			modal: true,
			buttons: {
				"Speichern": function() {
				
					//alert($('form#sparten_edit_form').serialize());
					//$.post("<c:url value='/office/sparten/spartenajax.html' />", $("form#sparten_edit_form").serialize(), function(result){
					//		$('#sparten_dialog').load("<c:url value='/office/sparten/spartenedit.html?id=0'/>");});
					
					$.ajax({
						url: "<c:url value='/office/sparten/spartenajax.html' />",
						type: "POST",
						data: $("form#sparten_edit_form").serialize(),
						async: false,
						success: function(result){
							var ordering = $("#hidden_ordering").val();
							var status = $("#hidden_status").val();
							$('#sparten_table').load("<c:url value='/office/sparten/spartentable.html'/>" + "?orderby=" + ordering + "&status=" + status);
							$('#sparten_dialog').load("<c:url value='/office/sparten/spartenedit.html?id=0'/>");
						}
					});
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$('#sparten_dialog').load("<c:url value='/office/sparten/spartenedit.html?id=0'/>");
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
					$('#status_messages').load("<c:url value='/office/settings/settingsajax.html'/>" + "?which=tableColumnsSparten&value=" + result,
					function() {
						var ordering = $("#hidden_ordering").val();
						var status = $("#hidden_status").val();
						//alert( "Lade Sparte " + content_show + " | eigene: " + eigene); 
						// ?orderby=id&status=0'/>");
						$('#sparten_table').load("<c:url value='/office/sparten/spartentable.html'/>" + "?orderby=" + ordering + "&status=" + status);						
					});									
					
					//alert("result: " + result); 
					
					$( this ).dialog( "close" );
				},
				"Abbrechen": function() {
					$( this ).dialog( "close" );
					$('#dialog_table_settings').load("<c:url value='/office/sparten/spartentablesettings.html'/>");
				}
			}
		});
		
	});		 	
</script>
<div id="sparten_table"></div>
<div id="sparten_dialog" title="Neue Sparte"></div>
<div id="dialog_table_settings" title="Tabellen Einstellungen"></div>