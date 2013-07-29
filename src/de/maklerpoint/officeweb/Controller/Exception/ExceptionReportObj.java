package de.maklerpoint.officeweb.Controller.Exception;

public class ExceptionReportObj {

	public ExceptionReportObj(){			
	}
	
	private int errorLevel = 0;
	
	private String errorMessage;
    private String errorTitle;
    private String stacktrace;
	
	public int getErrorLevel() {
		return errorLevel;
	}

	public void setErrorLevel(int errorLevel) {
		this.errorLevel = errorLevel;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public String getErrorTitle() {
		return errorTitle;
	}

	public void setErrorTitle(String errorTitle) {
		this.errorTitle = errorTitle;
	}

	public String getStacktrace() {
		return stacktrace;
	}

	public void setStacktrace(String stacktrace) {
		this.stacktrace = stacktrace;
	}
	
}
