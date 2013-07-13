<%@page import="java.util.logging.*"%>

<%
//get the logger from session and if it doesnt exist the create a new one
Logger logger = (Logger)session.getAttribute("logger");
if(logger!=null){ 
	logger.info("using existing logger from session...");
}else{
	logger = Logger.getLogger(this.getClass().getName());
	java.io.FileInputStream configFile = null;
	try {
		logger.setLevel(Level.ALL);
		logger.info("initializing - trying to load logging configuration file ...");
		configFile = new java.io.FileInputStream("C:/Users/Viplav/Documents/NetBeansProjects/GAFinance/web/properties/logging.properties");
		//configFile = new java.io.FileInputStream("/var/lib/openshift/51c5a0114382ecd341000226/jbossews/webapps/cea/properties/logging.properties");
		LogManager logmanager = LogManager.getLogManager();
		logmanager.readConfiguration(configFile);
		logmanager.addLogger(logger);
		logger.info("logging file successfully created!");
		//out.println("logging file successfully created! Level: " + logger.getLevel() +logmanager.getProperty("level"));
		logger.config("config message");
		logger.fine("fine message");
		session.setAttribute("logger",logger);
	} catch (Exception e) {
		logger.log(Level.SEVERE, "Error: ", e);
		out.println(e);
	} finally {
		try {
			if (configFile != null)
				configFile.close();
		} catch (Exception e) {
			logger.log(Level.SEVERE, "Error: ", e);
			out.println(e);
		}
	}
}
%>
<%!
public String maskNulls(String str){
	if(str==null) str = "";
	return str;
}%>