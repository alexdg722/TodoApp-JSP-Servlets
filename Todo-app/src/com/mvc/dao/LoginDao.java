package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {
	
	public boolean loginUser(LoginBean loginBean)
    {
		boolean status = false;
        String username = loginBean.getUsername();
        String password = loginBean.getPassword();
         
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.getConnection();
            String query = "select * from users where username = ? and password = ?"; 
            preparedStatement = con.prepareStatement(query); 
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
             
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } 
        catch(SQLException e)
        {
           e.printStackTrace();
        }    
        return status;
    }
	
	
}
