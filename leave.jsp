<%-- 
    Document   : user_signin
    Created on : 8 Jan, 2021, 12:44:12 PM
    Author     : JAVA-JP
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String ID = session.getAttribute("uid").toString();
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    int i = st.executeUpdate("update member_reg set acc_status = 'Leaved' where id = '" + ID + "'");
    if (i != 0) {
        response.sendRedirect("index.jsp?A/c deactivated..!");
    } else {
        out.println("Revoke Error...");
    }
    List l = null;
%>