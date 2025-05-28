<%-- 
    Document   : AccessRequest
    Created on : Sep 20, 2020, 5:17:36 AM
    Author     : Lenovo
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String aid = request.getParameter("aid");
    String fid = request.getParameter("fid");
    String filename = request.getParameter("fname");
    String hashcode = request.getParameter("hash");
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        int i = st.executeUpdate("Update audit_request set status='Verified' where id='" + aid + "' ");
        if (i != 0) {
            response.sendRedirect("audit_verify.jsp?fid="+fid+"&fname="+filename+"&hash="+hashcode);

        } else {
            response.sendRedirect("Auditing_request.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
