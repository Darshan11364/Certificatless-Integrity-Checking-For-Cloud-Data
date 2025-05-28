<%-- 
    Document   : access_grant
    Created on : sept 30 , 2020, 5:14:44 AM
    Author     : Lenovo
--%>

<%@page import="Networks.Mail"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fid = request.getParameter("fid");
    String time = request.getParameter("time");
    String mail = request.getParameter("mail");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update request set status='Approved' where fid='" + fid + "' AND time='" + time + "'");
        System.out.println("test print==" + fid);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from data_files where id = '" + fid + "' ");
            if (rs.next()) {
                String fname = rs.getString("filename");
                String dkey = rs.getString("dkey");
                String msggg = "Your File Access Request is Appoved! \nFilename : "+fname+"\nSecret Key to Access File : " + dkey;
                Mail ma = new Mail();
                ma.secretMail(msggg, "SecretKey", mail);
                String msg = "Secret:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("Requested_files.jsp?Approved");
            } else {
                System.out.println("failed");
                response.sendRedirect("Requested_files.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
