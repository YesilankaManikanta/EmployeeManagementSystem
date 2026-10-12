package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bean.EmployeeBean;

public class RegisterDao {





	 // Method to insert employee details into the database
    public int insertEmployee(EmployeeBean eb) {

        int result = 0;

       
        

        try {
        	 	// Get the database connection
            Connection con = DbConnection.getConnect();
        		
        	 	// SQL query to insert employee details
        		String Query="insert into EmployeeDetails values(?,?,?,?,?,?)";
        		
        		// Create a PreparedStatement
            PreparedStatement ps = con.prepareStatement(Query);

            // Set employee details using the Bean object
            ps.setInt(1, eb.getEmpId());
            ps.setString(2, eb.getEmpName());
            ps.setString(3, eb.getEmail());
            ps.setString(4, eb.getDepartment());
            ps.setDouble(5, eb.getSalary());
            ps.setString(6,eb.getPassword());

           // Execute the INSERT query
            result = ps.executeUpdate();

            // Close the resources

            ps.close();
            con.close();

        } catch (Exception e) {
        		// Print the exception details
            e.printStackTrace();
        }

        // Return the result: 1 indicates a successful insert
        return result;
    }



}
