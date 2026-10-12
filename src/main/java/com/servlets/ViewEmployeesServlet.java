
package com.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EmployeeBean;
import com.dao.ViewEmployeesDao;

@WebServlet("/viewEmployees")
public class ViewEmployeesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle the request to view all employees
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether the user is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
                session.getAttribute("employee") == null) {
            response.sendRedirect("login.html");
            return;
        }

        // Create an EmployeeDAO object
        ViewEmployeesDao dao = new ViewEmployeesDao();

        // Retrieve all employees from the database
        List<EmployeeBean> employees = dao.getAllEmployees();

        // Store the employee list in the request
        request.setAttribute("employees", employees);

        // Forward to the employee list page
        request.getRequestDispatcher("employees.jsp")
               .forward(request, response);
    }
}
