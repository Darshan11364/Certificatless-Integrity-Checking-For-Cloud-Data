<%-- 
    Document   : update_file1
    Created on : 27 Jan, 2021, 6:34:51 PM
    Author     : JAVA-JP
--%>

<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="javax.el.ELException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String fid = request.getParameter("fid");
    String fname = request.getParameter("filename");
    String update_file = request.getParameter("update_file");

    System.out.println("print value :");
    Connection conn = SQLconnection.getconnection();
    Statement st = conn.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);

    String letters = "0123457896";
    String hc1 = "";
    Random RANDOM = new SecureRandom();
    int PASSWORD_LENGTH = 9;
    for (int i = 0; i < PASSWORD_LENGTH; i++) {

        int index = (int) (RANDOM.nextDouble() * letters.length());

        hc1 += letters.substring(index, index + 1);

    }

    try {
        int i = st.executeUpdate("update data_files set enc_data='" + update_file + "', hashcode1='" + hc1 + "' WHERE id='"+fid+"'");
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("update_file.jsp?fid="+fid+"&fname="+fname+" msg=updated");
        } else {
            System.out.println("failed");
            response.sendRedirect("update_file.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

