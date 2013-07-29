package de.maklerpoint.officeweb.Controller.Hilfe;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.officeweb.Controller.Privatkunden.PrivatkundenEditController;

@Controller
public class LogController {

	private String loadBasiclog() throws IOException{
		BufferedReader reader = new BufferedReader( new FileReader("/var/log/maklerpoint/office/basic.log"));
		String line = null;
		
		StringBuilder blog = new StringBuilder();
		
		while( ( line = reader.readLine() ) != null ) {
			blog.append( line );
			blog.append( "<br />" );
	    }
		
		reader.close();
		
		return blog.toString();
	}
	
	private String loadFrameworklog() throws IOException{
		BufferedReader reader = new BufferedReader( new FileReader("/var/log/maklerpoint/office/framework.log"));
		String line = null;
		
		StringBuilder blog = new StringBuilder();
		
		while( ( line = reader.readLine() ) != null ) {
			blog.append( line );
			blog.append( "<br />" );
	    }
		
		reader.close();
		
		return blog.toString();
	}
	
	@RequestMapping("/office/hilfe/log")
    public ModelAndView showLog() {
		try {
			ModelMap modelMap = new ModelMap();
			
			
			
			
			modelMap.addAttribute("pageh1title", "Fehlerprotokoll");
			//modelMap.addAttribute("basiclog", blog.toString().replaceAll(System.getProperty("line.separator"), "<br />"));
			modelMap.addAttribute("basiclog", loadBasiclog());
			modelMap.addAttribute("frameworklog", loadFrameworklog());
			
			
			//System.out.println("log: " + blog.toString());
						
	        return new ModelAndView("/office/hilfe/log", modelMap);
	        
		} catch (Exception e) {
			Logger.getLogger(PrivatkundenEditController.class).fatal("Fehler beim Laden des Fehlerprotokolls", e);
			return new ModelAndView("/office/hilfe/log");
		}
    }
	
}
