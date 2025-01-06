<!DOCTYPE html>
<html>
<head>
    <title>Librarian Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffc0cb; /* Pink color */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        .form-container h2 {
            text-align: center;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        .form-container input[type="text"],
        .form-container input[type="email"],
        .form-container input[type="password"],
        .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-container input[type="radio"] {
            margin-right: 5px;
        }

        .form-container .gender {
            margin-bottom: 15px;
        }

        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #555;
        }

        .error-message {
            color: red;
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
        <h2>Librarian Registration</h2>
        <form onsubmit="return validateForm()" action="register" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="address">Address:</label>
            <textarea id="address" name="address" rows="3" required></textarea>

            <label>Gender:</label>
            <div class="gender">
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label>
            </div>

            <label for="password">Password:</label>
            <input type="password" id="password" name="pwd" required>

            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            <div id="error-message" class="error-message"></div>

            <button type="submit">Register</button>
            <a href="l_login.jsp">already have an account? log in</a><br>
            <%String s1=(String)request.getAttribute("s");%>
            <%if(s1!=null)
        	{
        	out.print("<h4 style='color:green'>"+s1+"</h4>");
        	}
        	%>
            <%String s2=(String)request.getAttribute("s1");%>
            <%if(s2!=null)
        	{
        	out.print("<h4 style='color:red'>"+s2+"</h4>");
        	}
        	%>
        </form>
    </div>
</body>
</html>
