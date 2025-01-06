<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #ffc0cb; /* Light pink color */
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333333;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #555555;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-group input:focus {
            border-color: #0066cc;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 102, 204, 0.5);
        }

        .form-actions {
            margin-top: 20px;
        }

        .form-actions button {
            width: 100%;
            padding: 10px;
            background-color: #0066cc;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-actions button:hover {
            background-color: #004da3;
        }

        .form-links {
            margin-top: 15px;
        }

        .form-links a {
            color: #0066cc;
            text-decoration: none;
            font-size: 14px;
        }

        .form-links a:hover {
            text-decoration: underline;
        }

        .form-links .registration-link {
            margin-top: 10px;
            display: block;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Librarian Login</h2>
        <form action="logi" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="pwd" placeholder="Enter your password" required>
            </div>
            <div class="form-actions">
                <button type="submit">Log In</button>
                <%String s1=(String)request.getAttribute("s");%>
                <%if(s1!=null)
        	{
        	out.print("<h4 style='color:red'>"+s1+"</h4>");
        	}
        	%>
            </div>
            <div class="form-links">
                <a href="l_forget.jsp" class="forgot-password-link">Forgot Password?</a>
                <a href="l_register.jsp" class="registration-link">Not yet registered? Go to Registration</a>
            </div>
        </form>
    </div>
</body>
</html>
