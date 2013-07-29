package de.maklerpoint.officeweb.Controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.Logger;
import org.springframework.mobile.device.Device;
import org.springframework.mobile.device.site.SitePreference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.mobile.device.site.SitePreferenceUtils;

import de.maklerpoint.office.Logging.Log;
import de.maklerpoint.officeweb.Forms.LoginObj;

@Controller
public class IndexController {

	@RequestMapping(value={"/index", "/"})
    public ModelAndView showIndex(HttpServletRequest sr) {
        // LogFactory.getLog(IndexController.class).warn("test test test");
		
		SitePreference sitePreference = SitePreferenceUtils.getCurrentSitePreference(sr);
		
		if (sitePreference == SitePreference.MOBILE) {
			System.out.println("Mobile");
			return new ModelAndView("/m/login", "loginobj", new LoginObj());
		} else {
			System.out.println("Desktop");
			return new ModelAndView("index", "loginobj", new LoginObj());
		}		       
    }	
}