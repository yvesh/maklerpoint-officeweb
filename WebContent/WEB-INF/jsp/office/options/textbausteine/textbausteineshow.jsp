<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#selectable_bausteine .ui-selecting { background: #FECA40; }
	#selectable_bausteine .ui-selected { background: #F39814; color: white; }
	#selectable_bausteine { list-style-type: none; margin: 0; padding: 0; }
	#selectable_bausteine li { margin: 3px; padding: 0.4em; height: 18px; width: 80%}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#selectable_bausteine").selectable({
			selected: function() {
				var counter = 0;
				$(".ui-selected", this).each(function() {
					if(counter > 0){
						 $(this).removeClass("ui-selected");
						 return;
					}					
					counter++;	
				});				
			},
			stop: function(){
				$(".ui-selected", this).each(function(){
					var index = $( "#selectable_bausteine li" ).index( this );
					//alert($("#selectable_bausteine .ui-selected").attr("bid"));
					$('#textbausteine_stein').load("<c:url value='/office/textbausteine/textbausteineshowtb.html?id='/>" 
							+ $("#selectable_bausteine .ui-selected").attr("bid"));					
				});
			}
		});
	});
</script>
<span style="padding-left: 6px;">Textbausteine:</span><br /><br />
<ol id="selectable_bausteine">
	<c:if test="${empty tbs}"><li class="ui-widget-content">Keine Bausteine</li></c:if>
	<c:forEach var="tb" items="${tbs}" varStatus="status">
		<li class="ui-widget-content" bid="<c:out value="${tb.id}" />"><c:out value="${tb.name}" /></li>
	</c:forEach>
</ol>