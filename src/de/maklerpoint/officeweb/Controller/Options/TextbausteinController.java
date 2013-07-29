package de.maklerpoint.officeweb.Controller.Options;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Registry.ToolsRegistry;
import de.maklerpoint.office.Textbausteine.TextbausteinGroupObj;
import de.maklerpoint.office.Textbausteine.TextbausteinObj;
import de.maklerpoint.office.Textbausteine.Tools.TextbausteineSQLMethods;
import de.maklerpoint.officeweb.Database.DBCon;

@Controller
public class TextbausteinController {

	// Textbausteine
	
	@RequestMapping("/office/textbausteine/textbausteine")
    public ModelAndView showTextbausteine() {
		try {			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("pageh1title", "Textbausteine Verwaltung");

	        return new ModelAndView("/office/textbausteine/textbausteine", modelMap);
	        
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden der Textbausteine", e);
			return new ModelAndView("/office/textbausteine/textbausteine");
		}
    }
	
	// Content
	
	@RequestMapping(value="/office/textbausteine/textbausteinecontent", method=RequestMethod.GET)
    public ModelAndView showTextbausteinecontent(@RequestParam("grp") int group, @RequestParam("id") int which) {
		try {						
			
			TextbausteinGroupObj[] tbgroups = TextbausteineSQLMethods.loadTextbausteinGroups(DBCon.open());
			TextbausteinObj[] tbsall = TextbausteineSQLMethods.loadTextbausteine(DBCon.open());
			
			TextbausteinObj[] tbs = null;
			
			if(group != 0)
				tbs = ToolsRegistry.getTextBausteine(group, true);
			else
				tbs = ToolsRegistry.getTextBausteine(tbgroups[0].getId(), true);
			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("tbgroups", tbgroups);
			modelMap.addAttribute("tbs", tbs);
			modelMap.addAttribute("tbsall", tbsall);
						
	        return new ModelAndView("/office/textbausteine/textbausteinecontent", modelMap);	        
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden des Textbaustein Contents", e);
			return new ModelAndView("/office/textbausteine/textbausteinecontent");
		}
    }
	
	// textbausteine
	
	@RequestMapping(value="/office/textbausteine/textbausteineshow", method=RequestMethod.GET)
    public ModelAndView showTextbausteineTB(@RequestParam("grp") int group) {
		try {						
						
			TextbausteinGroupObj[] tbgroups = ToolsRegistry.getTextBausteinGroups(false);
			TextbausteinObj[] tbs = null;
			
			if(group != 0)
				tbs = ToolsRegistry.getTextBausteine(group, true);
			else
				tbs = ToolsRegistry.getTextBausteine(tbgroups[0].getId(), true);
			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("tbs", tbs);
						
	        return new ModelAndView("/office/textbausteine/textbausteineshow", modelMap);	        
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden des Textbausteine Show Contents", e);
			return new ModelAndView("/office/textbausteine/textbausteineshow");
		}
    }
	
	@RequestMapping(value="/office/textbausteine/textbausteineshowtb", method=RequestMethod.GET)
    public ModelAndView showTextbausteineshowTB(@RequestParam("id") int id) {
		try {						
			TextbausteinObj tb = null;
			
			System.out.println("id: " + id);
			
			if(id != 0)
				tb = TextbausteineSQLMethods.getTextbaustein(DBCon.open(), id);
			else
				tb = new TextbausteinObj();
			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("tb", tb);
						
	        return new ModelAndView("/office/textbausteine/textbausteineshowtb", modelMap);	        
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden des Textbausteins", e);
			return new ModelAndView("/office/textbausteine/textbausteineshowtb");
		}
    }
	
}
