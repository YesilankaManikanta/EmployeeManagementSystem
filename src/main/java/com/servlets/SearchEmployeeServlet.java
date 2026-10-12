package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EmployeeBean;
import com.dao.EmployeeDao;

@WebServlet("/searchEmployee")
public class SearchEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether the employee is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("employee") == null) {

            response.sendRedirect("login.html");
            return;
        }

        // Read the employee ID from the search form
        String idValue = request.getParameter("empId");

        try {
            int empId = Integer.parseInt(idValue);

            // Search for the employee in the database
            EmployeeDao dao = new EmployeeDao();
            EmployeeBean employee = dao.getEmployeeById(empId);

            // Send the result to the JSP page
            request.setAttribute("employeeResult", employee);

        } catch (NumberFormatException e) {

            // Handle an invalid employee ID
            request.setAttribute("errorMessage",
                                 "Please enter a valid Employee ID.");
        }

        request.getRequestDispatcher("searchResult.jsp")
               .forward(request, response);
    }
}