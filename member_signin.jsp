<%-- 
    Document   : user_signin
    Created on : 8 Jan, 2021, 12:44:12 PM
    Author     : JAVA-JP
--%>



<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    String pkey = request.getParameter("pkey");

    System.out.println("Check User name And Password : " + mail + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM member_reg where email='" + mail + "' AND private_key='" + pkey + "' AND password='" + pass + "' AND status='Approved' AND acc_status = 'Active' ");
        if (rs.next()) {
            session.setAttribute("uid", rs.getString("id"));
            session.setAttribute("uname", rs.getString("name"));
            session.setAttribute("umail", rs.getString("email"));
            session.setAttribute("ugrp", rs.getString("grp"));

            
            response.sendRedirect("Member_Home.jsp?Success");
        } else {
            response.sendRedirect("Member_login.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>