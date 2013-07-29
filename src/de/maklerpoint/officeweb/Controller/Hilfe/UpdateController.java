package de.maklerpoint.officeweb.Controller.Hilfe;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import de.maklerpoint.office.System.Environment;
import de.maklerpoint.office.System.OsDetection;
import de.maklerpoint.officeweb.System.MPWebKonstanten;
import de.maklerpoint.officeweb.System.Webversion;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

@Controller
public class UpdateController {

	private boolean updateAvailable = false;
	private String updateVersion = null;
	private String updateChangelog = null;
	private String updateFilepath = null;
	private String updateMd5 = null;
	private String updateSize = null;
		
	private void checkUpdate() throws IOException {
		
		OsDetection.getOS(); // Hardcoded, kein start up (work around!)
		StringBuilder sb = new StringBuilder();		

        sb.append(URLEncoder.encode("clientVersion", "UTF-8")).append("=").append(URLEncoder.encode(Webversion.version, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientBuild", "UTF-8")).append("=").append(URLEncoder.encode(Webversion.build_name, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientSerial", "UTF-8")).append("=").append(URLEncoder.encode("MaklerPoint Office Web", "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientOS", "UTF-8")).append("=").append(URLEncoder.encode(String.valueOf(Environment.OS), "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientOSName", "UTF-8")).append("=").append(URLEncoder.encode(Environment.OS_NAME, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientOSArch", "UTF-8")).append("=").append(URLEncoder.encode(Environment.OS_ARCH, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientOSVersion", "UTF-8")).append("=").append(URLEncoder.encode(Environment.OS_VERSION, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientVMVendor", "UTF-8")).append("=").append(URLEncoder.encode(Environment.VM_VENDOR, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientVMVersion", "UTF-8")).append("=").append(URLEncoder.encode(Environment.VM_VERSION, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientUsername", "UTF-8")).append("=").append(URLEncoder.encode(Environment.USERNAME, "UTF-8"));
        sb.append("&");
        sb.append(URLEncoder.encode("clientUserdir", "UTF-8")).append("=").append(URLEncoder.encode(Environment.USERDIR, "UTF-8"));
		
        URL url = new URL(MPWebKonstanten.MP_UPDATEURL);
        URLConnection conn = url.openConnection();
        conn.setDoOutput(true);
        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
        wr.write(sb.toString());
        wr.flush();
        
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line;
        while ((line = rd.readLine()) != null) {
        	System.out.println("line: " + line);
        	
        	if(line.startsWith("update")) {
                this.updateAvailable = Boolean.valueOf(getResult(line));
            }

            if(line.startsWith("currentversion")) {
            	this.updateVersion = getResult(line);
            }

            if(line.startsWith("changelog")) {
            	this.updateChangelog = getResult(line);
            }

            if(line.startsWith("filepath")) {
            	this.updateFilepath = getResult(line);
            }

            if(line.startsWith("size")) {
            	this.updateSize = getResult(line);
            }

            if(line.startsWith("md5")) {
            	this.updateMd5 = getResult(line);
            }
        }
	}
	
	 private String getResult(String line) {
	     String[] result = line.split("=");
	     return result[1];
	 }
	
	@RequestMapping("/office/hilfe/update")
    public ModelAndView showUpdate() throws IOException {
		try {
			checkUpdate();
		} catch (java.net.ConnectException e) {			
			Logger.getLogger(getClass()).warn("Es konnte keine Verbindung zum MaklerPoint Updateserver hergestellt werden.", e);
			return new ModelAndView(new RedirectView("/office/offlinewarnung.html"));
		}
		
		ModelMap modelMap = new ModelMap();							
		modelMap.addAttribute("pageh1title", "Suche nach Updates..");
		
		//System.out.println("updavail: " + updateAvailable);
		modelMap.addAttribute("updateAvailable", updateAvailable);
		modelMap.addAttribute("updateVersion", updateVersion);
		modelMap.addAttribute("updateChangelog", updateChangelog);
		modelMap.addAttribute("updateFilepath", updateFilepath);
		modelMap.addAttribute("updateMd5", updateMd5);
		modelMap.addAttribute("updateSize", updateSize);
		
		return new ModelAndView("/office/hilfe/update", modelMap);
	}
	
}
