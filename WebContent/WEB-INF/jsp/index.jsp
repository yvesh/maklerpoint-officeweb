<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<form name="f" action="<c:url value='j_spring_security_check'/>" method="POST">
		<div id ="login_holder">
			<div id ="login_area">				
				<table width="350px">
					<tr>				        
				       <td colspan="2" ><span style="font-size: 13px; font-weight: 700; border-bottom: 1px dotted #ccc; display: block;">MaklerPoint Office Web - Anmeldung</span><br />
				       <c:if test="${not empty param.login_error}">
					      <font color="red">
					        Ihr Anmelde Versuch war nicht erfolgreich. Bitte versuchen Sie es erneut.<br/>
					        Grund: <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
					      </font>
		    		   </c:if>				       				      
				       </td>				       
				    </tr>
				    <tr>
				        <td>Benutzername</td>
				        <td><input type='text' name='j_username' value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>'/></td>
				    </tr>
				    <tr>
				        <td>Passwort</td>
				        <td><input type='password' name='j_password' /></td>
				    </tr>
				     <tr>
				        <td></td>
				        <td><input type="checkbox" name="_spring_security_remember_me">Wiedererkennen</td>
				    </tr>
				    <tr>
				        <td></td>
				        <td>
				            <input type="submit" type="submit" value="Anmelden"/>
				            <br />
				        </td>
			    	</tr>
				</table>
				<div id="login_logo">
				<a href="http://www.maklerpoint.de" title="MaklerPoint Software">
					<img src="<c:url value='/media/images/logo-top.png'/>" alt="MaklerPoint Office Web" />
				</a>
				</div>
			</div>
		</div>
	</form>
</div>