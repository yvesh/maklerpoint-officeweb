<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%>
<p align="center">
<h1>
	<c:if test="${pageh1title != null}" >
		<c:out value="${pageh1title}" />
	</c:if>
	<c:if test="${pageh1title == null}" >
		MaklerPoint Office - Anmeldung
	</c:if>
</h1>
</p>