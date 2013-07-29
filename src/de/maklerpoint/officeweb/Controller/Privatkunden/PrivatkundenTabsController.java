package de.maklerpoint.officeweb.Controller.Privatkunden;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PrivatkundenTabsController {
	
	@RequestMapping(value="/office/privatkunden/privatkundentabs", method=RequestMethod.GET)	
    public ModelAndView showTabs(@RequestParam("kdnr") String kundennr) {
		ModelMap modelMap = new ModelMap();
		
		return new ModelAndView("/office/privatkunden/privatkundentabs", modelMap);
	}
	
}
