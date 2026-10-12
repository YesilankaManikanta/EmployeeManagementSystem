
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bean.EmployeeBean" %>

<%
    // Retrieve employee details from the session
    EmployeeBean loggedInEmployee =
        (EmployeeBean) session.getAttribute("employee");

    // Redirect to login if the user is not logged in
    if (loggedInEmployee == null) {
        response.sendRedirect("login.html");
        return;
    }

    // Retrieve the employee list from the request
    List<EmployeeBean> employees =
        (List<EmployeeBean>) request.getAttribute("employees");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Employees</title>

    <style>
        /* Style the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6fb;
            margin: 0;
            padding: 30px;
        }

        /* Style the main container */
        .container {
            max-width: 1100px;
            margin: 30px auto;
            background-color: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #1d4ed8;
            text-align: center;
        }

        /* Style the employee table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #dddddd;
            text-align: left;
        }

        th {
            background-color: #1d4ed8;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f3f6fb;
        }

        /* Style the navigation link */
        .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 18px;
            background-color: #1d4ed8;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background-color: #1e40af;
        }
    </style>
</head>

<body>

    <div class="container">

        <h2>All Employees</h2>

        <% if (employees != null && !employees.isEmpty()) { %>

            <table>
                <tr>
                    <th>Employee ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Salary</th>
                </tr>

                <% for (EmployeeBean emp : employees) { %>
                    <tr>
                        <td><%= emp.getEmpId() %></td>
                        <td><%= emp.getEmpName() %></td>
                        <td><%= emp.getEmail() %></td>
                        <td><%= emp.getDepartment() %></td>
                        <td><%= emp.getSalary() %></td>
                    </tr>
                <% } %>
            </table>

        <% } else { %>

            <p>No employee records found.</p>

        <% } %>

        <!-- Navigate back to the dashboard -->
        <a href="home.jsp" class="back-btn">Back to Dashboard</a>

    </div>

</body>
</html>
