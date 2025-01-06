<!DOCTYPE html>
<html>
<head>
    <title>Student Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px 30px;
            width: 300px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #4CAF50;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        input[type="email"], input[type="password"] {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .links {
            margin-top: 15px;
        }

        .links a {
            text-decoration: none;
            color: #4CAF50;
            margin: 5px 0;
            display: inline-block;
            font-size: 14px;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Student Login</h2>
        <form action="slog" method="post">
            <input type="email" name="email" placeholder="Enter your email" required>
            <input type="password" name="pwd" placeholder="Enter your password" required>
            <input type="submit" value="Login">
        </form>
        <div class="links">
            <a href="s_register.jsp">Not yet registered? Go to Register page</a><br>
            <a href="s_forgetp.jsp">Forgot Password?</a><br>
            <a href="request.jsp">Request Form</a>
        </div>
        <%String s=(String)request.getAttribute("me"); %>
        <%if(s!=null)
        	{
        	out.print("<h4 style='color:green'>"+s+"</h4>");
        	}
        	%>
        	<%String s2=(String)request.getAttribute("s");%>
                <%if(s2!=null)
        	{
        	out.print("<h4 style='color:red'>"+s2+"</h4>");
        	}
        	%>
    </div>
</body>
</html>
