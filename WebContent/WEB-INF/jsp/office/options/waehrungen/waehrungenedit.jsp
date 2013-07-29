<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	var update = <c:out value="${waehrungedit}" />;

	$(document).ready(function(){
		//alert("upd: " + update);
		
		if(update == true) {			
			$("#ui-dialog-title-waehrungen_dialog").text("<c:out value="${waehrungtitle}" />");
		}
	});

</script>
<form id="waehrungen_edit_form">
<div id="edit_popup_holder">
	<span style="padding-left: 15px; padding-bottom: 8px;"><strong></strong></span><br />
        <div class="abschnitt_holder_small">
        	 <table width="100%">
	        	<tr>
		        	<td width="150px">ISO-Code:</td>
		        	<td><input type="text" id="Isocode" name="Isocode" size="40" value="<c:out value="${waehrung.isocode}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td>Bezeichnung:</td>
		        	<td><input type="text" id="bezeichnung" name="bezeichnung" size="40" value="<c:out value="${waehrung.bezeichnung}" />" /></td>
		        </tr>
		         <tr>
		        	<td>Sortierung:</td>
		        	<td><input type="text" id="ordering" name="ordering" size="6" value="<c:out value="${waehrung.ordering}" />" /></td>
		        </tr>		        
		        <tr>
		        	<td colspan="2"><input type="checkbox" name="neuanlage" id="neuanlage" checked="<c:out value="${waehrung.neuanlage}" />"> Neuanlage</td>
		        </tr>		        	        
	        </table>
	        <input type="hidden" name="id" id="id" value="<c:out value="${waehrung.id}" />" />
        </div>	
</div>
</form>