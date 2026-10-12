```jsp
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
<title>Search Employee</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 350px;
        margin: 100px auto;
        padding: 30px;
        background: white;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    h2 {
        color: #333;
        margin-bottom: 25px;
    }

    label {
        display: block;
        text-align: left;
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
        font-size: 15px;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #0056b3;
    }

    .back-link {
        display: inline-block;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
    }
</style>
</head>

<body>

<div class="container">

    <h2>Search Employee</h2>

    <!-- Submit the employee ID to the search servlet -->
    <form action="searchEmployee" method="get">

        <label for="empId">Employee ID</label>

        <input type="number"
               id="empId"
               name="empId"
               min="1"
               required
               placeholder="Enter Employee ID">

        <button type="submit">Search Employee</button>

    </form>

    <a href="home.jsp" class="back-link">
        Back to Dashboard
    </a>

</div>

</body>
</html>
```