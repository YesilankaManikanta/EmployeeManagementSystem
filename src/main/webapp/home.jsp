
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    // Retrieve employee details from the session
    com.bean.EmployeeBean employee =
        (com.bean.EmployeeBean) session.getAttribute("employee");

    // Redirect to login if the user is not logged in
    if (employee == null) {
        response.sendRedirect("login.html");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Dashboard</title>

    <style>
        /* Reset default spacing */
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6fb;
            margin: 0;
            color: #333;
        }

        /* Navigation bar */
        .navbar {
            background-color: #1d4ed8;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
        }

        .navbar h2 {
            margin: 0;
            font-size: 22px;
        }

        .logout-btn {
            background-color: white;
            color: #1d4ed8;
            padding: 10px 16px;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            white-space: nowrap;
        }

        .logout-btn:hover {
            background-color: #e0e7ff;
        }

        /* Main content */
        .container {
            width: 100%;
            max-width: 700px;
            margin: 35px auto;
            padding: 0 20px;
        }

        /* Employee details card */
        .card {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            color: #1d4ed8;
            margin-top: 0;
            font-size: 23px;
            overflow-wrap: anywhere;
        }

        .welcome-text {
            margin-bottom: 22px;
            color: #555;
        }

        /* Employee details */
        .detail {
            padding: 14px 0;
            border-bottom: 1px solid #eeeeee;
            color: #444;
            overflow-wrap: anywhere;
        }

        .detail strong {
            display: inline-block;
            width: 150px;
            color: #222;
        }

        /* Dashboard button layout */
        .button-container {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 12px;
            margin-top: 20px;
        }

        /* Common style for all four buttons */
        .action-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            min-width: 0;
            min-height: 46px;
            padding: 12px 8px;
            background-color: #1d4ed8;
            color: white;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            overflow-wrap: anywhere;
            transition: background-color 0.3s ease;
        }

        /* Same color for all buttons */
        .view-btn,
        .search-btn,
        .delete-btn {
            background-color: #1d4ed8;
            color: white;
        }

        /* Same hover color for all buttons */
        .action-btn:hover,
        .action-btn:active {
            background-color: #1e40af;
            color: white;
        }

        /* Mobile and tablet responsive design */
        @media screen and (max-width: 600px) {
            .navbar {
                padding: 14px;
                flex-wrap: wrap;
            }

            .navbar h2 {
                font-size: 18px;
                line-height: 1.4;
            }

            .container {
                margin: 20px auto;
                padding: 0 12px;
            }

            .card {
                padding: 20px 15px;
            }

            .card h3 {
                font-size: 21px;
            }

            .detail strong {
                display: block;
                width: auto;
                margin-bottom: 6px;
            }

            .detail {
                line-height: 1.5;
            }

            .button-container {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 10px;
            }

            .action-btn {
                min-height: 46px;
                padding: 12px 5px;
                font-size: 13px;
            }
        }

        /* Very small mobile screens */
        @media screen and (max-width: 340px) {
            .button-container {
                grid-template-columns: 1fr;
            }

            .action-btn {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>

    <!-- Navigation bar -->
    <div class="navbar">
        <h2>Employee Management System</h2>

        <a href="logout" class="logout-btn">
            Logout
        </a>
    </div>

    <!-- Main dashboard content -->
    <div class="container">

        <div class="card">

            <!-- Welcome message -->
            <h3>Welcome, ${employee.empName}!</h3>

            <p class="welcome-text">
                You have successfully logged in.
            </p>

            <!-- Employee details -->
            <div class="detail">
                <strong>Employee ID:</strong>
                ${employee.empId}
            </div>

            <div class="detail">
                <strong>Employee Name:</strong>
                ${employee.empName}
            </div>

            <div class="detail">
                <strong>Email:</strong>
                ${employee.email}
            </div>

            <div class="detail">
                <strong>Department:</strong>
                ${employee.department}
            </div>

            <div class="detail">
                <strong>Salary:</strong>
                ${employee.salary}
            </div>

            <!-- Dashboard buttons -->
            <div class="button-container">

                <a href="viewEmployees"
                   class="action-btn view-btn">
                    View All Employees
                </a>

                <a href="searchEmployee.jsp"
                   class="action-btn search-btn">
                    Search Employee
                </a>

                <a href="updateEmployee.jsp"
                   class="action-btn view-btn">
                    Update Employee
                </a>

                <a href="deleteEmployee.jsp"
                   class="action-btn delete-btn">
                    Delete Employee
                </a>

            </div>

        </div>
    </div>

</body>
</html>
