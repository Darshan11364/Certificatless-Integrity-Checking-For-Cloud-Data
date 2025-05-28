<%-- 
    Document   : index
    Created on : 30 Jun, 2021, 6:42:34 PM
    Author     : JAVA-JP
--%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="Action.Encryption"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="Action.SplitFile"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%

    final String filepath = "D:/";
    String f1, f2, f3;

    try {
        MultipartRequest m = new MultipartRequest(request, filepath);
        String filekeyword = m.getParameter("keyword");
        File file = m.getFile("fileToUpload");
        String filename = file.getName().toLowerCase();
        session.setAttribute("filename", filename);
        session.setAttribute("filepath", filepath);

        Connection con = SQLconnection.getconnection();
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("Select * from data_files where filekeyword ='" + filekeyword + "'");
        if (rs.next()) {

            response.sendRedirect("Upload_file.jsp?msg=FileKeyword_Already_Exists");
        }

        BufferedReader br = new BufferedReader(new FileReader(filepath + filename));
        StringBuffer sb = new StringBuffer();
        String temp;

        while ((temp = br.readLine()) != null) {
            sb.append(temp);
            sb.append("\n");
        }

        session.setAttribute("filecontent", sb.toString());
        KeyGenerator Attrib_key = KeyGenerator.getInstance("AES");
        Attrib_key.init(128);
        SecretKey secretKey = Attrib_key.generateKey();
        System.out.println("++++++++ key:" + secretKey);
        session.setAttribute("secretKey", secretKey);

        Encryption e = new Encryption();
        String encryptedtext = e.encrypt(sb.toString(), secretKey);
        session.setAttribute("EncryptText", encryptedtext);
        byte[] b = secretKey.getEncoded();
        String Dkey = Base64.encode(b);
        System.out.println("converted secretkey to string: " + Dkey);
        session.setAttribute("Dkey", Dkey);

        SplitFile splitFile = new SplitFile();
        splitFile.split(filepath + "\\" + filename);
        f1 = filepath + "\\" + filename + "1";
        f2 = filepath + "\\" + filename + "2";
        f3 = filepath + "\\" + filename + "3";

        BufferedReader br1 = new BufferedReader(new FileReader(f1));
        BufferedReader br2 = new BufferedReader(new FileReader(f2));
        BufferedReader br3 = new BufferedReader(new FileReader(f3));

        StringBuffer sb1 = new StringBuffer();
        StringBuffer sb2 = new StringBuffer();
        StringBuffer sb3 = new StringBuffer();
        String temp1 = null;
        String temp2 = null;
        String temp3 = null;

        while ((temp1 = br1.readLine()) != null) {
            sb1.append(temp1);
            sb1.append("\n");
        }
        while ((temp2 = br2.readLine()) != null) {
            sb2.append(temp2);
            sb2.append("\n");
        }
        while ((temp3 = br3.readLine()) != null) {
            sb3.append(temp3);
            sb3.append("\n");
        }
        System.out.println("\n Block 1 : " + sb1.toString());
        System.out.println("\n Block 2 : " + sb2.toString());
        System.out.println("\n Block 3 : " + sb3.toString());

        session.setAttribute("ori_block1", sb1.toString());
        session.setAttribute("ori_block2", sb2.toString());
        session.setAttribute("ori_block3", sb3.toString());

        String encryptedtext1 = e.encrypt(sb1.toString(), secretKey);
        String encryptedtext2 = e.encrypt(sb2.toString(), secretKey);
        String encryptedtext3 = e.encrypt(sb3.toString(), secretKey);

%>
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
    <script type="text/javascript">
        function loadFile(o)
        {
            var fr = new FileReader();
            fr.onload = function (e)
            {
                showDataFile(e, o);
            };
            fr.readAsText(o.files[0]);
        }

        function showDataFile(e, o)
        {
            document.getElementById("data").innerText = e.target.result;
        }
    </script>
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
                                <li class="scroll-to-section"><a class="active" href="Upload_file.jsp">Upload File</a></li>
                                <li class="scroll-to-section"><a href="My_files.jsp">My Files</a></li>
                                <li class="scroll-to-section"><a href="All_files.jsp">All Files</a></li>
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
                        <form id="contact" action="upload" method="post" enctype="multipart/form-data">
                            <div class="row">
                                <div class="col-lg-6 offset-lg-3">
                                    <div class="section-heading">
                                        <h2>Upload<em> File</em></h2>
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <img src="images/upload.png" width="350" height="300">
                                </div>
                                <div class="col-lg-6">
                                    <div class="row"
                                         <div class="col-lg-12">
                                            <fieldset>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <input type="hidden" name="keyword" value="<%=filekeyword%>" readonly="">
                                                <label style="float: left">File Name :</label>
                                                <input type="text" name="filename" value="<%=filename%>" readonly="">
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left">Block 1 :</label>
                                                <textarea name="block1" readonly=""  style="height: 120px; resize: none;"><%=encryptedtext1%></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left">Block 2 :</label>
                                                <textarea name="block2" readonly=""  style="height: 120px; resize: none;"><%=encryptedtext2%></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <label style="float: left">Block 3 :</label>
                                                <textarea name="block3" readonly=""  style="height: 120px; resize: none;"><%=encryptedtext3%></textarea>
                                            </fieldset>
                                        </div>
                                        <div class="col-lg-12">
                                            <fieldset>
                                                <button type="submit" style="float: left" id="form-submit" class="main-button ">Upload</button>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%   } catch (Exception e) {
            e.printStackTrace();
        }
    %>
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
