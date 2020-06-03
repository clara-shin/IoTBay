package uts.isd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uts.isd.model.Student;
import uts.isd.model.dao.DBManager;

    
public class LoginServlet extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //1. retrieve the session
        HttpSession session = request.getSession();
        // 2. an instance of the validator
        Validator validator = new Validator();
        // 3. get email and password 
        String email = request.getParameter("email"); 
        String password = request.getParameter("password");
        
        //4. db manager
        DBManager manager = (DBManager) session.getAttribute("manager");
        Student student = null;
  
        
        // incorrect email
        if(!validator.validateEmail(email)){
            session.setAttribute("emailErr","Error: Email format incorrect");
            request.getRequestDispatcher("login.jsp").include(request,response);
            
        } 
        // incorrect password
        else if (!validator.validatePassword(password)){
            
            session.setAttribute("passErr","Error: Password format incorrect");
            request.getRequestDispatcher("login.jsp").include(request,response);
        } 
        
        else { 
            try {
                student = manager.findStudent(email, password);
                
                //if user found
                if(student != null ){
                    session.setAttribute("student",student);
//                    student.set // user's active
//                    request.getRequestDispatcher("welcome.jsp").include(request,response);
                } else {
                    session.setAttribute("existErr","Student does not exist in the Database!");
                    request.getRequestDispatcher("login.jsp").include(request,response);
                }
              
            } catch(SQLException | NullPointerException ex){
                System.out.println(ex.getMessage() == null? "User does not exist": "welcome");
                
            }
        }       
    }
    
}