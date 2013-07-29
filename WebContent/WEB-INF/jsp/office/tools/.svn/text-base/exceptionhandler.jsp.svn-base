<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
			$("#stacktrace").accordion({
				active: false,
				collapsible: true
			});

			$("#btnFehlerSenden").button({
				icons: {primary: "fehlerberichtIcon"}
			});

			$("#btnFehlerSenden").click(function () {
				loading_show();
				$.ajax({
					url: "<c:url value='/office/reportexception.html' />",
					type: "POST",
					data: $("form#form_reportex").serialize(),
					async: false,
					success: function(data) {
						$('#report_result').html(data);
					}
				});
				loading_hide();
			});
	});
</script>
<div id="exception_dialog_holder">
	<h2>Während dem ausführen der Anwendung ist ein Fehler aufgetretten</h2><br />
	<table>
		<tr>
			<td width="140px"><strong>Fehler:</strong></td>
			<td>${exMessage}</td>
		</tr>
	</table>
	<br />
	<div id="stacktrace">
		<h3><a href="#">Details</a></h3>
		<div>
			<p>
				${exStack}
			</p>
		</div>
	</div>
	<div style="width: 100%; text-align: right; padding-top: 10px; padding-right: 10px;">
	<button id="btnFehlerSenden">Fehlerbericht senden</button>
	</div>
</div>
<form id="form_reportex">
	<input type="hidden" name="stacktrace" id="hidden_stacktrace" value="${exStack}" />
	<input type="hidden" name="errorTitle" id="hidden_extitle" value="${exTitle}" />
	<input type="hidden" name="errorMessage" id="hidden_exmessage" value="${exMessage}" />
	<input type="hidden" name="errorLevel" id="hidden_exlevel" value="4" />
</form>
<div id="report_result">
</div>
