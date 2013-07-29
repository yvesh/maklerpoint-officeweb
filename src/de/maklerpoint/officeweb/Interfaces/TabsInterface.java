package de.maklerpoint.officeweb.Interfaces;

import de.maklerpoint.office.Benutzer.BenutzerObj;
import de.maklerpoint.office.Kunden.FirmenObj;
import de.maklerpoint.office.Kunden.KundenObj;
import de.maklerpoint.office.Versicherer.VersichererObj;

public interface TabsInterface {

	public String getTabName();
	
	public String getTab(KundenObj kunde);
	public String getTab(FirmenObj firma);
	public String getTab(VersichererObj versicherer);
    public String getTab(BenutzerObj benutzer);
	
    public String disable();
    
	
}
