<%-- 
    Document   : set_attribute
    Created on : Sep 29, 2020, 2:15:45 PM
    Author     : Lenovo
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String mail = request.getParameter("email");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("UPDATE member_reg SET status='Approved' WHERE id='" + id + "' ");
        System.out.println("Test print User ID ==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from member_reg where id = '" + id + "' ");
            if (rs.next()) {
                String PrivateKey = rs.getString("private_key");
                String msggg = "Hi, "+name+" Your Account has been Activated \nYour Private Key is " + PrivateKey;
                Mail ma = new Mail();
                ma.secretMail(msggg, "Account_Activated", mail);
                String msg = "Account Activated:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("member_details.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("member_details.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
