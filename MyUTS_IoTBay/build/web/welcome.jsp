<%-- 
    Document   : welcome
    Created on : 2020. 4. 29, 7:47:16
    Author     : Hee seong
--%>
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Welcome Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
        %>
        <h1>Welcome, <%= name %></h1>
        <p class="p">Your email: <%= email %></p>
        <p class="p">Your Password: <%= password %></p>
        <p class="p">Your DOB: <%= dob %></p>
        <div class="panel_div">
            <a href="index.jsp" class="button">Cancel</a>
            <a href="main.jsp" class="button">Main</a>
        </div>

        <%
            Student student = new Student(name,email,password,dob);
            session.setAttribute("student",student);
        %>
    </body>
</html>
