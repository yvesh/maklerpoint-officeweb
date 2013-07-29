<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/JavaScript">
	setTimeout("location.href = '<c:url value='/index.html' />';",10000);
</script>
<div id="timeout_holder">
	<div id="timeout_area">
		<h2>Ihre Session ist abgelaufen (Timeout)</h2>
		<br />
		Aus Sicherheitsgründen wurde Sie automatisch nach 15 Minuten inaktivität abgemeldet. In den
		globalen Einstellungen können Sie diese Funktion deaktivieren oder auf einen längeren
		Zeitraum umstellen. Weitere Informationen über Sessions finden Sie hier.<br />
		<br />
		Sie werden in 10 Sekunden automatisch zur Anmeldungsseite weitergeleitet. 
		Klicken Sie <a href="<c:url value='/index.html' />" title="Zur Anmeldung">hier</a> 
		um sofort zur Anmeldung zu kommen.
	</div>
</div>