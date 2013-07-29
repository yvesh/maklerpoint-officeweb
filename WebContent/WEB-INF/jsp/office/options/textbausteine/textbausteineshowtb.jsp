<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="100%" cellspacing="0">
	<tr>
		<td>Name:</td>
		<td><input type="text" name="baustein_name" id="baustein_name" size="30" value="<c:out value="${tb.name}" />"></td>
	</tr>
	<tr>
		<td colspan="2">Text:<br />
		<textarea name="baustein_text" rows="6" cols="40"><c:out value="${tb.beschreibung}" /></textarea></td>
	</tr>
</table>

<input type="hidden" name="id" id="id" value="<c:out value="${tb.id}" />" />
<input type="hidden" name="gruppe" id="gruppe" value="" />