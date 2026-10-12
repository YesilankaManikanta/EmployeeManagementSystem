
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Check whether the user is logged in
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
<title>Delete Employee</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 30px;
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
        color: #dc3545;
        margin-bottom: 25px;
    }

    p {
        color: #555;
        text-align: center;
        line-height: 1.5;
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
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }

    button {
        width: 100%;
        padding: 12px;
        background: #dc3545;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    button:hover {
        background: #b02a37;
    }

    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #007bff;
        text-decoration: none;
    }
    .delete-btn {
    width: 100%;
    padding: 12px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

	.delete-btn:hover,
	.delete-btn:active {
	    background-color: #dc3545;
	}
</style>
</head>

<body>

<div class="container">

    <h2>Delete Employee</h2>

    <p>
        Enter the Employee ID of the record you want to delete.
    </p>

    <!-- Submit the employee ID to the delete servlet -->
    <form action="deleteEmployee" method="post">

        <label for="empId">Employee ID</label>

        <input type="number"
               id="empId"
               name="empId"
               min="1"
               required
               placeholder="Enter Employee ID">

				<button type="submit"
				        class="delete-btn"
				        onclick="return confirm('Are you sure you want to delete this employee?')">
				    Delete Employee
				</button>

    </form>

    <a href="home.jsp" class="back-link">
        Back to Dashboard
    </a>

</div>

</body>
</html>
