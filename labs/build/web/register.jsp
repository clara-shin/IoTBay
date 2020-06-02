<%-- 
    Document   : register
    Created on : 2020. 4. 29,  7:46:37
    Author     : Hee seong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/demo.css">
        <title>Registration Page</title>
    </head>
    <body>
        <h1>Sign Up</h1>
        <form method="post" action="welcome.jsp">
            <table id="form_table">
                <tr>
                    <td>Full Name:</td>
                    <td>
                        <input type="text" name="name" placeholder="Student name">
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <input type="text" name="email" placeholder="Enter Email">
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <input type="password" name="password" placeholder="Enter Password">
                    </td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td>
                        <input type="date" name="dob" placeholder="Enter Date of Birth">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <a href="index.jsp" class="button">Cancel</a>
                        <input type="submit" value="Sign Up" class="button">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
