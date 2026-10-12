
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.EmployeeBean;

public class ViewEmployeesDao {

    // Method to retrieve all employees from the database
    public List<EmployeeBean> getAllEmployees() {

        List<EmployeeBean> employees = new ArrayList<>();

        // SQL query to retrieve employee details
        String Query="Select * from EmployeeDetails order by  EMP_ID";

        // Get the database connection
        try (Connection con = DbConnection.getConnect()) {

            // Check whether the connection is available
            if (con == null) {
                return employees;
            }

            // Create a PreparedStatement
            try (PreparedStatement ps = con.prepareStatement(Query);
                 ResultSet rs = ps.executeQuery()) {

                // Retrieve each employee record
                while (rs.next()) {

                    // Create an EmployeeBean object
                    EmployeeBean eb = new EmployeeBean();

                    // Set employee details from the ResultSet
                    eb.setEmpId(rs.getInt("EMP_ID"));
                    eb.setEmpName(rs.getString("EMP_NAME"));
                    eb.setEmail(rs.getString("EMAIL"));
                    eb.setDepartment(rs.getString("DEPARTMENT"));
                    eb.setSalary(rs.getDouble("SALARY"));

                    // Add the employee to the list
                    employees.add(eb);
                }
            }

        } catch (Exception e) {
            // Print exception details
            e.printStackTrace();
        }

        // Return the employee list
        return employees;
    }
}
