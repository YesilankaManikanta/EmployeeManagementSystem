package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EmployeeBean;
import com.dao.RegisterDao;

@WebServlet("/registerEmployee")

public class RegisterServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		   // Receive form data
        int empId = Integer.parseInt(req.getParameter("empId"));
        String empName = req.getParameter("empName");
        String email = req.getParameter("email");
        String department = req.getParameter("department");
        double salary = Double.parseDouble(req.getParameter("salary"));
        String password = req.getParameter("password");
        
     // Create an EmployeeBean object
        EmployeeBean eb = new EmployeeBean();
        
        // Set employee details in the Bean object
        eb.setEmpId(empId);
        eb.setEmpName(empName);
        eb.setEmail(email);
        eb.setDepartment(department);
        eb.setSalary(salary);
        eb.setPassword(password);
        
     // Create a RegisterDao object
        RegisterDao dao = new RegisterDao();
        
     // Insert employee details into the database
        int result = dao.insertEmployee(eb);
        
        // Forward to the appropriate page
        if (result > 0) {
            req.setAttribute("message",
                    "Employee registered successfully!");

            RequestDispatcher rd =
                    req.getRequestDispatcher("success.jsp");
            rd.forward(req, res);

        } else {
            req.setAttribute("message",
                    "Employee registration failed. Please try again.");

            RequestDispatcher rd =
                    req.getRequestDispatcher("error.jsp");
            rd.forward(req, res);
        }

        
	}

}
