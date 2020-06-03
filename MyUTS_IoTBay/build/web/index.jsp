<%-- 
    Document   : index
    Created on : 2020. 4. 28, 9:57:05
    Author     : Hee seong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="uts.isd.model.*" %>%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Welcome to IoTBay</title>
        <link rel="stylesheet" href="css/demo.css">
    </head>
    <body onload="startTime()">
        <div><span class="time" id="time"></span></div>
        <div>
            <h1>IoTBay</h1>
            <a href="register.jsp" class="button">Register</a>
            <a href="login.jsp" class="button">Login</a>    
        </div>
        <jsp:include page="/ConnServlet" flush="trues" />
    </body>
</html>
