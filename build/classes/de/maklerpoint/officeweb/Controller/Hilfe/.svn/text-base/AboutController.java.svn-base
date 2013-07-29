package de.maklerpoint.officeweb.Controller.Hilfe;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AboutController {

	@RequestMapping("/office/hilfe/about")
    public ModelAndView showAbout() {
 
		ModelMap modelMap = new ModelMap();							
		modelMap.addAttribute("pageh1title", "Über MaklerPoint Office Web");
		
        return new ModelAndView("/office/hilfe/about", modelMap);
    }	
}