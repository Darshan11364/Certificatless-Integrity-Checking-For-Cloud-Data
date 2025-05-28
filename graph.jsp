<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
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
                                <li class="scroll-to-section"><a href="Cloud_Home.jsp">Home</a></li>
                                <li class="scroll-to-section"><a href="Cloud_files.jsp">Cloud Files</a></li>
                                <li class="scroll-to-section"><a href="member_details1.jsp">Group Member Details</a></li>
                                <li class="scroll-to-section"><a class="active" href="graph.jsp">Graph</a></li>
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
        </div>
        <div id="about" class="about-us section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-heading">
                            <center><h2><em>Analysis</em></h2></center>
                        </div>
                        <div class="col-lg-12">
                            <%
                                String val1 = "", val2 = "", val3 = "";
                                String val11 = "", val22 = "", val33 = "";
                                int i = 0;

                                try {
                                    Connection con = SQLconnection.getconnection();

                                    Statement st1 = con.createStatement();
                                    ResultSet rs2 = st1.executeQuery("SELECT  AVG(enc_time) FROM  data_files ");
                                    rs2.next();
                                    {
                                        val2 = rs2.getString("AVG(enc_time)");
                                    }
                                    rs2.close();
                                    Statement st2 = con.createStatement();
                                    ResultSet rs3 = st2.executeQuery("SELECT  AVG(decrypt_time) FROM  download ");
                                    rs3.next();
                                    {
                                        val3 = rs3.getString("AVG(decrypt_time)");
                                    }
                                    System.out.println("count------------------> " + val2);
                                    System.out.println("count------------------> " + val3);

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                            <script type="text/javascript">
                                window.onload = function () {

                                    var chart = new CanvasJS.Chart("chartContainer", {
                                        animationEnabled: true,
                                        exportEnabled: true,
                                        theme: "light2", // "light1", "light2", "dark1", "dark2"
                                        title: {
                                            text: ""
                                        },
                                        axisY: {
                                            title: "Time in MS"
                                        },
                                        data: [{
                                                type: "column",
                                                showInLegend: true,
                                                legendMarkerColor: "grey",
                                                legendText: "Entities",
                                                dataPoints: [
                                                    {y: <%=val2%>, label: "Avg Encryption_Time in MS"},
                                                    {y: <%=val3%>, label: "Avg Decryption_Time in MS"}

                                                ]
                                            }]
                                    });
                                    chart.render();
                                }
                            </script>
                            <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                        </div>
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

        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                                // First circle
                                new Circlebar({
                                    element: "#circle-1",
                                    type: "progress",
                                    maxValue: "90"
                                });

                                // Second circle
                                new Circlebar({
                                    element: "#circle-2",
                                    type: "progress",
                                    maxValue: "84"
                                });

                                // Third circle
                                new Circlebar({
                                    element: "#circle-3",
                                    type: "progress",
                                    maxValue: "60"
                                });

                                // Fourth circle
                                new Circlebar({
                                    element: "#circle-4",
                                    type: "progress",
                                    maxValue: "74"
                                });

        </script>
        <!-- Scripts -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/animation.js"></script>
        <script src="assets/js/imagesloaded.js"></script>
        <script src="assets/js/custom.js"></script>

    </body>
</html>
