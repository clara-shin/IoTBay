package uts.isd.model.dao;

import uts.isd.model.Student;
import java.sql.*;
import java.util.ArrayList;

/* 
* DBManager is the primary DAO class to interact with the database. 
* Complete the existing methods of this classes to perform CRUD operations with the db.
*/

public class DBManager {

    private Statement st;

    public DBManager(Connection conn) throws SQLException {       
       st = conn.createStatement();   
    }

    //Find Student by ID and password in the database   
    public Student findStudent(String email, String password) throws SQLException {       
       //setup the select sql query string 
       String fetch = "Select * from ISDUSER.Students WHERE EMAIL='"+ email + "' and PASSWORD='" + password + "'";
       //execute this query using the statement field 

       //add the results to a ResultSet      
       ResultSet rs = st.executeQuery(fetch);
       //search the ResultSet for a Student using the parameters  
       while(rs.next()) //reads every row in STUDENTS table and get the result by index and store them into Strings
       {
           String studentEmail = rs.getString(2);
           String studentPass = rs.getString(3);
           if(studentEmail.equals(email)&&studentPass.equals(password) ){
               String studentName = rs.getString(1);
               String studentDOB = rs.getString(4);
               return new Student(studentName, studentEmail, studentPass, studentDOB);
           }
       }
       return null;   
    }

    //Add a Student-data into the database   
    public void addStudent(String name, String email, String password, String dob) throws SQLException {                   //code for add-operation       
      st.executeUpdate("INSERT INTO ISDUSER.Students "+"VALUES('"+ name + "', '" + email + "', '" + password + "', '" + dob + "')");   

    }

    //update a Student details in the database   
    public void updateStudent(String name, String email, String password, String dob) throws SQLException {       
       //code for update-operation   
       st.executeUpdate("UPDATE ISDUSER.Students SET NAME='" + name + "', PASSWORD='" + password + "', dob='" + dob + "WHERE EMAIL='" + email + "'");

    }       

    //delete a Student from the database   
    public void deleteStudent(String email) throws SQLException{       
       //code for delete-operation   
       st.executeUpdate("DELETE FROM ISDUSER.Students WHERE EMAIL='"+ email + "'");
    }
    
    /*
    fetchStudents() read all STUDENTS rows using:
    SELECT * FROM
    and store the results into ResultSet rs instance
    Then iterate through the set and read every attribute by index
    Then create and add each student from the table to the ArrayList
    */
    public ArrayList<Student> fetchStudents() throws SQLException{
        String fetch = "select * from STUDENTS";
        ResultSet rs = st.executeQuery(fetch);
        ArrayList<Student> temp = new ArrayList(); 
        
        while(rs.next())
        {
            String name = rs.getString(1);
            String email = rs.getString(2);
            String password = rs.getString(3);
            String dob = rs.getString(4);
            temp.add(new Student(name, email,password,dob));
        }
        return temp;
    }
    
    public boolean checkStudent(String email, String password) throws SQLException{
        String fetch = "select * from ISDUSER.Students where EMAIL='" + email + ", PASSWORD='" + password + "'";
        ResultSet rs = st.executeQuery(fetch);
        
        while(rs.next())
        {
            String studentEmail = rs.getString(2);
            String studentPass = rs.getString(3);
            if(studentEmail.equals(email)&&studentPass.equals(password))
            {
                return true;
            }
        }
        return false;
    }

}