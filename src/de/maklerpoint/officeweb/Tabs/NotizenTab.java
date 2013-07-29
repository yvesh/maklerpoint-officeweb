package de.maklerpoint.officeweb.Tabs;

import de.maklerpoint.office.Benutzer.BenutzerObj;
import de.maklerpoint.office.Kunden.FirmenObj;
import de.maklerpoint.office.Kunden.KundenObj;
import de.maklerpoint.office.Versicherer.VersichererObj;
import de.maklerpoint.officeweb.Interfaces.TabsInterface;

public class NotizenTab implements TabsInterface{

	@Override
	public String getTabName() {
		return "Notizen";
	}

	@Override
	public String getTab(KundenObj kunde) {
		
		return null;
	}

	@Override
	public String getTab(FirmenObj firma) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTab(VersichererObj versicherer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getTab(BenutzerObj benutzer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String disable() {
		// TODO Auto-generated method stub
		return null;
	}

	private String drawHeader(){
		StringBuilder sb = new StringBuilder();
		sb.append("<script type=\"text/javascript\">");
		sb.append("$(document).ready(function(){");
		
		
		return sb.toString();
	}
	
	
}
