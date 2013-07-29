package de.maklerpoint.officeweb.Controller.Mobile;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class MobileIndexController {

	@RequestMapping("/m/login")
    public ModelAndView showUebersichts() {
 
		ModelMap modelMap = new ModelMap();							
		modelMap.addAttribute("pageh1title", "Übersicht");
		
        return new ModelAndView("/m/login", modelMap);
    }
	
}
