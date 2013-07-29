package de.maklerpoint.officeweb.Controller.Exception;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.officeweb.Controller.Options.SpartenController;

@Controller
public class TimeoutController {

	@RequestMapping("/timeout")
    public ModelAndView showTimeout() {
		
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("pageh1title", "Session abgelaufen");

	    return new ModelAndView("/timeout", modelMap);	        		
    }
	
}
