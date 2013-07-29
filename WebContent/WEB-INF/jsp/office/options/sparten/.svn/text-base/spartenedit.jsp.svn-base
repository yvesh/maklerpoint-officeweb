<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	var update = <c:out value="${spartenedit}" />;

	$(document).ready(function(){
		//alert("upd: " + update);
		
		if(update == true) {			
			$("#ui-dialog-title-sparten_dialog").text("<c:out value="${spartentitle}" />");
		}
	});

</script>
<form id="sparten_edit_form">
<div id="edit_popup_holder">
	<span style="padding-left: 15px; padding-bottom: 8px;"><strong></strong></span><br />
        <div class="abschnitt_holder_small">
        	 <table width="100%">
	        	<tr>
		        	<td width="150px">Bezeichnung:</td>
		        	<td><input type="text" id="bezeichnung" name="bezeichnung" size="40" value="<c:out value="${sparte.bezeichnung}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td>Gruppe:</td>
		        	<td><input type="text" id="gruppe" name="gruppe" size="40" value="<c:out value="${sparte.gruppe}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Steuersatz:</td>
		        	<td>
		        		<input type="text" id="steuersatz" name="steuersatz" size="4" value="<c:out value="${sparte.steuersatz}" />" /> <strong> % </strong> 
		        		    Sparten Nummer: <input type="text" id="spartenNummer" name="spartenNummer" size="10" value="<c:out value="${sparte.spartenNummer}" />" />		        		 
		        	</td>
		        </tr>		        	        
	        </table>
	        <input type="hidden" name="id" id="id" value="<c:out value="${sparte.id}" />" />
        </div>	
</div>
</form>