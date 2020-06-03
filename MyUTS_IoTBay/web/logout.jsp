<%-- 
    Document   : logout
    Created on : 2020. 4. 29,  8:50:06
    Author     : Hee seong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>JSP Page</title>
    </head>
    <body>
        <p class="p">You have been logged out. Click <a href="index.jsp">here</a> to go back to the home page</p>
        <% session.invalidate(); %>
    </body>
</html>
