<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bean.EmployeeBean" %>
<%
    // Check whether the employee is logged in
    EmployeeBean loggedEmployee =
        (EmployeeBean) session.getAttribute("employee");

    if (loggedEmployee == null) {
        response.sendRedirect("login.html");
        return;
    }

    // Retrieve the search result
    EmployeeBean result =
        (EmployeeBean) request.getAttribute("employeeResult");

    String errorMessage =
        (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Search Result</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        padding: 40px;
    }

    .container {
        max-width: 600px;
        margin: 40px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    td {
        padding: 12px;
        border: 1px solid #ddd;
    }

    td:first-child {
        font-weight: bold;
        background: #f7f7f7;
        width: 35%;
    }

    .message {
        text-align: center;
        color: #d9534f;
        margin-top: 20px;
    }

    .back-link {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #007bff;
    }
</style>
</head>

<body>

<div class="container">

    <h2>Employee Search Result</h2>

    <% if (errorMessage != null) { %>

        <p class="message">
            <%= errorMessage %>
        </p>

    <% } else if (result != null) { %>

        <table>
            <tr>
                <td>Employee ID</td>
                <td><%= result.getEmpId() %></td>
            </tr>
            <tr>
                <td>Name</td>
                <td><%= result.getEmpName() %></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><%= result.getEmail() %></td>
            </tr>
            <tr>
                <td>Department</td>
                <td><%= result.getDepartment() %></td>
            </tr>
            <tr>
                <td>Salary</td>
                <td><%= result.getSalary() %></td>
            </tr>
        </table>

    <% } else { %>

        <p class="message">
            No employee found with the given ID.
        </p>

    <% } %>

    <a href="searchEmployee.jsp" class="back-link">
        Search Another Employee
    </a>

    <br>

    <a href="home.jsp" class="back-link">
        Back to Dashboard
    </a>

</div>

</body>
</html>
