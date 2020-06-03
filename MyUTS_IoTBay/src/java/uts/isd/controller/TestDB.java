
package uts.isd.controller;

 

import java.sql.*;

import java.util.*;

import java.util.logging.*;
import uts.isd.model.Student;
import uts.isd.model.dao.*;

 

public class TestDB {

    private static Scanner in = new Scanner(System.in);
    private DBConnector connector;
    private Connection conn;
    private DBManager db;
    
    public static void main(String[] args) throws SQLException{
        (new TestDB()).runQueries();
    }
    public TestDB(){
        try{
            connector =  new DBConnector();
            conn = connector.openConnection();
            db = new DBManager(conn);
        } catch (ClassNotFoundException | SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private char readChoice() {
        System.out.print("Operation CRUD or * to exit: ");
        return in.nextLine().charAt(0);
    }
    
    private void runQueries() throws SQLException {
        char c;
        
        while((c = readChoice()) != '*'){
            switch (c) {
                case 'C': 
                    testAdd();
                    break;
                case 'R':
                    testRead();
                    break;
                case 'U':
                    testUpdate();
                    break;
                case 'D':
                    testDelete();
                    break;
                case 'S':
                    showAll();
                    break;
                default:
                    System.out.println("Unknown Command");
                    break;
                   
            }
        }
    }
    
    private void testAdd(){
        System.out.print("Student name: ");
        String name = in.nextLine();
        System.out.print("Student email: ");
        String email = in.nextLine();
        System.out.print("Student password: ");
        String password = in.nextLine();
        System.out.print("Student date of birth: ");
        String dob = in.nextLine();
        
        try{
            db.addStudent(name, email, password, dob);
        } catch(SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Student is added to the database.");
    }
    
    private void testRead() throws SQLException{
        System.out.print("Student email: ");
        String email = in.nextLine();
        System.out.print("Student password: ");
        String password = in.nextLine();
        
        Student student = db.findStudent(email, password);
        
        if(student != null){
            System.out.println("Student " + student.getName() + " existes in the database.");
        } else {
            System.out.println("Student does not exist.");
        }
    }
    
    private void testUpdate() {
        System.out.print("Student email: ");
        String email = in.nextLine();
        System.out.print("Student password: ");
        String password = in.nextLine();
        
        try {
            if(db.checkStudent(email, password)){
                System.out.print("Student name: ");
                String name = in.nextLine();
                System.out.print("Student date of birth: ");
                String dob = in.nextLine();
                db.updateStudent(name, email, password, dob);
            } else {
                System.out.println("Student does not exist.");
            }
        } catch(SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void testDelete() {
        System.out.print("Student email: ");
        String email = in.nextLine();
        System.out.print("Student password: ");
        String password = in.nextLine();
        
        try{
            if(db.checkStudent(email, password)){
                db.deleteStudent(email);
            } else{
                System.out.println("Student does not exist.");
            }
        } catch(SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private void showAll() {
        try {
            ArrayList<Student> students = db.fetchStudents();
            System.out.println("STUDENTS TABLE: ");
            students.stream().forEach((student)-> {
                    System.out.printf("%-20s %-30s %-20s %-10s \n", student.getName(), student.getEmail(),student.getPassword(), student.getDob());
            });
            System.out.println();
        } catch(SQLException ex){
            Logger.getLogger(TestDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}