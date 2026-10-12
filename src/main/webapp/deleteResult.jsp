
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Check whether the user is logged in
    com.bean.EmployeeBean loggedEmployee =
        (com.bean.EmployeeBean) session.getAttribute("employee");

    if (loggedEmployee == null) {
        response.sendRedirect("login.html");
        return;
    }

    // Retrieve the result message from the servlet
    String message = (String) request.getAttribute("message");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Delete Employee Result</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6fb;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 450px;
            margin: 80px auto;
            padding: 30px 25px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #1d4ed8;
            margin-top: 0;
        }

        .message {
            padding: 15px;
            margin: 20px 0;
            background-color: #f3f6fb;
            border-radius: 6px;
            color: #333;
            overflow-wrap: anywhere;
            line-height: 1.5;
        }

        .link-btn {
            display: block;
            width: 100%;
            padding: 12px;
            margin-top: 12px;
            background-color: #1d4ed8;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
        }

        .link-btn:hover {
            background-color: #1e40af;
        }

        @media screen and (max-width: 480px) {
            .container {
                margin: 40px auto;
                padding: 25px 18px;
            }
        }
    </style>
</head>

<body>

    <div class="container">

        <h2>Delete Employee Result</h2>

        <div class="message">
            <%= message == null
                ? "No result message available."
                : message %>
        </div>

        <a href="deleteEmployee.jsp" class="link-btn">
            Delete Another Employee
        </a>

        <a href="viewEmployees" class="link-btn">
            View All Employees
        </a>

        <a href="home.jsp" class="link-btn">
            Back to Dashboard
        </a>

    </div>

</body>
</html>
