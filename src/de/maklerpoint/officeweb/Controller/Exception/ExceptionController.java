package de.maklerpoint.officeweb.Controller.Exception;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.URLConnection;


import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Bugzilla.BugzillaReport;
import de.maklerpoint.office.System.Environment;
import de.maklerpoint.office.System.OsDetection;
import de.maklerpoint.officeweb.System.MPWebKonstanten;
import de.maklerpoint.officeweb.System.Webversion;


@Controller
public class ExceptionController {
	
	 public static final int LEVEL_INFO = 0;
	 public static final int LEVEL_HELP = 1;
	 public static final int LEVEL_WARNING = 2;
	 public static final int LEVEL_ERROR = 3;
	 public static final int LEVEL_FATAL = 4;

	@RequestMapping(value="/office/reportexception", method=RequestMethod.POST )	
    public ModelAndView reportException(ExceptionReportObj exobj, BindingResult bindingResult) {
		
		int bugid = reportBugzilla(exobj.getErrorMessage(), exobj.getStacktrace(), exobj.getErrorLevel());
		
		//      JOptionPane.showMessageDialog(null, "Die Fehlermeldung wurde erfolgreich mit der id \"" + bugid + "\" an uns ��bermittelt und in unserer Fehlerdatenbank angelegt. \n"
		//      + "Ihr Fehlerprotokoll finden Sie unter http://www.maklerpoint.de/bugzilla/show_bug.cgi?id=" + bugid + ". Vielen Dank f��r Ihre Unterst��tzung.");
		//		System.out.println("line: " + line);
		
		String message = "alert('Der Fehlerbericht wurde erfolgreich mit der Id " + bugid + 
		" in unserer Fehlerdatenbank angelegt. " + "Unter http://www.maklerpoint.de/bugzilla/show_bug.cgi?id=" + bugid + " k��nnen Sie sich ��ber den Status " +
		"informieren. Vielen Dank f��r Ihre Unterst��tztung!');";
		
		//System.out.println("message: " + message);
				
		return new ModelAndView("/office/reportexception", "message", message);
	}
	
	private int reportBugzilla(String summary, String description, int errorLevel){
//		System.out.println("Bug Report Zusammenfassung: " + summary);
//		System.out.println("Bug Report Beschreibung: " + description);
//		System.out.println("Bug Report Fehlerlevel: " + errorLevel);
		
		OsDetection.getOS();
		
		String os = "Windows";
        
        if(Environment.OS == Environment.FREEBSD)
            os = "Other";
        else if (Environment.OS == Environment.LINUX)
            os = "Linux";
        else if (Environment.OS == Environment.WINDOWS)
            os = "Windows";
        else if (Environment.OS == Environment.MACOSX)
            os = "Mac OS";
        else if (Environment.OS == Environment.SOLARIS)
            os = "Other";
        else
            os = "Other";

        String severity = "normal";

        if(errorLevel == LEVEL_FATAL)
            severity = "blocker";
        else if (errorLevel == LEVEL_WARNING)
            severity = "critical";
        else if (errorLevel == LEVEL_INFO)
            severity = "normal";
        
        BugzillaReport br = new BugzillaReport(MPWebKonstanten.BUGZILLA_URL,
        		MPWebKonstanten.BUGZILLA_USER, MPWebKonstanten.BUGZILLA_PASSWORD, 
        		MPWebKonstanten.BUGZILLA_PRODUCT, MPWebKonstanten.BUGZILLA_COMPONENT);
        
        br.login();
        // TODO update before beta release
        int bugid = br.createBugreport(summary, "alpha", description, os, "PC", severity);
        uploadLog(bugid);
        
        return bugid;
	}
	
	private void uploadLog(int bugid) {
        StringBuilder sb = new StringBuilder();

        try {
            sb.append(URLEncoder.encode("clientVersion", "UTF-8")).append("=").append(URLEncoder.encode(Webversion.version, "UTF-8"));
            sb.append("&");
            sb.append(URLEncoder.encode("clientBuild", "UTF-8")).append("=").append(URLEncoder.encode(Webversion.build_name, "UTF-8"));
            sb.append("&");
            sb.append(URLEncoder.encode("clientSerial", "UTF-8")).append("=").append(URLEncoder.encode("office web", "UTF-8"));
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
            sb.append("&");
            sb.append(URLEncoder.encode("databaseLog", "UTF-8")).append("=").append(URLEncoder.encode(readfile("/var/log/maklerpoint/office/framework.log"), "UTF-8"));
            sb.append("&");
            sb.append(URLEncoder.encode("defaultLog", "UTF-8")).append("=").append(URLEncoder.encode(readfile("/var/log/maklerpoint/office/basic.log"), "UTF-8"));

//            System.out.println(readfile(Config.LOG_DIR + File.separatorChar + "database.log"));

            URL url = new URL(MPWebKonstanten.MP_LOGUPURL);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(sb.toString());
            wr.flush();

            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            while ((line = rd.readLine()) != null) {
                if(line.contains("success")) {
//                    JOptionPane.showMessageDialog(null, "Die Fehlermeldung wurde erfolgreich mit der id \"" + bugid + "\" an uns ��bermittelt und in unserer Fehlerdatenbank angelegt. \n"
//                            + "Ihr Fehlerprotokoll finden Sie unter http://www.maklerpoint.de/bugzilla/show_bug.cgi?id=" + bugid + ". Vielen Dank f��r Ihre Unterst��tzung.");
//                System.out.println("line: " + line);
                }
            }

        } catch (java.net.ConnectException e) {
            Logger.getLogger(ExceptionController.class).warn("Konnte keine Verbindung zum MaklerPoint Server herstellen");
        } catch (UnsupportedEncodingException e) {
            Logger.getLogger(ExceptionController.class).warn("Fehler beim codieren des Fehlerprotokolls", e);
        } catch (MalformedURLException e) {
            Logger.getLogger(ExceptionController.class).warn("Fehler beim hochladen des Fehlerprotkolls", e);
        } catch (IOException e) {
            Logger.getLogger(ExceptionController.class).warn("Fehler beim hochladen des Fehlerprotkolls", e);
        }        
    }
	
	private String readfile(String filename) throws FileNotFoundException, IOException {
        try {
            StringBuilder sb = new StringBuilder();

            BufferedReader test = new BufferedReader(new FileReader(filename));
            String input = "";

            while((input = test.readLine()) != null) {
                sb.append(input).append("\n");
            }

            return sb.toString();
        } catch (Exception e) {
        	Logger.getLogger(getClass()).fatal("Fehler beim lesen der Datei: " + filename, e);
        }

        return null;
    }

}
