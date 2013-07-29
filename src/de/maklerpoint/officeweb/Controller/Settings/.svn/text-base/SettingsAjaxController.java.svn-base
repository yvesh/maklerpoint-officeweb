package de.maklerpoint.officeweb.Controller.Settings;

import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.officeweb.Userconfig.UserConfig;

@Controller
public class SettingsAjaxController {
	
	@RequestMapping(value="/office/settings/settingsajax", method=RequestMethod.GET)	
    public ModelAndView editSetting(@RequestParam("which") String which, @RequestParam("value") String value) {		
		ModelMap modelMap = new ModelMap();
		
		LogFactory.getLog(SettingsAjaxController.class).debug("Setzte Wert für: " + which + " | Wert: " + value);		
		UserConfig.setValue(which, value);
		
		return new ModelAndView("/office/settings/settingsajax", modelMap);
	}
	
}
