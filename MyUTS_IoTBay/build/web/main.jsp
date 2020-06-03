<%-- 
    Document   : main
    Created on : 2020. 4. 29,  7:41:55
    Author     : Hee seong
--%>
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Student Dashboard</title>
    </head>
    <body>
        <%
            Student student = (Student)session.getAttribute("student");
        %>
        <h1>Student Dashboard</h1>
        <div>
            <a href="edit.jsp" class="button">Account</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
        <p>You are logged in as &lt; ${student.email} &gt;</p>
        <div>
            <jsp:include page="profile.jsp" flush="true" />
        </div>
    </body>
</html>
