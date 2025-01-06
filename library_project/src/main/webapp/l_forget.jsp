<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFFBCC; /* Light Yellow Background */
            padding: 20px;
            margin: 0;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4CAF50;
        }

        label {
            font-size: 16px;
            color: #333;
            display: block;
            margin-bottom: 8px;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .submit-button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #45a049;
        }

        .message {
            text-align: center;
            color: red;
            font-size: 14px;
            margin-top: 15px;
        }

        .go-back {
            text-align: center;
            margin-top: 15px;
        }

        .go-back a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 14px;
        }

        .go-back a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Forgot Password</h2>

        <!-- Forgot Password Form -->
        <form id="forgotPasswordForm" method="post" action="resetPasswordd">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>

            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="pwd" placeholder="Enter new password" required>

            <label for="confirmPassword">Re-enter Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password" required>

            <button type="submit" class="submit-button" onclick="return validatePasswords()">Submit</button>
        </form>

        <!-- Error Message -->
        <div id="errorMessage" class="message"></div>

        <!-- Go back link -->
        <div class="go-back">
            <a href="l_login.jsp">Go back to Login</a>
        </div>
    </div>

    <script>
        // JavaScript for Password Validation
        function validatePasswords() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorMessage = document.getElementById("errorMessage");

            if (newPassword !== confirmPassword) {
                errorMessage.innerHTML = "Passwords do not match. Please try again.";
                return false; // Prevent form submission
            }

            // Reset error message if passwords match
            errorMessage.innerHTML = "";
            return true; // Allow form submission
        }
    </script>

</body>
</html>
