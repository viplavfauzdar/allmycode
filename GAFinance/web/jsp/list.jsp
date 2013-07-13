<%-- 
    Document   : list
    Created on : Jul 12, 2013, 5:43:44 PM
    Author     : Viplav
--%>

<%@page trimDirectiveWhitespaces="true"%><%@include file="db.jsp"%><%
    logger.info(request.getQueryString());
    //Connection con = null;
    String header = "", result = "", rows = "";
    try {
        //	Class.forName("com.mysql.jdbc.Driver");		
        //	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cea","root", "betu1980");
        logger.info("Source database connection established!");
        java.sql.Statement smt = con.createStatement();
        String qry = "select logid, case when deletedind=0 then logname else logname+'*' end logname from agentinfo order by logname";
        logger.info(qry);
        ResultSet rs = smt.executeQuery(qry);
        out.print("<?xml version='1.0' encoding='iso-8859-1'?>\n<data>");
        while (rs.next()) {
            out.print("\n<item value=\"" + maskNulls(rs.getString(1)) + "\" label=\"" + maskNulls(rs.getString(2)) + "\"/>");
        }
    } catch (Exception e) {
        out.println(e);
        logger.severe("Error: " + e);
    } finally {
        try {
            if (con != null) {
                con.close();
            }
            logger.info("Source database connection closed!");
        } catch (Exception e) {
        }
    }
    out.print("\n</data>");
%>