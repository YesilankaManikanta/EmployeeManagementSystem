package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.EmployeeBean;

public class EmployeeDao {
	// Search an employee using employee ID
	public EmployeeBean getEmployeeById(int empId) {

	    EmployeeBean employee = null;

	    String sql = "SELECT EMP_ID, EMP_NAME, EMAIL, DEPARTMENT, SALARY "
	               + "FROM EmployeeDetails WHERE EMP_ID = ?";

	    try (Connection con = DbConnection.getConnect();
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, empId);

	        try (ResultSet rs = ps.executeQuery()) {

	            if (rs.next()) {
	                employee = new EmployeeBean();

	                employee.setEmpId(rs.getInt("EMP_ID"));
	                employee.setEmpName(rs.getString("EMP_NAME"));
	                employee.setEmail(rs.getString("EMAIL"));
	                employee.setDepartment(rs.getString("DEPARTMENT"));
	                employee.setSalary(rs.getDouble("SALARY"));
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return employee;
	}

public int updateEmployee(EmployeeBean emp) {

    int rows = 0;

    String sql = "UPDATE EmployeeDetails SET EMP_NAME = ?, EMAIL = ?, DEPARTMENT = ?, SALARY = ? WHERE EMP_ID = ?";

    try (Connection con = DbConnection.getConnect();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, emp.getEmpName());
        ps.setString(2, emp.getEmail());
        ps.setString(3, emp.getDepartment());
        ps.setDouble(4, emp.getSalary());
        ps.setInt(5, emp.getEmpId());

        rows = ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return rows;
}

public int deleteEmployee(int empId) {

    int rows = 0;

    String sql = "DELETE FROM EmployeeDetails WHERE EMP_ID = ?";

    try (Connection con = DbConnection.getConnect();
         PreparedStatement ps = con.prepareStatement(sql)) {

        // Set the employee ID for deletion
        ps.setInt(1, empId);

        // Execute the delete query
        rows = ps.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return rows;
}



}
