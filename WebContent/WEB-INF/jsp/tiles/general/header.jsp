<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"
%><div id="header_top_menu">
	<a href="<c:url value='/office/mein-account.html'/>" title="Abmelden">Mein Account</a>
	<a href="<c:url value='/j_spring_security_logout'/>" title="Abmelden">Abmelden</a>	
</div>
<div id="header_logo">
	<div id="header_title_left">
		<h1><c:out value="${pageh1title}" /></h1>
	</div>
	<div id="header_logo_right">
		<img src="<c:url value='/media/images/logo-bottom.png'/>" />
	</div>
</div>