package de.maklerpoint.officeweb.Controller.Privatkunden;

import java.util.Calendar;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Konstanten.Anreden;
import de.maklerpoint.office.Konstanten.Beruf;
import de.maklerpoint.office.Konstanten.Bundeslaender;
import de.maklerpoint.office.Konstanten.Laender;
import de.maklerpoint.office.Konstanten.Steuer;
import de.maklerpoint.office.Konstanten.WeiteresKunden;

import de.maklerpoint.office.Kunden.KundenObj;
import de.maklerpoint.office.Kunden.Tools.KundenSQLMethods;
import de.maklerpoint.office.Registry.BenutzerRegistry;
import de.maklerpoint.office.Registry.KundenRegistry;
import de.maklerpoint.office.System.Status;
import de.maklerpoint.officeweb.Database.DBCon;
import de.maklerpoint.officeweb.Utils.WCommunicationTypes;

@Controller
public class PrivatkundenEditController {


	@RequestMapping(value="/office/privatkunden/privatkundenedit", method=RequestMethod.GET)	
    public ModelAndView showPrivatkundenEdit(@RequestParam("kdnr") String kundennr) {
		try {
			KundenObj kunde = null;
			
			if(!kundennr.equals("0")){
				Logger.getLogger(PrivatkundenEditController.class).debug("Lade Kunde zur Anzeige mit Kundennummer: " + kundennr);
				kunde = KundenSQLMethods.loadKunde(DBCon.open(), kundennr);
				Logger.getLogger(PrivatkundenEditController.class).debug("Kunden Nachname: " + kunde.getNachname());
			} else {
				Logger.getLogger(PrivatkundenEditController.class).debug("Kein Kunde zum laden agegeben, neuer Kunde");
				kunde = new KundenObj();
				//kunde = KundenSQLMethods.loadKunden(DBCon.open())[0]; // test
			}
			
			Calendar cal = Calendar.getInstance();
	        cal.setTime(new Date()); //heute
	        int jahr = cal.get(Calendar.YEAR) - 18;
			
			ModelMap modelMap = new ModelMap();		
			modelMap.addAttribute("kunde", kunde);
		
			modelMap.addAttribute("bundeslaender_deutschland", Bundeslaender.BUNDESLAENDER_DEUTSCHLAND);
			modelMap.addAttribute("bundeslaender_oestereich", Bundeslaender.BUNDESLAENDER_OESTERREICH);
			modelMap.addAttribute("bundeslaender_schweiz", Bundeslaender.BUNDESLAENDER_SCHWEIZ);
			
			modelMap.addAttribute("laender", Laender.LAENDER);
			modelMap.addAttribute("nationalitaeten", Laender.NATIONALITAETEN);
			
			modelMap.addAttribute("anreden", Anreden.ANREDEN);
			modelMap.addAttribute("titel", Anreden.TITEL);
			
			modelMap.addAttribute("berufsStatus", Beruf.BERUFS_STATUS);
			modelMap.addAttribute("berufsBesonderheiten", Beruf.BERUFS_BESONDERHEITEN);
			
			modelMap.addAttribute("steuerArten", Steuer.STEUER_ARTEN);
			modelMap.addAttribute("steuerKlassen", Steuer.STEUER_KLASSEN);
			modelMap.addAttribute("steuerKirche", Steuer.STEUER_KIRCHE);
			
			modelMap.addAttribute("labelKinder18", "Kinder vor " + jahr);
			
			modelMap.addAttribute("alleKunden", KundenRegistry.getKunden());
			modelMap.addAttribute("alleBenutzer", BenutzerRegistry.getAllBenutzer(Status.NORMAL));
			
			modelMap.addAttribute("familienstand", WeiteresKunden.FAMILIENSTAND);
			modelMap.addAttribute("rollehaushalt", WeiteresKunden.ROLLEHAUSHALT);
			
			modelMap.addAttribute("communicationTypes", WCommunicationTypes.COMMUNICATIONTYPES);
			//modelMap.addAttribute("communicationTypesInt", CommunicationTypes.COMMUNICATION_INTARRAY);
			
			return new ModelAndView("/office/privatkunden/privatkundenedit", modelMap);
		} catch (Exception e) {
			Logger.getLogger(PrivatkundenEditController.class).fatal("Fehler beim Laden des Kunden", e);
			return new ModelAndView("/office/privatkunden/privatkundenedit");
		}
	}
	
}
