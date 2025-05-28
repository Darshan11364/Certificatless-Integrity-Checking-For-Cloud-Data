<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM
    Author     : JAVA-JP
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
                                <li class="scroll-to-section"><a href="PV_Home.jsp">Home</a></li>
                                <li class="scroll-to-section"><a class="active" href="Auditing_reqeust.jsp">Auditing Request</a></li>
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
                                <h2>Certificateless public integrity checking of group shared data on cloud storage</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><div id="contact" class="contact-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 wow fadeInUp" data-wow-duration="0.5s" data-wow-delay="0.25s">
                        <form id="contact"  onsubmit="return checkForm(this);" method="post">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-3">
                                    <div class="section-heading">
                                        <h2>Audit<em> Verify</em></h2>
                                    </div>
                                </div>
                                <%
                                    String fid = request.getParameter("fid");
                                    String filename = request.getParameter("fname");
                                    String hashcode = request.getParameter("hash");
                                    System.out.println("File ID : " + fid);
                                    Connection con = SQLconnection.getconnection();
                                    Statement st = con.createStatement();
                                    Statement st1 = con.createStatement();
                                    try {

                                        ResultSet rs = st1.executeQuery("Select * from data_files where id = '" + fid + "' ");
                                        if (rs.next()) {
                                %>
                                <div class="col-lg-6 offset-lg-3">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left"><b>File Name :</b></label><br>
                                                <input type="text" name="username" value="<%=rs.getString("filename")%>" readonly="" />
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left"><b>Hashcode :</b></label><br>
                                                <input type="text" name="pwd1" readonly="" value="<%=hashcode%>" readonly="" /> 
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left"><b>Verified Hash:</b></label><br>
                                                <input type="text" name="pwd2" value="<%=rs.getString("hashcode1")%>" readonly="" />
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <button type="submit" style="float: left" id="form-submit" class="main-button ">Verify</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                                <%}

                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </div>
                        </form>
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
        <script  src="assets/js/validation.js"></script>

    </body>
</html>
