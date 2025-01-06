<!DOCTYPE html>
<html>
<head>
    <title>Student Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8; /* Professional light gray background */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff; /* Clean white background */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15); /* Softer shadow for a modern look */
            width: 450px;
        }

        .form-container h2 {
            text-align: center;
            color: #2c3e50; /* Dark professional text color */
            font-weight: 600;
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin-bottom: 6px;
            color: #34495e; /* Subtle gray for labels */
            font-weight: 500;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #d1d8e0; /* Light border */
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        .form-container input[type="text"]:focus,
        .form-container input[type="email"]:focus,
        .form-container input[type="password"]:focus {
            border-color: #3498db; /* Blue border on focus */
            outline: none;
        }

        .form-container input[type="radio"] {
            margin-right: 8px;
        }

        .form-container .gender {
            margin-bottom: 20px;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background-color: #3498db; /* Professional blue color */
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #2980b9; /* Darker blue on hover */
        }

        .form-container a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #3498db; /* Link blue color */
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .form-container a:hover {
            color: #2980b9; /* Darker blue on hover */
        }

        .error-message {
            color: #e74c3c; /* Red for error messages */
            font-size: 14px;
            margin-top: -10px;
            margin-bottom: 10px;
        }
    </style>
    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                document.getElementById("error-message").innerText = "Passwords do not match!";
                return false;
            }
            document.getElementById("error-message").innerText = "";
            return true;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Student Registration</h2>
        <form onsubmit="return validateForm()" action="registerStudent" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label>Gender:</label>
            <div class="gender">
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label>
            </div>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="branch">Branch:</label>
            <input type="text" id="branch" name="branch" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="pwd" required>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <div id="error-message" class="error-message"></div>

            <button type="submit">Register</button>
            <a href="s_login.jsp">Already have an account? Log in</a><br>
            <% String s1 = (String) request.getAttribute("s"); %>
            <% if (s1 != null) { %>
            <h4 style="color:green"><%= s1 %></h4>
            <% } %>
            <% String s3 = (String) request.getAttribute("s3"); %>
            <% if (s3 != null) { %>
            <h4 style="color:red"><%= s3 %></h4>
            <% } %>
        </form>
    </div>
</body>
</html>
