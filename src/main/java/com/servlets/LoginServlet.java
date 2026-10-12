
package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EmployeeBean;
import com.dao.LoginDao;

@WebServlet("/loginEmployee")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle login form submission
    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Receive login form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create an EmployeeBean object
        EmployeeBean eb = new EmployeeBean();

        // Set login details in the Bean object
        eb.setEmail(email);
        eb.setPassword(password);

        // Create a LoginDao object
        LoginDao dao = new LoginDao();

        // Validate employee login details
        EmployeeBean employee = dao.login(eb);

        if (employee != null) {

        	   // Create or retrieve the user session
            HttpSession session = request.getSession();

            // Store employee details in the session
            session.setAttribute("employee", employee);

            // Redirect to the home page
            response.sendRedirect("home.jsp");

        } else {

            // Set the login failure message
            request.setAttribute("message",
                    "Invalid email or password!");

            // Forward to the login error page
            RequestDispatcher rd =
                    request.getRequestDispatcher("loginError.jsp");
            rd.forward(request, response);
        }
    }
}
