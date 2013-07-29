<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#activeItems, #inactiveItems { list-style-type: none; margin: 0; padding: 0; float: left; margin-right: 10px; }
	#activeItems li, #inactiveItems li { margin: 0 5px 5px 5px; padding: 5px; font-size: 1.0em; width: 170px; }
	#table_settings {width: 430px; float: left; }
	#table_settings_help {width: 200px; float:left; border: 1px dotted #ccc; margin-left: 5px; padding: 10px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$( "#activeItems, #inactiveItems" ).sortable({
			connectWith: ".connectedSortable"
		}).disableSelection();
	});
</script>
<div id="table_settings">
	<ul id="activeItems" class="connectedSortable">
		<c:forEach items="${activeItems}" var="active" varStatus="stat">
			<li id="<c:out value="${active.id}" />" class="ui-state-default"><c:out value="${active.name}" /></li>
		</c:forEach>
	</ul>
	
	<ul id="inactiveItems" class="connectedSortable">
		<c:forEach items="${inactiveItems}" var="inactive" varStatus="status">
			<li id="<c:out value="${inactive.id}" />" class="ui-state-highlight"><c:out value="${inactive.name}" /></li>
		</c:forEach>
	</ul>
</div>
<div id="table_settings_help">
	Bewegen (Drag & Drop) Sie die aktiven Elemente in die Spalte der inaktiven um die Anzeige 
	dieser in der Tabellenansicht zu deaktivieren.
	<br /><br />
	Um eine Element zu aktivieren bewegen Sie es von der rechten Spalte in die linke Spalte. 
</div>