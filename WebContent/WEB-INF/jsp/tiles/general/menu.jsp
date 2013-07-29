<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul id="nav" class="dropdown dropdown-horizontal">
	<li><a href="<c:url value='/office/start.html' />">&Uuml;bersicht</a></li>
	<li><a href="#" class="dir"><span class="menu-title">Ansichten</span></a>
		<ul>
			<li><a href="<c:url value='/office/start.html' />">&Uuml;bersicht</a></li>
			<li><a href="<c:url value='/office/kalender/kalender.html' />" >Kalender</a></li>
			<li><a href="<c:url value='/office/karte/karte.html' />">Karte</a></li>
			<li><a href="<c:url value='/office/privatkunden/privatkunden.html' />">Privatkunden</a></li>
			<li><a href="<c:url value='/office/geschaeftskunden/geschaeftskunden.html' />">Gesch&auml;ftskunden</a></li>
			<li><a href="<c:url value='/office/statistiken/statistiken.html' />">Statistiken</a></li>
			<li><a href="<c:url value='/office/versicherer/versicherer.html' />">Versicherungsunternehmen</a></li>
			<li><a href="<c:url value='/office/versicherer/produkte/produkte.html' />">Produkte</a></li>
			<li><a href="<c:url value='/office/stoerfaelle/stoerfaelle.html' />">St&ouml;rfälle</a></li>
			<li><a href="<c:url value='/office/benutzer/benutzer.html' />">Benutzer Managment</a></li>		
		</ul>
	</li>
	<li><a href="#" class="dir"><span class="menu-title">Extras</span></a>
		<ul>
			<li class="empty">Marketing</li>
			<li><a href="<c:url value='/office/marketing/geburtstagsliste.html' />">Geburtstagsliste</a></li>
			<li><a href="<c:url value='/office/marketing/newsletter.html' />">Newsletter</a></li>
			<li><a href="<c:url value='/office/marketing/serienbrief.html' />">Serienbriefe</a></li>
			<li class="empty">Sonstiges</li>
			<li><a href="<c:url value='/office/beratungsdokumentation/beratungsdokumentation.html' />">Beratungsdokumentation</a></li>
			<li><a href="<c:url value='/office/notizen/notizen.html' />">Notizen</a></li>
			<li><a href="<c:url value='/office/poststelle/poststelle.html' />">Online Poststelle</a></li>
			<li><a href="<c:url value='/office/inkasso/mahnungen.html' />">Mahnungen</a></li>
			<li><a href="<c:url value='/office/inkasso/inkasso.html' />">Inkasso</a></li>
			<li><a href="<c:url value='/office/backup/backup.html' />">Sicherung</a></li>
			<li><a href="<c:url value='/office/backup/autobackup.html' />">Automatische Sicherungen</a></li>
			<li><a href="<c:url value='/office/benutzer/neuerbenutzer.html' />">Neuer Benutzer</a></li>
		</ul>
	</li>
	<li><a href="#" class="dir"><span class="menu-title">Optionen</span></a>
		<ul>
			<li><a href="<c:url value='/office/vorlagen/word.html' />">Word Vorlagen</a></li>
			<li><a href="<c:url value='/office/vorlagen/mail.html' />">E-Mail Vorlagen</a></li>
			<li><a href="<c:url value='/office/vorlagen/dokumente.html' />">Dokumente Vorlagen</a></li>
			<li><a href="<c:url value='/office/textbausteine/textbausteine.html' />">Textbausteine</a></li>
			<li><a href="<c:url value='/office/tags/tags.html' />">Markierungen (Tags) bearbeiten</a></li>
			<li><a href="<c:url value='/office/sparten/sparten.html' />">Sparten</a></li>
			<li><a href="<c:url value='/office/waehrungen/waehrungen.html' />">Währungen</a></li>
			<li><a href="<c:url value='/office/stammdaten/stammdaten.html' />">Stammdaten</a></li>
			<li><a href="<c:url value='/office/settings/einstellungen.html' />">Einstellungen</a></li>
		</ul>
	</li>	
	<li><a href="<c:url value='/office/hilfe.html' />" class="dir"><span class="menu-title">Hilfe</span></a>
		<ul>
			<li><a href="<c:url value='/office/hilfe.html' />">Offline Hilfe</a></li>
			<li><a href="<c:url value='/office/hilfe/changelog.html' />">Was ist neu?</a></li>
			<li><a target="_blank" href="http://www.maklerpoint.de/support">Online Support</a></li>
			<li><a href="<c:url value='/office/hilfe/log.html' />">Fehlerprotokoll</a></li>
			<li><a href="<c:url value='/office/hilfe/update.html' />">Nach Updates suchen</a></li>
			<li><a href="<c:url value='/office/hilfe/lizenz.html' />">Lizenzinformationen</a></li>
			<li><a href="<c:url value='/office/hilfe/about.html' />">Über..</a></li>
		</ul>
	</li>
</ul>
<div id="header_menu_search">
	<input type="text" name="allsearch" id="allsearch" class="inputbox" value="Suche..." 
					onblur="if(this.value=='') this.value='Suche...';" 
					onfocus="if(this.value=='Suche...') this.value='';"> 
	<select name="comboallsearch" id="comboallsearch" style="width: 150px; height: 25px; margin: 0 5px;">
		<option value="-1" >Allen Inhalten</option>
		<option value="0" >Kunden (alle)</option>
		<option value="1" >Kindern</option>
		<option value="2" >Aufgaben</option>
		<option value="3" >Terminen</option>
		<option value="4" >Verträgen</option>
		<option value="5" >Versicherungen</option>
		<option value="6" >Produkten</option>
		<option value="7" >Benutzern</option>
		<option value="8" >Nachrichten</option>
		<option value="9" >Dokumenten</option>
		<option value="10" >Privatkunden</option>
		<option value="11" >Geschäftskunden</option>
	</select>
	<button id="btnallSearch">Suchen</button>
</div>