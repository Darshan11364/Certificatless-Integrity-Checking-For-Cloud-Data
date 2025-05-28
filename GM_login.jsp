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
        if (request.getParameter("Failed") != null) {
    %>
    <script>alert('Login Failed');</script>
    <%            }
    %>
    <%
        if (request.getParameter("Register_Success") != null) {
    %>
    <script>alert('Registration Success');</script>
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
                                <li class="scroll-to-section"><a href="index.jsp">Home</a></li>
                                <li class="scroll-to-section"><a href="Member_login.jsp">Group Member</a></li>
                                <li class="scroll-to-section"><a class="active" href="GM_login.jsp">Group Manager</a></li>
                                <li class="scroll-to-section"><a href="PV_login.jsp">Public Verifier</a></li>
                                <li class="scroll-to-section"><a href="Cloud_login.jsp">Cloud</a></li>
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
                        <form id="contact" action="gm_login" method="post">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-3">
                                    <div class="section-heading">
                                        <h2>Group Manager<em> Login</em></h2>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <img src="images/gmlogin.jpg" width="350" height="300">
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left">Email :</label>
                                                <input type="text" name="name" id="name" placeholder="Enter Your Email" required>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left">Password :</label>
                                                <input type="password" name="pass" id="surname" placeholder="Enter Your Password" required>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <button type="submit" style="float: left" id="form-submit" class="main-button ">Login</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
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

    </body>
</html>
