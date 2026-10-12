
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>

    <style>
        /* Style the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0fdf4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Style the success card */
        .success-box {
            background-color: white;
            padding: 40px;
            width: 350px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* Style the success icon */
        .success-icon {
            font-size: 55px;
            color: #16a34a;
        }

        /* Style the heading */
        h2 {
            color: #15803d;
            margin-bottom: 15px;
        }

        /* Style the message */
        p {
            color: #555;
            line-height: 1.6;
        }

        /* Style the login button */
        .login-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            background-color: #16a34a;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        /* Change button color on hover */
        .login-btn:hover {
            background-color: #15803d;
        }
    </style>
</head>

<body>

    <div class="success-box">

        <!-- Display the success icon -->
        <div class="success-icon">&#10004;</div>

        <!-- Display the message received from the Servlet -->
        <h2>${message}</h2>

        <p>Your employee registration has been completed.</p>

        <!-- Navigate to the login page -->
        <a href="login.html" class="login-btn">Go to Login</a>

    </div>

</body>
</html>
