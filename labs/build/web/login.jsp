<%-- 
    Document   : login
    Created on : 2020. 4. 29,  8:28:42
    Author     : Hee seong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Login Page</title>
    </head>
    <body onload="startTime()">
        <div><span class="time" id="time"></span></div>
        <%
            String existErr = (String) session.getAttribute("existErr");
            String emailErr = (String) session.getAttribute("emailErr");
            String passErr = (String) session.getAttribute("passErr");
        %>
        <h1>Sign In<span class="message"><%=(existErr != null ? existErr : "") %></span></h1>
        <form method="post" action="LoginServlet"> <!-- action = 'displayListItem.jsp' -->
            <table id="form_table">
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <input type="text" name="email" placeholder="<%=(emailErr != null ? emailErr : "Enter Email") %>" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:
                    </td>
                    <td>
                        <input type="password" name="password" placeholder="<%=(passErr != null ? passErr : "Enter Password") %>" required>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="CancelServlet" class="button">Cancel</a>
                        <input type="submit" value="Sign Up" class="button">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
