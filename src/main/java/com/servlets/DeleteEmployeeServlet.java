
package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.dao.EmployeeDao;

@WebServlet("/deleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check whether the user is logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("employee") == null) {

            response.sendRedirect("login.html");
            return;
        }

        try {
            // Read employee ID from the form
            int empId = Integer.parseInt(
                request.getParameter("empId"));

            if (empId <= 0) {
                request.setAttribute(
                    "message", "Please enter a valid Employee ID.");

                request.getRequestDispatcher("deleteResult.jsp")
                       .forward(request, response);
                return;
            }

            // Delete the employee from the database
            EmployeeDao dao = new EmployeeDao();
            int rows = dao.deleteEmployee(empId);

            if (rows > 0) {
                request.setAttribute(
                    "message", "Employee deleted successfully!");

            } else {
                request.setAttribute(
                    "message", "No employee found with ID: " + empId);
            }

        } catch (NumberFormatException e) {
            request.setAttribute(
                "message", "Please enter a valid Employee ID.");
        }

        request.getRequestDispatcher("deleteResult.jsp")
               .forward(request, response);
    }
}
