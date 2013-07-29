<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${updateAvailable == false}">
	Es ist keine Aktualisierung für Ihre Version von MaklerPoint Office Web vorhanden.<br />
	Ihr Produkt ist auf dem aktuellen Stand.
</c:if>
<c:if test="${updateAvailable == true}">
	<h1>Neue Version verfügbar</h1>
	Es ist eine neue Version von MaklerPoint Office Web verfügbar.<br /><br />
	<table cellspacing="0" cellpadding="2">
		<tr>
			<td width="180px">Neue Version:</td>
			<td>${updateVersion}</td>
		</tr>
		<tr>
			<td>Neuerungen (Changelog):</td>
			<td>${updateChangelog}</td>
		</tr>
		<tr>
			<td>Download:</td>
			<td>${updateFilepath}</td>
		</tr>
		<tr>
			<td>Dateigröße:</td>
			<td>${updateSize}</td>
		</tr>
		<tr>
			<td>MD5 Summe:</td>
			<td>${updateMd5}</td>
		</tr>		
	</table>
</c:if>