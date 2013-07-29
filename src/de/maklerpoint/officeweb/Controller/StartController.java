package de.maklerpoint.officeweb.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.mobile.device.site.SitePreference;
import org.springframework.mobile.device.site.SitePreferenceUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.officeweb.Forms.LoginObj;

@Controller
public class StartController {

	@RequestMapping("/office/start")
    public ModelAndView showUebersichts(HttpServletRequest sr) {
 
		ModelMap modelMap = new ModelMap();							
		modelMap.addAttribute("pageh1title", "Übersicht");
		
		SitePreference sitePreference = SitePreferenceUtils.getCurrentSitePreference(sr);
		
		if (sitePreference == SitePreference.MOBILE) {
			return new ModelAndView("/m/start", modelMap);
		} else {
			return new ModelAndView("start", modelMap);
		}
	}
}