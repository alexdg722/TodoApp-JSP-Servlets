package com.mvc.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;
 
public class RegisterDao { 
     public String registerUser(RegisterBean registerBean)
     {
    	 String firstName = registerBean.getFirstName();
    	 String lastName = registerBean.getLastName();
         String email = registerBean.getEmail();
         String userName = registerBean.getUserName();
         String password = registerBean.getPassword();
          
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.getConnection();
             String query = "insert into users(firstname,lastname,email,username,password) values (?,?,?,?,?)"; 
             preparedStatement = con.prepareStatement(query); 
             preparedStatement.setString(1, firstName);
             preparedStatement.setString(2, lastName);
             preparedStatement.setString(3, email);
             preparedStatement.setString(4, userName);
             preparedStatement.setString(5, password);
              
             int i= preparedStatement.executeUpdate();
              
             if (i!=0)  
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  
     }
}