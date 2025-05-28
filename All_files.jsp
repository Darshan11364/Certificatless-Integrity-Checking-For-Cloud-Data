<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700;800&display=swap" rel="stylesheet">

        <title>Certificateless public integrity checking</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css">
        <link rel="stylesheet" href="assets/css/templatemo-seo-dream.css">
        <link rel="stylesheet" href="assets/css/animated.css">
        <link rel="stylesheet" href="assets/css/owl.css">
    </head>
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #1DA1F2;
            color: white;
        }
    </style>
    <style>
        div.ex1 {
            width: auto;
            height: auto;
            overflow: scroll;
        }
    </style>
    <body>

        <!-- ***** Preloader Start ***** -->
        <div id="js-preloader" class="js-preloader">
            <div class="preloader-inner">
                <span class="dot"></span>
                <div class="dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
        <!-- ***** Preloader End ***** -->

        <!-- ***** Header Area Start ***** -->
        <header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <nav class="main-nav">
                            <!-- ***** Logo Start ***** -->
                            <a class="logo">
                                <h4><img src="assets/images/logo-icon.png" alt=""></h4>
                            </a>
                            <!-- ***** Logo End ***** -->
                            <!-- ***** Menu Start ***** -->
                            <ul class="nav">
                                <li class="scroll-to-section"><a href="Member_Home.jsp">Home</a></li>
                                <li class="scroll-to-section"><a href="Upload_file.jsp">Upload File</a></li>
                                <li class="scroll-to-section"><a href="My_files.jsp">My Files</a></li>
                                <li class="scroll-to-section"><a class="active" href="All_files.jsp">All Files</a></li>
                                <li class="scroll-to-section"><a href="Requested_files.jsp">Requested Files</a></li>
                                <li class="scroll-to-section"><a href="download.jsp">Download</a></li>
                                <li class="scroll-to-section"><a href="audit_proof.jsp">Audit Proof</a></li>
                                <li class="scroll-to-section"><a href="leave_group.jsp">Leave</a></li>
                                <li class="scroll-to-section"><a href="index.jsp">Logout</a></li>
                            </ul>        
                            <a class='menu-trigger'>
                                <span>Menu</span>
                            </a>
                            <!-- ***** Menu End ***** -->
                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="left-content header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                                <h2>Certificateless Public Integrity Checking of Group Shared Data on Cloud Storage</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="about" class="about-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <center><h2><em>All Files</em></h2></center>
                        </div>   
                        <center>
                            <div class="ex1">
                                <table id="customers">
                                    <tr>
                                        <th>Data Owner Name</th>
                                        <th>File ID</th>
                                        <th>File Name</th>
                                        <th>Uploaded Time</th>
                                        <th>Action</th>
                                    </tr>
                                    <%
                                        String uid = (String) session.getAttribute("uid");
                                        String uname = (String) session.getAttribute("uname");
                                        String umail = (String) session.getAttribute("umail");
                                        String ugrp = (String) session.getAttribute("ugrp");
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                        try {
                                            ResultSet rs = st.executeQuery("SELECT * FROM data_files WHERE uid  !='" + uid + "' AND grp = '" + ugrp + "' ");
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%=rs.getString("uname")%></td>
                                        <td><%=rs.getString("id")%></td>
                                        <td><%=rs.getString("filename")%></td>
                                        <td><%=rs.getString("time")%></td>
                                        <td><a href="user_request.jsp?fid=<%=rs.getString("id")%>" class="btn btn-primary btn-fill" >Request</a></td>
                                    </tr>
                                    <%                                        }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }


                                    %>
                                </table>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <p>© 2023</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Scripts -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/animation.js"></script>
        <script src="assets/js/imagesloaded.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>
