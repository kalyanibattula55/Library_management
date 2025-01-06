<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="library_project.dto.L_dto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Details</title>
<style>
    /* Pool-inspired background */
    body {
        background-color: #E0F7FA; /* Light cyan */
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        box-sizing: border-box;
        border: 10px solid #4DD0E1; /* Turquoise border for frame effect */
        border-radius: 15px;
    }

    /* Profile container styling */
    .profile-container {
        background-color: #FFFFFF;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        padding: 30px;
        width: 60%;
        text-align: center;
    }

    /* Image styling */
    .image-div {
        width: 150px;
        height: 150px;
        border-radius: 50%;
        overflow: hidden;
        border: 5px solid #4DD0E1; /* Turquoise border */
        display: flex;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
    }

    .image-div img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    /* Upload button styling */
    .upload-button {
        background-color: #4DD0E1; /* Turquoise */
        color: white;
        font-size: 24px;
        padding: 10px;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        margin-bottom: 5px;
        display: inline-block;
    }

    .upload-text {
        font-size: 16px;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .finger-icon {
        margin-left: 5px;
        font-size: 20px;
    }

    /* File input hidden */
    .file-input {
        display: none;
    }

    /* Table styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 15px;
        text-align: center;
        border: 1px solid #ddd;
    }

    th.a {
        background-color: #80DEEA; /* Lighter turquoise */
        color: #FFFFFF;
        font-weight: bold;
    }

    td.b {
        background-color: #E0F2F1; /* Light teal */
    }

    /* Hover effect for rows */
    tr:hover td {
        background-color: #B2EBF2;
    }

    /* Home page link */
    .home-link {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #4DD0E1;
        font-size: 18px;
    }

    .home-link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<% L_dto p = (L_dto) request.getAttribute("l"); %>

<div class="profile-container">
    <!-- Image Section -->

    <!-- Upload Section -->

    <!-- User Details Table -->
    <table>
        <tr>
            <th class="a">Name</th>
            <th class="a">Email</th>
            <th class="a">Gender</th>
            <th class="a">Address</th>
        </tr>
        <tr>
            <td class="b"><%if(p!=null)
            	{
            	out.print(p.getName());
            	}
            	%></td>
            <td class="b"><%if(p!=null)
            	{
            	out.print(p.getEmail());
            	}
            	%></td>
            <td class="b"><%if(p!=null)
            	{
            	out.print(p.getGender());
            	}
            	%></td>
            <td class="b"><%if(p!=null)
            	{
            	out.print(p.getAddress());
            	}
            	%></td>
            
        </tr>
    </table>
    
    <!-- Link to Home Page -->
    <a href="l_home.jsp" class="home-link">Go to Home Page?</a>
</div>

</body>
</html>
