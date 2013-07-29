package de.maklerpoint.officeweb.Controller.Privatkunden;

import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Benutzer.Tools.BenutzerSQLMethods;
import de.maklerpoint.office.Kunden.KundenObj;
import de.maklerpoint.office.Kunden.Tools.KundenSQLMethods;
import de.maklerpoint.office.Registry.BenutzerRegistry;
import de.maklerpoint.office.Table.KundenUebersichtHeader;
import de.maklerpoint.officeweb.Database.DBCon;
import de.maklerpoint.officeweb.Userconfig.UserConfig;
import de.maklerpoint.officeweb.Utils.WCommunicationTypes;

@Controller
public class PrivatkundenTableController {
    
    private SimpleDateFormat dftable = new SimpleDateFormat("dd.MM.yyyy HH:mm");
       
    public static final String[] imagenames = {
    	"telephone.png",
    	"telephone.png",
    	"telephone.png",
    	"telephone.png",
    	"telephone-fax.png",
    	"telephone-fax.png",
    	"telephone-fax.png",
    	"mobil.png",
    	"mobil.png",
    	"mobil.png",
    	"email.png",
    	"email.png",
    	"email.png",
    	"telephone.png",
    	"homepage.png",
    	"homepage.png"
    };
    
    public String createCommunicationIcon(int which){    
    	String image = "<img src=\"../../media/images/icons/communication/" 
    		+ imagenames[which] + "\" title=\"" + WCommunicationTypes.getName(which) + "\" style=\"vertical-align: middle\" /> ";
    	return image;
    }
    
	
	@RequestMapping(value="/office/privatkunden/privatkundentable", method= RequestMethod.GET)	
    public ModelAndView showIndex(@RequestParam("eigene") int eigene, @RequestParam("orderby") String orderby) {
		try {
			orderby = orderby.trim().replaceAll("_", " ");
				
			Logger.getLogger(getClass()).debug("eigene: " + eigene + " | oderby: " + orderby);
			
			String columnHeadsIds = UserConfig.getValue("tableColumnsPrivat", "3,4,7,10,11,12,13,17,20,21");
			String[] results = columnHeadsIds.split(",");
			
			Object[] columnNames = new Object[results.length + 1];
			Object[][] data = null;
			
			columnNames[0] = "";
			
			for(int i = 1; i <= results.length; i++) {
				String columnName = KundenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
				columnNames[i] = columnName;  
			}
						
			KundenObj[] alleKunden = null;
			
			if(eigene == 0)
				alleKunden = KundenSQLMethods.loadKunden(DBCon.open(), orderby, 0);
			else
				alleKunden = KundenSQLMethods.loadEigeneKunden(DBCon.open(), BenutzerSQLMethods.getBenutzer(DBCon.open(), SecurityContextHolder.getContext().getAuthentication().getName()), orderby, 0);
			
			
			data = new Object[alleKunden.length][results.length + 1];
			
			for(int i=0; i < alleKunden.length; i++)
	        {
				KundenObj kunde = alleKunden[i];
	            data[i][0] = "<input type=\"checkbox\" name=\"check_" + kunde.getKundenNr() + "\" id=\"check_" + kunde.getKundenNr() + "\" value=\"" + kunde.getKundenNr() + "\">";
	            
	            
	            for(int j = 1; j <= results.length; j++)
	            	{
		            		int result = Integer.valueOf(results[j-1]);
		            	 	if(result == 0)
		                        data[i][j] = kunde.getId();
		                    else if (result == 1)
		                        data[i][j] = BenutzerRegistry.getBenutzer(kunde.getCreatorId());
		                    else if (result == 2)
		                        data[i][j] = BenutzerRegistry.getBenutzer(kunde.getBetreuerId());
		                    else if (result == 3)
		                        data[i][j] = kunde.getKundenNr();
		                    else if (result == 4)
		                        data[i][j] = kunde.getAnrede();
		                    else if (result == 5)
		                        data[i][j] = kunde.getTitel();
		                    else if (result == 6)
		                        data[i][j] = kunde.getFirma();
		                    else if (result == 7)
		                        data[i][j] = kunde.getVorname();
		                    else if (result == 8)
		                        data[i][j] = kunde.getVorname2();
		                    else if (result == 9)
		                        data[i][j] = kunde.getVornameWeitere();
		                    else if (result == 10)
		                        data[i][j] = kunde.getNachname();
		                    else if (result == 11)
		                        data[i][j] = kunde.getStreet();
		                    else if (result == 12)
		                        data[i][j] = kunde.getPlz();
		                    else if (result == 13)
		                        data[i][j] = kunde.getStadt();
		                    else if (result == 14)
		                        data[i][j] = kunde.getBundesland();
		                    else if (result == 15)
		                        data[i][j] = kunde.getLand();
		                    else if (result == 16)
		                        data[i][j] = kunde.getAdresseZusatz();
		                    else if (result == 17) {
		                    	if(kunde.getCommunication1() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication1Type()) + kunde.getCommunication1();
		                    	else
		                    		data[i][j] = null;
		                    }else if (result == 18) {
		                    	if(kunde.getCommunication2() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication2Type()) + kunde.getCommunication2();
		                    	else
		                    		data[i][j] = null;
		                    } else if (result == 19) {
		                    	if(kunde.getCommunication3() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication3Type()) + kunde.getCommunication3();
		                    	else
		                    		data[i][j] = null;
		                    } else if (result == 20) {
		                    	if(kunde.getCommunication4() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication4Type()) + kunde.getCommunication4();
		                    	else
		                    		data[i][j] = null;
		                    } else if (result == 21) {
		                    	if(kunde.getCommunication5() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication5Type()) + kunde.getCommunication5();
		                    	else
		                    		data[i][j] = null;
		                    } else if (result == 22) {
		                    	if(kunde.getCommunication6() != null)
		                    		data[i][j] = createCommunicationIcon(kunde.getCommunication6Type()) + kunde.getCommunication6();
		                    	else
		                    		data[i][j] = null;
		                    }
//		                    else if (result == 17)
//		                        data[i][j] = kunde.getCommunication1();
//		                    else if (result == 18)
//		                        data[i][j] = kunde.getCommunication2();
//		                    else if (result == 19)
//		                        data[i][j] = kunde.getCommunication3();
//		                    else if (result == 20)
//		                        data[i][j] = kunde.getCommunication4();
//		                    else if (result == 21)
//		                        data[i][j] = kunde.getCommunication5();
//		                    else if (result == 22)
//		                        data[i][j] = kunde.getCommunication6();
		                    else if (result == 23)
		                        data[i][j] = "";
		                    else if (result == 24)
		                        data[i][j] = "";
		                    else if (result == 25)
		                        data[i][j] = "";
		                    else if (result == 26)
		                        data[i][j] = "";
		                    else if (result == 27)
		                        data[i][j] = "";
		                    else if (result == 28)
		                        data[i][j] = "";
		                    else if (result == 29)
		                        data[i][j] = kunde.getTyp(); // TODo
		                    else if (result == 30)
		                        data[i][j] = kunde.getFamilienStand();
		                    else if (result == 31)
		                        data[i][j] = kunde.getEhepartnerKennung(); // TODO
		                    else if (result == 32)
		                        data[i][j] = kunde.getGeburtsdatum();
		                    else if (result == 33)
		                        data[i][j] = kunde.getBeruf();
		                    else if (result == 34)
		                        data[i][j] = kunde.getBerufsTyp();
		                    else if (result == 35)
		                        data[i][j] = kunde.getBerufsOptionen();
		                    else if (result == 36)
		                        data[i][j] = kunde.isBeamter();
		                    else if (result == 37)
		                        data[i][j] = kunde.isOeffentlicherDienst();
		                    else if (result == 38)
		                        data[i][j] = kunde.getEinkommen();
		                    else if (result == 39)
		                        data[i][j] = kunde.getEinkommenNetto();
		                    else if (result == 40)
		                        data[i][j] = kunde.getSteuerklasse();
		                    else if (result == 41)
		                        data[i][j] = kunde.getKinderZahl();
		                    else if (result == 42)
		                        data[i][j] = kunde.getReligion();
		                    else if (result == 43)
		                        data[i][j] = kunde.getWeiterePersonen();
		                    else if (result == 44)
		                        data[i][j] = kunde.getWeiterePersonenInfo();
		                    else if (result == 45)
		                        data[i][j] = kunde.getFamilienPlanung();
		                    else if (result == 46)
		                        data[i][j] = kunde.getWerberKennung(); // TODO
		                    else if (result == 47)
		                        data[i][j] = "";
		                    else if (result == 48)
		                        data[i][j] = "";
		                    else if (result == 49)
		                        data[i][j] = "";
		                    else if (result == 50)
		                        data[i][j] = "";
		                    else if (result == 51)
		                        data[i][j] = "";
		                    else if (result == 52)
		                        data[i][j] = "";
		                    else if (result == 53)
		                        data[i][j] = kunde.getComments();
		                    else if (result == 54)
		                        data[i][j] = kunde.getCustom1();
		                    else if (result == 55)
		                        data[i][j] = kunde.getCustom2();
		                    else if (result == 56)
		                        data[i][j] = kunde.getCustom3();
		                    else if (result == 57)
		                        data[i][j] = kunde.getCustom4();
		                    else if (result == 58)
		                        data[i][j] = kunde.getCustom5();
		                    else if (result == 59)
		                        data[i][j] = kunde.getGeburtsname();
		                    else if (result == 60)
		                        data[i][j] = kunde.getEhedatum();
		                    else if (result == 61)
		                        data[i][j] = dftable.format(kunde.getCreated());
		                    else if (result == 62)
		                        data[i][j] = dftable.format(kunde.getModified());
		                    else if (result == 63)
		                        data[i][j] = kunde.getStatus();
	            	}
	        }
			
			int datencount = 0;
			int columncount = 0;
			
			if (alleKunden != null)
			  datencount = alleKunden.length;
			
			if(results != null)
				columncount = results.length + 1;
			
			ModelMap modelMap = new ModelMap();					
			
			modelMap.addAttribute("ordering", orderby);
			modelMap.addAttribute("eigene", eigene);
			modelMap.addAttribute("columnDBNames", KundenUebersichtHeader.columnsId);
			modelMap.addAttribute("columnsWithField", KundenUebersichtHeader.getColumnsWithField());
			modelMap.addAttribute("columnIds", results);
			modelMap.addAttribute("datenCount", datencount);
			modelMap.addAttribute("columnCount", columncount);
			modelMap.addAttribute("tableColumns", columnNames);
			modelMap.addAttribute("alleKunden", alleKunden);
			modelMap.addAttribute("dataAll", data);
			
        	return new ModelAndView("/office/privatkunden/privatkundentable", modelMap);
		} catch (Exception e) {
			Logger.getLogger(PrivatkundenTableController.class).fatal("Fehler beim Laden der Kundentabelle", e);
			return new ModelAndView("/office/privatkunden/privatkundentable");
		}
	}
}
