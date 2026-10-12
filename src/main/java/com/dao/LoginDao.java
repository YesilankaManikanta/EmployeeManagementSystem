
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.EmployeeBean;

public class LoginDao {

    // Method to validate employee login details
    public EmployeeBean login(EmployeeBean eb) {

        EmployeeBean employee = null;

        // Get the database connection
        String Query = "Select * from EmployeeDetails WHERE EMAIL = ? AND PASSWORD_HASH = ?";

        try (Connection con = DbConnection.getConnect()) {

            // Check whether the connection is available
            if (con == null) {
                return null;
            }

            // Create a PreparedStatement
            try (PreparedStatement ps = con.prepareStatement(Query)) {

                // Set email and password parameters
                ps.setString(1, eb.getEmail());
                ps.setString(2, eb.getPassword());

                // Execute the SELECT query
                try (ResultSet rs = ps.executeQuery()) {

                    // Check whether matching employee details exist
                    if (rs.next()) {

                        // Create a Bean object for the employee
                        employee = new EmployeeBean();

                        // Set employee details from the ResultSet
                        employee.setEmpId(rs.getInt("EMP_ID"));
                        employee.setEmpName(rs.getString("EMP_NAME"));
                        employee.setEmail(rs.getString("EMAIL"));
                        employee.setDepartment(
                                rs.getString("DEPARTMENT"));
                        employee.setSalary(rs.getDouble("SALARY"));
                    }
                }
            }

        } catch (Exception e) {
            // Print exception details
            e.printStackTrace();
        }

        // Return employee details if login succeeds; otherwise return null
        return employee;
    }
}
