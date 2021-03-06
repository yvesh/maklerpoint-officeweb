package de.maklerpoint.officeweb.Controller.Privatkunden;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import de.maklerpoint.office.Table.KundenUebersichtHeader;
import de.maklerpoint.officeweb.Userconfig.UserConfig;

@Controller
public class PrivatkundenTableSettingsController {	
	
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
	
	private Object[] activeItems;
    private Object[] inactiveItems;
	
	@RequestMapping(value="/office/privatkunden/privatkundentablesettings")	
    public ModelAndView showTableSettings() {
		
		String columnHeadsIds = UserConfig.getValue("tableColumnsPrivat", "3,4,7,10,11,12,13,17,20,21");
		String[] results = columnHeadsIds.split(",");
		
		activeItems = new Object[results.length];
		
		for(int i = 1; i <= results.length; i++) {
			String columnName = KundenUebersichtHeader.Columns[Integer.valueOf(results[i - 1].trim())];
			activeItems[i - 1] = new ColumnHead(columnName, Integer.valueOf(results[i - 1].trim()), true);
		}
		
		ArrayList al = new ArrayList();

        int ok = 1;

        for(int i = 0; i < KundenUebersichtHeader.Columns.length; i++)
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
            	if(KundenUebersichtHeader.Columns[i] != null)
            		al.add(new ColumnHead(KundenUebersichtHeader.Columns[i], i, false));
            }
        }
        
        inactiveItems = al.toArray();
        		
		ModelMap modelMap = new ModelMap();		
		//modelMap.addAttribute("kunde", kunde);
		
		modelMap.addAttribute("activeItems", activeItems);
		modelMap.addAttribute("inactiveItems", inactiveItems);
	
		return new ModelAndView("/office/privatkunden/privatkundentablesettings", modelMap);
	}
	
}