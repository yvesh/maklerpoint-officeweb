package de.maklerpoint.officeweb.Controller.Privatkunden;

import java.sql.SQLException;
import java.text.SimpleDateFormat;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

import de.maklerpoint.office.Kunden.KundenObj;
import de.maklerpoint.office.Kunden.Tools.KundenSQLMethods;
import de.maklerpoint.office.Table.KundenUebersichtHeader;
import de.maklerpoint.officeweb.Database.DBCon;
import de.maklerpoint.officeweb.Forms.LoginObj;
import de.maklerpoint.officeweb.Userconfig.UserConfig;

@Controller
public class PrivatkundenController {	
	
	@RequestMapping("/office/privatkunden/privatkunden")	
    public ModelAndView showPrivatkunden() throws SQLException {
	
		//modelMap.addAttribute("eigeneKunden", KundenSQLMethods.loadEigeneKunden(arg0, arg1));

		ModelMap modelMap = new ModelMap();							
		modelMap.addAttribute("pageh1title", "Privatkunden ��bersicht");
		
        return new ModelAndView("/office/privatkunden/privatkunden", modelMap);
    }
	
}
