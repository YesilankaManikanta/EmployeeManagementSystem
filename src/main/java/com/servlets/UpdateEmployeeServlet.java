
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

@WebServlet("/editEmployee")
public class UpdateEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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

        // Get employee ID from the form
        String idValue = request.getParameter("empId");

        try {
            int empId = Integer.parseInt(idValue);

            // Fetch employee details from the database
            EmployeeDao dao = new EmployeeDao();
            EmployeeBean employee = dao.getEmployeeById(empId);

            if (employee != null) {

                // Send employee details to the edit page
                request.setAttribute("editEmployee", employee);

                request.getRequestDispatcher("editEmployee.jsp")
                       .forward(request, response);

            } else {

                // Display a message if the employee does not exist
                request.setAttribute(
                    "errorMessage",
                    "Employee not found with ID: " + empId
                );

                request.getRequestDispatcher("editEmployee.jsp")
                       .forward(request, response);
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                "errorMessage",
                "Please enter a valid Employee ID."
            );

            request.getRequestDispatcher("editEmployee.jsp")
                   .forward(request, response);
        }
    }

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

    request.setCharacterEncoding("UTF-8");

    try {
        // Read updated details from the form
        int empId = Integer.parseInt(
            request.getParameter("empId"));

        String empName = request.getParameter("empName");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        double salary = Double.parseDouble(
            request.getParameter("salary"));

        // Validate the input values
        if (empName == null || empName.trim().isEmpty()
                || email == null || email.trim().isEmpty()
                || salary < 0) {

            request.setAttribute(
                "errorMessage", "Please enter valid employee details.");

            request.getRequestDispatcher("editEmployee.jsp")
                   .forward(request, response);
            return;
        }

        // Create an employee object with updated details
        EmployeeBean emp = new EmployeeBean();

        emp.setEmpId(empId);
        emp.setEmpName(empName.trim());
        emp.setEmail(email.trim());
        emp.setDepartment(department);
        emp.setSalary(salary);

        // Update the database record
        EmployeeDao dao = new EmployeeDao();
        int rows = dao.updateEmployee(emp);

        if (rows > 0) {
            response.sendRedirect("viewEmployees");
        } else {
            request.setAttribute(
                "errorMessage",
                "Employee was not updated. Please check the ID.");

            request.getRequestDispatcher("editEmployee.jsp")
                   .forward(request, response);
        }

    } catch (NumberFormatException e) {
        request.setAttribute(
            "errorMessage", "Please enter valid numeric values.");

        request.getRequestDispatcher("editEmployee.jsp")
               .forward(request, response);
    }
}

}

