
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Failed</title>

    <style>
        /* Style the page */
        body {
            font-family: Arial, sans-serif;
            background-color: #fff1f2;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        /* Style the error card */
        .error-box {
            background-color: white;
            width: 350px;
            padding: 35px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        /* Style the error icon */
        .error-icon {
            font-size: 55px;
            color: #dc2626;
        }

        /* Style the heading */
        h2 {
            color: #dc2626;
        }

        /* Style the message */
        p {
            color: #555555;
            line-height: 1.6;
        }

        /* Style the retry button */
        .retry-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 12px 25px;
            background-color: #dc2626;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        /* Change button color on hover */
        .retry-btn:hover {
            background-color: #b91c1c;
        }
    </style>
</head>

<body>

    <div class="error-box">

        <!-- Display the error icon -->
        <div class="error-icon">&#10006;</div>

        <!-- Display the message received from the Servlet -->
        <h2>${message}</h2>

        <p>Please check your email and password and try again.</p>

        <!-- Navigate back to the login page -->
        <a href="login.html" class="retry-btn">Try Again</a>

    </div>

</body>
</html>
