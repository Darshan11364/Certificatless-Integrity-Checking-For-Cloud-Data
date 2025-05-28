<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM
    Author     : JAVA-JP
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
                                <li class="scroll-to-section"><a class="active" href="index.jsp">Home</a></li>
                                <li class="scroll-to-section"><a href="Member_login.jsp">Group Member</a></li>
                                <li class="scroll-to-section"><a href="GM_login.jsp">Group Manager</a></li>
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
        </div>
        <div id="about" class="about-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <center><h2><em>ABSTRACT</em></h2></center>
                        </div>
                        <P align="justify" style="font-size: 18px;">
                            Cloud storage service supplies people with an
                            efficient method to share data within a group. The cloud
                            server is not trustworthy, so lots of remote data possession
                            checking (RDPC) protocols are proposed and thought to be
                            an effective way to ensure the data integrity. However, most
                            of RDPC protocols are based on the mechanism of
                            traditional public key infrastructure (PKI), which has
                            obvious security flaw and bears big burden of certificate
                            management. To avoid this shortcoming, identity-based
                            cryptography (IBC) is often chosen to be the basis of RDPC.
                            Unfortunately, IBC has an inherent drawback of key
                            escrow. To solve these problems, we utilize the technique of
                            certificateless signature to present a new RDPC protocol
                            for checking the integrity of data shared among a group. In
                            our scheme, user's private key includes two parts: a partial
                            key generated by the group manager and a secret value
                            chosen by herself/himself. To ensure the right public keys
                            are chosen during the data integrity checking, the public
                            key of each user is associated with her unique identity, for
                            example the name or telephone number. Thus, the
                            certificate is not needed and the problem of key escrow is
                            eliminated too. Meanwhile, the data integrity can still be
                            audited by public verifier without downloading the whole
                            data. In addition, our scheme also supports efficient user
                            revocation from the group. The security of our scheme is
                            reduced to the assumptions of computational
                            Diffie-Hellman (CDH) and discrete logarithm (DL).
                            Experiment results exhibit that the new protocol is very
                            efficient and feasible.
                        </p>
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
