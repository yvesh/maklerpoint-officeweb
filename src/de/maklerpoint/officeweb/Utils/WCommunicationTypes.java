package de.maklerpoint.officeweb.Utils;

public class WCommunicationTypes {

	public static final int UNKNOWN = -1;
    public static final int TELEFON = 0;
    public static final int TELEFON2 = 1;
    public static final int TELEFON_BERUFLICH = 2;
    public static final int TELEFON_PRIVAT = 3;
    public static final int FAX = 4;
    public static final int FAX2 = 5;
    public static final int FAX_BERUFLICH = 6;
    public static final int MOBIL = 7;
    public static final int MOBIL2 = 8;
    public static final int MOBIL_BERUFLICH = 9;
    public static final int EMAIL = 10;
    public static final int EMAIL2 = 11;
    public static final int EMAIL_BERUFLICH = 12;
    public static final int DURCHWAHL = 13;
    public static final int WEBSEITE = 14;
    public static final int WEBSEITE2 = 15;
	
	public static final Integer[] COMMUNICATION_INTARRAY = new Integer[]{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
	
     public static final String[] COMMUNICATIONTYPES = new String[]{"Telefon", "Telefon 2",
        "Telefon beruflich", "Telefon privat", "Fax", "Fax 2", "Fax beruflich", "Mobil",
        "Mobil 2", "Mobil beruflich", "E-Mail", "E-Mail 2", "E-Mail beruflich", "Durchwahl",
        "Webseite", "Webseite2"
     };
	
	  public static String getName(int id) {
	        switch(id) {

	            default:
	            case UNKNOWN:
	                return "Unbekannt";
	                
	            case TELEFON:
	                return "Telefon";
	                
	            case TELEFON2:
	                return "Telefon 2";
	                
	            case TELEFON_BERUFLICH:
	                return "Telefon beruflich";
	                
	            case TELEFON_PRIVAT:
	                return "Telefon privat";
	                
	            case FAX:
	                return "Fax";
	                
	            case FAX2:
	                return "Fax 2";
	                
	            case FAX_BERUFLICH:
	                return "Fax beruflich";
	                
	            case MOBIL:
	                return "Mobil";
	                    
	            case MOBIL2:
	                return "Mobil 2";
	                
	            case MOBIL_BERUFLICH:
	                return "Mobil beruflich";
	                
	            case EMAIL:
	                return "E-Mail";
	                
	            case EMAIL2:
	                return "E-Mail 2";
	                
	            case EMAIL_BERUFLICH:
	                return "E-Mail beruflich";
	                
	            case DURCHWAHL:
	                return "Durchwahl";
	                    
	            case WEBSEITE:
	                return "Webseite";

	            case WEBSEITE2:
	                return "Webseite 2";
	                
	        }
	    }
	
}
