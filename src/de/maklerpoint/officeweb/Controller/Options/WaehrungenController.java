package de.maklerpoint.officeweb.Controller.Options;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import de.maklerpoint.office.Waehrungen.WaehrungenObj;
import de.maklerpoint.office.Waehrungen.Tools.WaehrungenSQLMethods;
import de.maklerpoint.office.Table.WaehrungenUebersichtHeader;
import de.maklerpoint.office.Tools.BooleanTools;

import de.maklerpoint.officeweb.Database.DBCon;
import de.maklerpoint.officeweb.Userconfig.UserConfig;

@Controller
public class WaehrungenController {

	public class ColumnHead {

        private String _name;
        private int _id;
        private boolean _active;
        private String _type;

        public ColumnHead(String _name, int _id, boolean _active){
            this._name = _name;
            this._id = _id;
            this._active = _active;
        }

        public boolean isActive() {
            return _active;
        }

        public void setActive(boolean _active) {
            this._active = _active;
        }

        public int getId() {
            return _id;
        }

        public void setId(int _id) {
            this._id = _id;
        }

        public String getName() {
            return _name;
        }

        public void setName(String _name) {
            this._name = _name;
        }

        public String getType() {
            return _type;
        }

        public void setType(String _type) {
            this._type = _type;
        }

        @Override
        public String toString() {
            return this._name;
        }
    }
	
	// W��hrungen Haupt
	
	@RequestMapping("/office/waehrungen/waehrungen")
    public ModelAndView showWaehrungen() {
		try {			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("pageh1title", "W��hrungen Verwaltung");

	        return new ModelAndView("/office/waehrungen/waehrungen", modelMap);
	        
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden der W��hrungen", e);
			return new ModelAndView("/office/waehrungen/waehrungen");
		}
    }
	
	// Edit show
	
	@RequestMapping(value="/office/waehrungen/waehrungenedit", method=RequestMethod.GET)	
    public ModelAndView showWaehrungenEdit(@RequestParam("id") int id) {
		try {
			boolean waehrungedit = false;
			String waehrungtitle = "Neue W��hrung";
			WaehrungenObj waehr = null;
						
			if(id != 0){
				Logger.getLogger(getClass()).debug("Lade W��hrung mit id: " + id);
				waehr = WaehrungenSQLMethods.getWaehrung(DBCon.open(), id);
				waehrungedit = true;
				waehrungtitle = waehr.getBezeichnung() + " (" + waehr.getIsocode() + ") bearbeiten";
			} else {
				Logger.getLogger(getClass()).debug("Keine W��hrung zum laden angegeben");
				waehr = new WaehrungenObj();
			}
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("waehrung", waehr);
			modelMap.addAttribute("waehrungedit", waehrungedit);
			modelMap.addAttribute("waehrungtitle", waehrungtitle);
			
				
	        return new ModelAndView("/office/waehrungen/waehrungenedit", modelMap);
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim Laden der W��hrung", e);
			
			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("exception", e);
			modelMap.addAttribute("text", "Fehler beim Laden der W��hrung");
			
			return new ModelAndView("/office/exceptionhandler", modelMap);
		}
	}
	
	// Table
	
	@RequestMapping(value="/office/waehrungen/waehrungentable", method=RequestMethod.GET)	
    public ModelAndView showSpartenTable(@RequestParam("orderby") String orderby, @RequestParam("status") int status) throws SQLException {
//		try {
			orderby = orderby.trim().replaceAll("_", " ");
			
			Logger.getLogger(getClass()).debug("status: " + status + " | oderby: " + orderby);
			
			WaehrungenObj[] waehrungen = WaehrungenSQLMethods.loadWaehrungen(DBCon.open(), orderby, status);
			
			String columnHeadsIds = UserConfig.getValue("tableColumnsWaehrungen", "2,3,4,1");
			String[] results = columnHeadsIds.split(",");
			
			Object[] columnNames = new Object[results.length + 1];
			Object[][] data = null;
			
			columnNames[0] = "";
			
			for(int i = 1; i <= results.length; i++) {
				String columnName = WaehrungenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
				columnNames[i] = columnName;  
			}
			
			data = new Object[waehrungen.length][results.length + 1];
			
			for(int i=0; i < waehrungen.length; i++)
	        {
				WaehrungenObj waehr = waehrungen[i];
				
				data[i][0] = "<input type=\"checkbox\" name=\"check_" + waehr.getId() 
					+ "\" id=\"check_" + waehr.getId() + "\" value=\"" + waehr.getId() + "\">";
				
				for(int j = 1; j <= results.length; j++)
            	{
	            	int result = Integer.valueOf(results[j-1]);
	            	
	            	if(result == 0)
                        data[i][j] = waehr.getId();
                    else if (result == 1)
                        data[i][j] = waehr.getOrdering();
                    else if (result == 2)
                        data[i][j] = waehr.getIsocode();
                    else if (result == 3)
                        data[i][j] = waehr.getBezeichnung();
                    else if (result == 4) {
                        data[i][j] = BooleanTools.getBooleanJaNein(waehr.isNeuanlage());
                    }
                    else if (result == 5)
                        data[i][j] = waehr.getStatus();
            	}				
	        }
						
			ModelMap modelMap = new ModelMap();
			
			// current table layout
			modelMap.addAttribute("ordering", orderby);
			modelMap.addAttribute("status", status);
			
			modelMap.addAttribute("dataAll", data);
			modelMap.addAttribute("waehrungen", waehrungen);
			
			modelMap.addAttribute("datenCount", waehrungen.length + 1);
			
			modelMap.addAttribute("columnIds", results);
			modelMap.addAttribute("columnDBNames", WaehrungenUebersichtHeader.columnsId);
			modelMap.addAttribute("columnsWithField", WaehrungenUebersichtHeader.getColumnsWithField());
			
			modelMap.addAttribute("tableColumns", columnNames);
						
			return new ModelAndView("/office/waehrungen/waehrungentable", modelMap);
//		} catch (Exception e) {
//			Logger.getLogger(WaehrungenController.class).fatal("Fehler beim Laden der W��hrungstabelle", e);
//			
//			ModelMap modelMap = new ModelMap();
//			modelMap.addAttribute("exception", e);
//			modelMap.addAttribute("text", "Fehler beim Laden der W��hrungstabelle");
//			
//			//return new ModelAndView(new RedirectView("/office/exceptionhandler"));
//			
//			//return new ModelAndView("/office/exceptionhandler", modelMap);
//			
//			return new ModelAndView("forward:/office/exceptionhandler.html");
//		}
	}
	
	// Table settings
	
	private Object[] activeItems;
    private Object[] inactiveItems;
    
    @RequestMapping(value="/office/waehrungen/waehrungentablesettings")	
    public ModelAndView showTableSettings() {
		
		String columnHeadsIds = UserConfig.getValue("tableColumnsWaehrungen", "2,3,4,1");
		String[] results = columnHeadsIds.split(",");
		
		activeItems = new Object[results.length];
		
		for(int i = 1; i <= results.length; i++) {
			String columnName = WaehrungenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
			activeItems[i - 1] = new ColumnHead(columnName, Integer.valueOf(results[i - 1].trim()), true);
		}
		
		ArrayList al = new ArrayList();

        int ok = 1;

        for(int i = 0; i < WaehrungenUebersichtHeader.Columns.length; i++)
        {
            ok = 0;
            for(int j = 0; j < results.length; j++)
            {
                if(Integer.valueOf(results[j]) == i)
                {
                    ok = 1;
                }
            }
            if(ok == 0)
            {
            	if(WaehrungenUebersichtHeader.Columns[i] != null)
            		al.add(new ColumnHead(WaehrungenUebersichtHeader.Columns[i], i, false));
            }
        }
        
        inactiveItems = al.toArray();
        		
		ModelMap modelMap = new ModelMap();		
		//modelMap.addAttribute("kunde", kunde);
		
		modelMap.addAttribute("activeItems", activeItems);
		modelMap.addAttribute("inactiveItems", inactiveItems);
	
		return new ModelAndView("/office/waehrungen/waehrungentablesettings", modelMap);
	}
    
    // Ajax Methods
    
    public static final int ARCHIVE = 0;
    public static final int DELETE = 1;
    
    @RequestMapping(value="/office/waehrungen/waehrungenajax", method=RequestMethod.GET)	
    public ModelAndView waehrungenAjax(@RequestParam("id") int id, @RequestParam("todo") int todo) {
		try {
			if(todo == ARCHIVE){
				WaehrungenSQLMethods.archiveFromWaehrungen(DBCon.open(), id);
			} else if (todo == DELETE) {
				WaehrungenSQLMethods.deleteFromWaehrungen(DBCon.open(), id);
			}
			
			//ModelMap modelMap = new ModelMap();
						
			return new ModelAndView("/office/waehrungen/waehrungenajax");
		} catch (Exception e) {
			Logger.getLogger(getClass()).fatal("Fehler beim archivieren der W��hrung(en)", e);
			return new ModelAndView("/office/waehrungen/waehrungenajax");
		}
	}
	
}