
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
            background-color: #f5f5f5;
        }

        .error-box {
            display: inline-block;
            padding: 30px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px #cccccc;
        }

        h2 {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            color: blue;
        }
    </style>
</head>
<body>

    <div class="error-box">
        <!-- Display the error message received from the Servlet -->
        <h2>${message}</h2>

        <p>Please check your details and try again.</p>

        <!-- Navigate back to the registration page -->
        <a href="register.html">Try Again</a>
    </div>

</body>
</html>
