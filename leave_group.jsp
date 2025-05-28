<%-- 
    Document   : leave_group
    Created on : 13 Mar, 2021, 3:56:30 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enabling Efficient User Revocation</title>
    </head>
    <body>

<SCRIPT>
var msg = "Are you sure want to leave from Group ?? ";

if (confirm(msg)) 
    location.replace("leave.jsp");
else
    location.replace("Member_Home.jsp");
</SCRIPT>
    </body>
</html>
