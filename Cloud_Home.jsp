<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <%
        if (request.getParameter("Success") != null) {
    %>
    <script>alert('Login Successfully');</script>
    <%            }
    %>
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
                                <li class="scroll-to-section"><a class="active" href="Cloud_Home.jsp">Home</a></li>
                                <li class="scroll-to-section"><a href="Cloud_files.jsp">Cloud Files</a></li>
                                <li class="scroll-to-section"><a href="member_details1.jsp">Group Member Details</a></li>
                                <li class="scroll-to-section"><a href="graph.jsp">Graph</a></li>
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
                            <center><h2><em>Welcome to Cloud Server!</em></h2></center>
                        </div>
                        <center><img src="images/cloud1.jpg" /></center>
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
