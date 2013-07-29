<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty param.login_error}">
	<font color="red"> Ihr Anmelde Versuch war nicht erfolgreich.
		Bitte versuchen Sie es erneut.<br /> Grund: <c:out
			value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />. </font>
			<br />
</c:if>

<form name="f" action="<c:url value='j_spring_security_check'/>" method="POST" data-ajax="false">
	<div data-role="fieldcontain">
	    <label for="j_username">Benutzername:</label>
	    <input type="text" name="j_username" id="j_username" 
		    value='<c:if test="${not empty param.login_error}">
		    <c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>' />
		    	    
	    <label for="j_password">Passwort:</label>
	    <input type="password" name="j_password" id="j_password" value="" />
	
	 	<fieldset data-role="controlgroup">
			<input type="checkbox" name="_spring_security_remember_me" 
				id="_spring_security_remember_me" class="custom" />
			<label for="_spring_security_remember_me">Wiedererkennen</label>
	    </fieldset>
	
	<button type="submit">Anmelden</button>
	</div>
</form>