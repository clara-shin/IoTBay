<%-- 
    Document   : profile
    Created on : 2020. 4. 29,  7:55:41
    Author     : Hee seong
--%>

<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Profile Page</title>
    </head>
    <body>
        <%
            Student student = (Student)session.getAttribute("student");
        %>
        <h1>Student Profile</h1>
        <table id="profile_table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${student.name}</td>
                    <td><%= student.getEmail() %></td>
                    <td>${student.password}</td>
                    <td>${student.dob}</td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
