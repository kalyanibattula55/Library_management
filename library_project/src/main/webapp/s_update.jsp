<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: #fff;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.5);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffeb3b;
        }
        label {
            font-size: 14px;
            font-weight: bold;
            color: #ffccbc;
        }
        input[type="text"], input[type="email"], input[type="password"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            background-color: #f3f4f6;
            color: #333;
        }
        input[type="radio"] {
            margin: 0 5px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #ff6f61;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #ff8a65;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Your Details</h2>
        <form action="supdate" method="post">
            <label for="fname">First Name:</label>
            <input type="text" id="fname" name="name" required>
            
                 
            <label for="gender">Gender:</label><br>
            <input type="radio" id="male" name="gender" value="Male"> Male
            <input type="radio" id="female" name="gender" value="Female"> Female
            <br><br>
            
            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="pwd" required>
            
            <label for="password">Branch:</label>
            <input type="text" id="password" name="branch" required>
            
            
            <input type="submit" value="Update">
        </form>
    </div>
</body>
</html>
