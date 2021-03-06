package de.maklerpoint.officeweb.Controller.Options;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Sparten.SpartenObj;
import de.maklerpoint.office.Sparten.Tools.SpartenSQLMethods;
import de.maklerpoint.office.Table.SpartenUebersichtHeader;
import de.maklerpoint.officeweb.Database.DBCon;
import de.maklerpoint.officeweb.Userconfig.UserConfig;

@Controller
public class SpartenController {

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
	
	// Sparten
	
	@RequestMapping("/office/sparten/sparten")
    public ModelAndView showSparten() {
		try {			
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("pageh1title", "Sparten Verwaltung");

	        return new ModelAndView("/office/sparten/sparten", modelMap);
	        
		} catch (Exception e) {
			Logger.getLogger(SpartenController.class).fatal("Fehler beim Laden der Sparten", e);
			return new ModelAndView("/office/sparten/sparten");
		}
    }
	
	// Sparten Edit / Neu
	
	@RequestMapping(value="/office/sparten/spartenedit", method=RequestMethod.GET)	
    public ModelAndView showSpartenEdit(@RequestParam("id") int id) {
		try {
			boolean spartenedit = false;
			String sptitle = "Neue Sparte";
			SpartenObj sparte = null;
						
			if(id != 0){
				Logger.getLogger(getClass()).debug("Lade Sparte mit id: " + id);
				sparte = SpartenSQLMethods.getSparte(DBCon.open(), id);
				spartenedit = true;
				sptitle = sparte.getBezeichnung() + " (" + sparte.getSpartenNummer() + ") bearbeiten";
			} else {
				Logger.getLogger(getClass()).debug("Keine Sparte zum laden angegeben");
				sparte = new SpartenObj();
			}
			ModelMap modelMap = new ModelMap();
			
			modelMap.addAttribute("sparte", sparte);
			modelMap.addAttribute("spartenedit", spartenedit);
			modelMap.addAttribute("spartentitle", sptitle);
			
				
	        return new ModelAndView("/office/sparten/spartenedit", modelMap);
		} catch (Exception e) {
			Logger.getLogger(SpartenController.class).fatal("Fehler beim Laden der Sparte", e);
			return new ModelAndView("/office/sparten/spartenedit");
		}
	}
	
	// Table
	
	@RequestMapping(value="/office/sparten/spartentable", method=RequestMethod.GET)	
    public ModelAndView showSpartenTable(@RequestParam("orderby") String orderby, @RequestParam("status") int status) {
		try {
			orderby = orderby.trim().replaceAll("_", " ");
			
			Logger.getLogger(getClass()).debug("status: " + status + " | oderby: " + orderby);
			
			SpartenObj[] sparten = SpartenSQLMethods.loadSparten(DBCon.open(), orderby, status);
			
			String columnHeadsIds = UserConfig.getValue("tableColumnsSparten", "1,2,3,4");
			String[] results = columnHeadsIds.split(",");
			
			Object[] columnNames = new Object[results.length + 1];
			Object[][] data = null;
			
			columnNames[0] = "";
			
			for(int i = 1; i <= results.length; i++) {
				String columnName = SpartenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
				columnNames[i] = columnName;  
			}
			
			data = new Object[sparten.length][results.length + 1];
			
			for(int i=0; i < sparten.length; i++)
	        {
				SpartenObj sparte = sparten[i];
				
				data[i][0] = "<input type=\"checkbox\" name=\"check_" + sparte.getId() + "\" id=\"check_" 
								+ sparte.getId() + "\" value=\"" + sparte.getId() + "\">";
				
				for(int j = 1; j <= results.length; j++)
            	{
	            	int result = Integer.valueOf(results[j-1]);
	            	
	            	if(result == 0)
                        data[i][j] = sparte.getId();
                    else if (result == 1)
                        data[i][j] = sparte.getSpartenNummer();
                    else if (result == 2)
                        data[i][j] = sparte.getBezeichnung();
                    else if (result == 3)
                        data[i][j] = sparte.getGruppe();
                    else if (result == 4)
                        data[i][j] = sparte.getSteuersatz();
                    else if (result == 5)
                        data[i][j] = sparte.getStatus();
            	}				
	        }			
			
			ModelMap modelMap = new ModelMap();
			
			// current table layout
			modelMap.addAttribute("ordering", orderby);
			modelMap.addAttribute("status", status);
			
			modelMap.addAttribute("dataAll", data);
			modelMap.addAttribute("sparten", sparten);
			
			modelMap.addAttribute("datenCount", sparten.length + 1);
			
			modelMap.addAttribute("columnIds", results);
			modelMap.addAttribute("columnDBNames", SpartenUebersichtHeader.columnsId);
			modelMap.addAttribute("columnsWithField", SpartenUebersichtHeader.getColumnsWithField());
			
			modelMap.addAttribute("tableColumns", columnNames);
						
			return new ModelAndView("/office/sparten/spartentable", modelMap);
		} catch (Exception e) {
			Logger.getLogger(SpartenController.class).fatal("Fehler beim Laden der Spartentabelle", e);
			return new ModelAndView("/office/sparten/spartentable");
		}
	}
	
	// Table settings
	
	private Object[] activeItems;
    private Object[] inactiveItems;
    
    @RequestMapping(value="/office/sparten/spartentablesettings")	
    public ModelAndView showTableSettings() {
		
		String columnHeadsIds = UserConfig.getValue("tableColumnsSparten", "1,2,3,4");
		String[] results = columnHeadsIds.split(",");
		
		activeItems = new Object[results.length];
		
		for(int i = 1; i <= results.length; i++) {
			String columnName = SpartenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
			activeItems[i - 1] = new ColumnHead(columnName, Integer.valueOf(results[i - 1].trim()), true);
		}
		
		ArrayList al = new ArrayList();

        int ok = 1;

        for(int i = 0; i < SpartenUebersichtHeader.Columns.length; i++)
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
            	if(SpartenUebersichtHeader.Columns[i] != null)
            		al.add(new ColumnHead(SpartenUebersichtHeader.Columns[i], i, false));
            }
        }
        
        inactiveItems = al.toArray();
        		
		ModelMap modelMap = new ModelMap();		
		//modelMap.addAttribute("kunde", kunde);
		
		modelMap.addAttribute("activeItems", activeItems);
		modelMap.addAttribute("inactiveItems", inactiveItems);
	
		return new ModelAndView("/office/sparten/spartentablesettings", modelMap);
	}
	
    // Ajax Methods
    
    public static final int ARCHIVE = 0;
    public static final int DELETE = 1;
    
    @RequestMapping(value="/office/sparten/spartenajax", method=RequestMethod.GET)	
    public ModelAndView spartenAjax(@RequestParam("id") int id, @RequestParam("todo") int todo) {
		try {
			if(todo == ARCHIVE){
				SpartenSQLMethods.archiveFromSparten(DBCon.open(), id);
			} else if (todo == DELETE) {
				SpartenSQLMethods.deleteFromSparten(DBCon.open(), id);
			}
			
			//ModelMap modelMap = new ModelMap();
						
			return new ModelAndView("/office/sparten/spartenajax");
		} catch (Exception e) {
			Logger.getLogger(SpartenController.class).fatal("Fehler beim archivieren der Sparte(n)", e);
			return new ModelAndView("/office/sparten/spartenajax");
		}
	}
    
    // Ajax Post (update und new)
    
    @RequestMapping(value="/office/sparten/spartenajax", method=RequestMethod.POST)	
    public ModelAndView submitAjaxRequest(SpartenObj sparte, BindingResult bindingResult) {
		try {
			
			if(Logger.getLogger(getClass()).isDebugEnabled()){
				if(sparte.getId() != 0) {
					Logger.getLogger(SpartenController.class).debug("Aktualisiere bestehende Sparte");
					Logger.getLogger(SpartenController.class).debug("Sparte id: " + sparte.getId());
					Logger.getLogger(SpartenController.class).debug("Sparte Bezeichnung: " + sparte.getBezeichnung());
					Logger.getLogger(SpartenController.class).debug("Sparte Nummer: " + sparte.getSpartenNummer());
					Logger.getLogger(SpartenController.class).debug("Sparte Steuersatz: " + sparte.getSteuersatz());
					Logger.getLogger(SpartenController.class).debug("Sparte Gruppe: " + sparte.getGruppe());
				} else {
					Logger.getLogger(SpartenController.class).debug("Erstelle neue Sparte");
					Logger.getLogger(SpartenController.class).debug("Sparte Bezeichnung: " + sparte.getBezeichnung());
					Logger.getLogger(SpartenController.class).debug("Sparte Nummer: " + sparte.getSpartenNummer());
					Logger.getLogger(SpartenController.class).debug("Sparte Steuersatz: " + sparte.getSteuersatz());
					Logger.getLogger(SpartenController.class).debug("Sparte Gruppe: " + sparte.getGruppe());
				}
			}
			
			if(sparte.getId() == 0) {
				SpartenSQLMethods.insertIntosparten(DBCon.open(), sparte);				
			} else {
				SpartenSQLMethods.updatesparten(DBCon.open(), sparte);
			}
			
//			for(int i = 0; i < modelMap.size(); i++) {
//				System.out.println("mod i " + i + " = " + modelMap.values().toArray()[i]);
//			}
			
			//ModelMap modelMap = new ModelMap();
						
			return new ModelAndView("/office/sparten/spartenajax");
		} catch (Exception e) {
			Logger.getLogger(SpartenController.class).fatal("Fehler beim erstellen / aktualisieren der Sparte", e);
			return new ModelAndView("/office/sparten/spartenajax");
		}
	}
    
}
