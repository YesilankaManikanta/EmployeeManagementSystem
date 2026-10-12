
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.bean.EmployeeBean" %>

<%
    // Check whether the user is logged in
    EmployeeBean loggedEmployee =
        (EmployeeBean) session.getAttribute("employee");

    if (loggedEmployee == null) {
        response.sendRedirect("login.html");
        return;
    }

    // Retrieve employee details from the servlet
    EmployeeBean emp =
        (EmployeeBean) request.getAttribute("editEmployee");

    String errorMessage =
        (String) request.getAttribute("errorMessage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 30px;
    }

    .container {
        max-width: 450px;
        margin: 30px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 7px;
        font-weight: bold;
    }

    input {
        width: 100%;
        padding: 11px;
        margin-bottom: 18px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    input[readonly] {
        background: #eee;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #218838;
    }

    .error {
        text-align: center;
        color: #d9534f;
        margin-bottom: 20px;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #007bff;
    }
</style>
</head>

<body>

<div class="container">

    <h2>Edit Employee Details</h2>

    <% if (errorMessage != null) { %>

        <p class="error"><%= errorMessage %></p>

        <a href="updateEmployee.jsp" class="back-link">
            Try Another Employee ID
        </a>

    <% } else if (emp != null) { %>

        <!-- Submit modified employee details to the update servlet -->
        <form action="editEmployee" method="post">

            <label>Employee ID</label>
            <input type="number"
                   name="empId"
                   value="<%= emp.getEmpId() %>"
                   readonly>

            <label>Employee Name</label>
            <input type="text"
                   name="empName"
                   value="<%= emp.getEmpName() %>"
                   maxlength="100"
                   required>

            <label>Email</label>
            <input type="email"
                   name="email"
                   value="<%= emp.getEmail() %>"
                   maxlength="100"
                   required>

            <label>Department</label>
            <input type="text"
                   name="department"
                   value="<%= emp.getDepartment() == null ? "" : emp.getDepartment() %>"
                   maxlength="50">

            <label>Salary</label>
            <input type="number"
                   name="salary"
                   value="<%= emp.getSalary() %>"
                   min="0"
                   step="0.01"
                   required>

            <button type="submit">Update Employee</button>

        </form>

    <% } else { %>

        <p class="error">
            No employee details available. Please search by ID first.
        </p>

        <a href="updateEmployee.jsp" class="back-link">
            Search Employee
        </a>

    <% } %>

    <a href="home.jsp" class="back-link">
        Back to Dashboard
    </a>

</div>

</body>
</html>
