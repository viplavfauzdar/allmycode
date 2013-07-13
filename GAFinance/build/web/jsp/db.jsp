<%@page import="java.sql.*"%><%@include file="logging.jsp"%><%
Connection con = null;
try {
	Class.forName("com.mysql.jdbc.Driver");		
	con = DriverManager.getConnection("jdbc:mysql://192.168.1.136:3306/cea","root", "betu1980");
	//con = DriverManager.getConnection("jdbc:mysql://127.5.108.2:3306/cea","admin7TPQJhb", "SyIh-ca3lt5R");
	System.out.println("Source database connection established!");
} catch (Exception e) {
	out.println(e);
	logger.severe(e.getMessage());
}
%>