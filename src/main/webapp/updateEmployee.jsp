
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Check whether the employee is logged in
    com.bean.EmployeeBean loggedEmployee =
        (com.bean.EmployeeBean) session.getAttribute("employee");

    if (loggedEmployee == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
    }

    .container {
        width: 350px;
        margin: 100px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }

    input {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        box-sizing: border-box;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #28a745;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background: #218838;
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

    <h2>Update Employee</h2>

    <!-- Submit employee ID to fetch existing details -->
    <form action="editEmployee" method="get">

        <label for="empId">Employee ID</label>

        <input type="number"
               id="empId"
               name="empId"
               min="1"
               required
               placeholder="Enter Employee ID">

        <button type="submit">Find Employee</button>

    </form>

    <a href="home.jsp" class="back-link">
        Back to Dashboard
    </a>

</div>

</body>
</html>
