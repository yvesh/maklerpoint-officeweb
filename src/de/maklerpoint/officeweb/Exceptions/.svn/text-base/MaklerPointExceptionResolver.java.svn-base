package de.maklerpoint.officeweb.Exceptions;


import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;



public class MaklerPointExceptionResolver extends SimpleMappingExceptionResolver {

	private Logger log = Logger.getLogger(getClass());
	
	@Override
    protected ModelAndView doResolveException(HttpServletRequest request, 
    		HttpServletResponse response, Object handler, Exception ex) {
		log.fatal("Ein Fehler ist in der Anwendung aufgetretten (Genereller Fehler)", ex);
		
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);
		
		ex.printStackTrace(pw);
		
		ModelMap mm = new ModelMap();
		
		mm.addAttribute("pageh1title", "Fehler");
		mm.addAttribute("request", request);
		mm.addAttribute("response", response);
		mm.addAttribute("handler", handler);		
		mm.addAttribute("exMessage", ex);
		mm.addAttribute("exStack", sw.toString());
		mm.addAttribute("exTitle", ex.getCause());
		mm.addAttribute("exception", ex);
		
		return new ModelAndView("/office/exceptionhandler", mm);
	}
	
	
	
}
