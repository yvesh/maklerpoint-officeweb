<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#kunden_edit_tabs").tabs();
		$( "#geburtsdatum" ).datepicker( $.datepicker.regional[ "de" ] );
		$( "#ehedatum" ).datepicker( $.datepicker.regional[ "de" ] );
	});
</script>
<script type="text/javascript">
	tinyMCE.init({
		language : "de",
		mode : "textareas",
		theme : "advanced",
        plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

     // Theme options
        theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
        theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
        theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
        //theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_statusbar_location : "bottom",
        theme_advanced_resizing : true
	});
</script>
<div id="kunden_edit_tabs">
	<ul>
        <li><a href="#kedittab-1"><span>Basisdaten</span></a></li>
        <li><a href="#kedittab-2"><span>Erweitert</span></a></li>
        <li><a href="#kedittab-3"><span>Kontaktdaten</span></a></li>
        <li><a href="#kedittab-4"><span>Beruf und Einkommen</span></a></li>
        <li><a href="#kedittab-5"><span>Steuer und Abgaben</span></a></li>
        <li><a href="#kedittab-6"><span>Sonstiges</span></a></li>
    </ul>
    <div id="kedittab-1">
    	<span style="padding-left: 15px; padding-bottom: 8px;"><strong>Persönliche Daten</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Kundennummer:</td>
		        	<td><input type="text" id="kdnr" size="20" value="<c:out value="${kunde.kundenNr}" />"/></td>
		        </tr>	        
		        <tr>
		        	<td>Anrede:</td>
		        	<td>
		        	<select name="combo_anrede" id="combo_anrede">
		        		<c:forEach items="${anreden}" var="anrede">				
							<option value="<c:out value="${anrede}" />"><c:out value="${anrede}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>
		        <tr>
		        	<td>Titel:</td>
		        	<td>
		        	<select name="combo_titel" id="combo_titel">
		        		<c:forEach items="${titel}" var="tit">				
							<option value="<c:out value="${tit}" />"><c:out value="${tit}" /></option>
						</c:forEach>
		        	</select>
		        	</td>
		        </tr>
	        	<tr>
		        	<td>Vorname:</td>
		        	<td><input type="text" id="vorname" size="40" value="<c:out value="${kunde.vorname}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Nachname:</td>
		        	<td><input type="text" id="nachname" size="40" value="<c:out value="${kunde.nachname}" />"/></td>
		        </tr>
	        </table>
        </div>
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Anschrift</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Strasse:</td>
		        	<td><input type="text" id="street" size="40" value="<c:out value="${kunde.street}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td>Zusatz:</td>
		        	<td><input type="text" id="zusatz" size="40" value="<c:out value="${kunde.adresseZusatz}" />" /></td>
		        </tr>
		        <tr>
		        	<td>PLZ / Ort:</td>
		        	<td><input type="text" id="plz" size="6" value="<c:out value="${kunde.plz}" />" /> 
		        		<input type="text" id="ort" size="30" value="<c:out value="${kunde.stadt}" />" />
		        	</td>
		        </tr>
	        	<tr>
		        	<td>Bundesland:</td>
		        	<td>
		        	<select name="combo_bundesland" id="combo_bundesland">
		        		<c:forEach items="${bundeslaender_deutschland}" var="bundesland">				
							<option value="<c:out value="${bundesland}" />"><c:out value="${bundesland}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>
		        <tr>
		        	<td>Land:</td>
		        	<td>
			        	<select name="combo_land" id="combo_land">
			        		<c:forEach items="${laender}" var="land">				
								<option value="<c:out value="${land}" />"><c:out value="${land}" /></option>
							</c:forEach>
			        	</select>
		        	</td>
		        </tr>
	        </table>
        </div>
         <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Weitere Angaben</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Geburtsdatum:</td>
		        	<td><input type="text" id="geburtsdatum" size="10" value="<c:out value="${kunde.geburtsdatum}" />" /></td>
		        </tr>	        
	        	<tr>
		        	<td>Nationalität:</td>
		        	<td>
		        	<select name="combo_nationalitaeten" id="combo_nationalitaeten">
		        		<c:forEach items="${nationalitaeten}" var="natio">				
							<option value="<c:out value="${natio}" />"><c:out value="${natio}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>		       
	        </table>
        </div>        
    </div>
    <div id="kedittab-2">
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Weitere Namen</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Geburtsname:</td>
		        	<td><input type="text" id="geburtsname" size="40" value="<c:out value="${kunde.geburtsname}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td width="180px">Zweiter Vorname:</td>
		        	<td><input type="text" id="zweiterVorname" size="40" value="<c:out value="${kunde.vorname2}" />"/></td>
		        </tr>
		        <tr>
		        	<td>Weitere Vornamen:</td>
		        	<td><input type="text" id="weitereVornamen" size="40" value="<c:out value="${kunde.vornameWeitere}" />" /></td>
		        </tr>
	        </table>
        </div>
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Angaben zum Haushalt</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Familienstand:</td>
		        	<td>
						<select name="combo_familienstand" id="combo_familienstand">
			        		<c:forEach items="${familienstand}" var="stand">				
								<option value="<c:out value="${stand}" />"><c:out value="${stand}" /></option>
							</c:forEach>
			        	</select>
					</td>
		        </tr>	        
		        <tr>
		        	<td>Rolle im Haus:</td>
		        	<td>
		        	<select name="combo_rollehaushalt" id="combo_rollehaushalt">
		        		<c:forEach items="${rollehaushalt}" var="rolleh">				
							<option value="<c:out value="${rolleh}" />"><c:out value="${rolleh}" /></option>
						</c:forEach>
		        	</select>
		        	</td>
		        </tr>
		        <tr>
		        	<td>Anzahl der Kinder:</td>
		        	<td>
		        	<select name="combo_kinder" id="combo_kinder">		        		
							<option value="Unbekannt">Unbekannt</option>
							<option value="Keine">Keine</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
		        	</select>
		        	</td>
		        </tr>
	        	<tr>
		        	<td><c:out value="labelKinder18" />:</td>
		        	<td>
		        		<select name="combo_kinderue18" id="combo_kinderue18">		        		
							<option value="Unbekannt">Unbekannt</option>
							<option value="Keine">Keine</option>
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
		        		</select>
		        	</td>
		        </tr>
		        <tr>
		        	<td>Weitere Personen im Haushalt:</td>
		        	<td><input type="text" id="weiterepersonen" size="40" value="<c:out value="${kunde.weiterePersonen}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Weitere Personen Info:</td>
		        	<td><input type="text" id="weiterepersoneninfo" size="40" value="<c:out value="${kunde.weiterePersonenInfo}" />"/></td>
		        </tr>
	        </table>
        </div>
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Angaben zum Partner</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Ehepartner:</td>
		        	<td>
			        	<select name="combo_ehepartner" id="combo_ehepartner">
			        		<option value="-1">Kein</option>
			        		<c:forEach items="${alleKunden}" var="item">				
								<option value="<c:out value="${item.kundenNr}" />"><c:out value="${item}" /></option>
							</c:forEach>
			        	</select>
		        	</td>
		        </tr>	        
		        <tr>
		        	<td width="180px">Datum der Eheschließung</td>
		        	<td><input type="text" id="ehedatum" size="20" value="<c:out value="${kunde.ehedatum}" />"/></td>
		        </tr>		       
	        </table>
        </div>
    </div>
    <div id="kedittab-3">
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Angaben zum Haushalt</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">
		        		<select name="combo_kontakt1" id="combo_kontakt1">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com1" size="30" value="<c:out value="${kunde.communication1}" />"/></td>
					</td>
		        </tr>	        
		        <tr>
		        	<td width="180px">
		        		<select name="combo_kontakt2" id="combo_kontakt2">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com2" size="30" value="<c:out value="${kunde.communication2}" />"/></td>
					</td>
		        </tr>
		        <tr>
		        	<td width="180px">
		        		<select name="combo_kontakt3" id="combo_kontakt3">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com3" size="30" value="<c:out value="${kunde.communication3}" />" /></td>
					</td>
		        </tr>
		        <tr>
		        	<td width="180px">
		        		<select name="combo_kontakt4" id="combo_kontakt4">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com4" size="30" value="<c:out value="${kunde.communication4}" />"/></td>
					</td>
		        </tr>
		        <tr>
		        	<td width="180px">
		        		<select name="combo_kontakt5" id="combo_kontakt5">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com5" size="30" value="<c:out value="${kunde.communication5}" />" /></td>
					</td>
		        </tr>
		        <tr>
		        	<td width="180px">
		        		<select name="combo_kontakt6" id="combo_kontakt6">
			        		<c:forEach items="${communicationTypes}" var="com" varStatus="status">				
								<option value="<c:out value="${status.index}" />"><c:out value="${com}" /></option>
							</c:forEach>
			        	</select>
			        	</td>
		        	<td>
						<td><input type="text" id="com6" size="30" value="<c:out value="${kunde.communication6}" />" /></td>
					</td>
		        </tr>
	        </table>
        </div>
        <br /><br />
    </div>
    <div id="kedittab-4">
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Beruf</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Berufsstatus:</td>
		        	<td>
			        	<select name="combo_berufsstatus" id="combo_berufsstatus">
			        		<c:forEach items="${berufsStatus}" var="item">				
								<option value="<c:out value="${item}" />"><c:out value="${item}" /></option>
							</c:forEach>
			        	</select>
		        	</td>
		        </tr>	        
		        <tr>
		        	<td>Besonderheiten:</td>
		        	<td>
		        	<select name="combo_berufsbesonderheiten" id="combo_berufsbesonderheiten">
		        		<c:forEach items="${berufsBesonderheiten}" var="item">				
							<option value="<c:out value="${item}" />"><c:out value="${item}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>
		        <tr>
		        	<td>Ausgeübter Beruf:</td>
		        	<td><input type="text" id="beruf" size="40" value="<c:out value="${kunde.beruf}" />"/></td>
		        </tr>
	        	<tr>
		        	<td>Arbeitgeber:</td>
		        	<td><input type="text" id="arbeitgeber" size="40" value="<c:out value="${kunde.firma}" />"/></td>
		        </tr>
		        <tr>
		        	<td>Anteil Bürotätigkeit:</td>
		        	<td>
			        	<select name="combo_buerotaetigkeit" id="combo_buerotaetigkeit">		        		
								<option value="Unbekannt">Unbekannt</option>
								<option value="100%">100 %</option>
								<option value="90%">90 %</option>
								<option value="80%">80 %</option>
								<option value="70%">70 %</option>
								<option value="60%">60 %</option>
								<option value="50%">50 %</option>
								<option value="40%">40 %</option>
								<option value="30%">30 %</option>
								<option value="20%">20 %</option>
								<option value="10%">10 %</option>
								<option value="0%">0 %</option>
			        	</select>		        	
		        	</td>
		        </tr>
		        <tr>
		        	<td colspan="2"><input type="checkbox" id="oeffentlicherdienst" /> Öffentlicher Dienst</td>
		        </tr>
		        <tr>
		        	<td colspan="2"><input type="checkbox" id="beamter" /> Beamter</td>
		        </tr>
	        </table>
        </div>
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Einkommen</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Jahreseinkommen (brutto):</td>
		        	<td><input type="text" id="jahreseinkommen_brutto" size="20" value="<c:out value="${kunde.einkommen}" />"/></td>
		        </tr>
		        <tr>
		        	<td width="180px">Jahreseinkommen (netto):</td>
		        	<td><input type="text" id="jahreseinkommen_netto" size="20" value="<c:out value="${kunde.einkommenNetto}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Beginn der Altersrente:</td>
		        	<td>
		        		<select name="combo_rentebeginn" id="combo_rentebeginn">		        		
								<option value="Unbekannt">Unbekannt</option>
								<option value="mit 67 Jahren">Mit 67 Jahren</option>
								<option value="mit 66 Jahren">Mit 66 Jahren</option>
								<option value="mit 65 Jahren">Mit 65 Jahren</option>
								<option value="mit 63 Jahren">Mit 63 Jahren</option>
								<option value="Früher">Früher</option>
			        	</select>		        	
		        	</td>
		        </tr>		       
	        </table>
        </div>
    </div>
    <div id="kedittab-5">
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Steuer und Abgaben</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Steuerart:</td>
		        	<td>
			        	<select name="combo_steuerart" id="combo_steuerart">
			        		<c:forEach items="${steuerArten}" var="item">				
								<option value="<c:out value="${item}" />"><c:out value="${item}" /></option>
							</c:forEach>
			        	</select>
		        	</td>
		        </tr>	        
		        <tr>
		        	<td>Steuerklasse:</td>
		        	<td>
		        	<select name="combo_steuerklasse" id="combo_steuerklasse">
		        		<c:forEach items="${steuerKlassen}" var="item">				
							<option value="<c:out value="${item}" />"><c:out value="${item}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>
		        <tr>
		        	<td>Religion:</td>
		        	<td><input type="text" id="religion" size="40" value="<c:out value="${kunde.religion}" />"/></td>
		        </tr>
	        	<tr>
		        	<td>Kirchensteuer:</td>
		        	<td>
		        		<select name="combo_steuerkirche" id="combo_steuerkirche">
			        		<c:forEach items="${steuerKirche}" var="item">				
								<option value="<c:out value="${item}" />"><c:out value="${item}" /></option>
							</c:forEach>
		        		</select>		
		        	</td>
		        </tr>
		        <tr>
		        	<td>Kinderfreibeträge:</td>
		        	<td>
			        	<select name="combo_kinderfreibetrag" id="combo_kinderfreibetrag">    		
								<option value="Unbekannt">Unbekannt</option>
								<option value="0">0</option>
								<option value="1,0">1,0</option>
								<option value="1,5">1,5</option>
								<option value="2,0">2</option>
								<option value="2,5">2,5</option>
								<option value="3">3</option>
								<option value="3,5">3,5</option>
								<option value="4">4</option>
								<option value="4,5">4,5</option>
								<option value="5">5</option>
								<option value="6">6,0</option>
			        	</select>		        	
		        	</td>
		        </tr>		        
	        </table>
        </div>
    </div>    
    <div id="kedittab-6">
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Kontakt</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Betreuer:</td>
		        	<td>
			        	<select name="combo_betreuer" id="combo_betreuer">
			        		<c:forEach items="${alleBenutzer}" var="item">				
								<option value="<c:out value="${item.id}" />"><c:out value="${item}" /></option>
							</c:forEach>
			        	</select>
		        	</td>
		        </tr>	        
		        <tr>
		        	<td>Geworben von:</td>
		        	<td>
		        	<select name="combo_werber" id="combo_werber">
		        			<option value="-1">Unbekannt</option>
		        		<c:forEach items="${alleKunden}" var="item">				
							<option value="<c:out value="${item.kundenNr}" />"><c:out value="${item}" /></option>
						</c:forEach>
		        	</select>		        	
		        	</td>
		        </tr>		        
	        </table>	        
        </div>
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Benutzerdefiniert</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>
		        	<td width="180px">Benutzerdefiniert 1:</td>
		        	<td><input type="text" id="custom1" size="40" value="<c:out value="${kunde.custom1}" />" /></td>
		        </tr>	        
		        <tr>
		        	<td>Benutzerdefiniert 2:</td>
		        	<td><input type="text" id="custom2" size="40" value="<c:out value="${kunde.custom2}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Benutzerdefiniert 3:</td>
		        	<td><input type="text" id="custom3" size="40" value="<c:out value="${kunde.custom3}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Benutzerdefiniert 4:</td>
		        	<td><input type="text" id="custom4" size="40" value="<c:out value="${kunde.custom4}" />" /></td>
		        </tr>
		        <tr>
		        	<td>Benutzerdefiniert 5:</td>
		        	<td><input type="text" id="custom5" size="40" value="<c:out value="${kunde.custom5}" />" /></td>
		        </tr>		        
	        </table>
        </div> 
        <br /><br />
        <span style="padding-left: 15px; padding-bottom: 8px;"><strong>Kommentare:</strong></span><br />
        <div class="abschnitt_holder">
	        <table width="100%">
	        	<tr>		        
		        	<td><TEXTAREA id="comments" COLS=70 ROWS=7><c:out value="${kunde.comments}" /></TEXTAREA></td>
		        </tr>	        		        	        
	        </table>
        </div> 
    </div>
</div>