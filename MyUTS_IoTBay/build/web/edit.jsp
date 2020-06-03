<%-- 
    Document   : edit
    Created on : 2020. 4. 29,  9:01:30
    Author     : Hee seong
--%>
<%@page import="uts.isd.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Account Page</title>
    </head>
    <body>
        <%
            Student student = (Student) session.getAttribute("student");
            String updated = request.getParameter("updated");
        %>
        <h1>Edit Student Information<span class="message"><%= (updated!=null) ? updated : "" %></span></h1>
        <div class="panel_div">
            <a href="main.jsp" class="button">Main</a>
            <a href="logout.jsp" class="button">Logout</a>
        </div>
        <form method="post" action="edit.jsp">
            <table id="form_table">
                <tr>
                    <td>Full Name:</td>
                    <td>
                        <input type="text" name="name" value="${student.name}">
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <input type="text" name="email" value="${student.email}">
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="password" value="${student.password}">
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td>
                        <input type="date" name="dob" value="${student.dob}">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="hidden" name="updated" value="Update was successful">
                        <input type="submit" class="button" value="Update">
                    </td>
                </tr>
            </table>
            <%
                if(updated != null){
                    String email = request.getParameter("email");
                    String name = request.getParameter("name");
                    String password = request.getParameter("password");
                    String dob = request.getParameter("dob");
                    
                    student = new Student(name,email,password,dob);
                    session.setAttribute("student", student);
                }
            %>
        </form>
    </body>
</html>
