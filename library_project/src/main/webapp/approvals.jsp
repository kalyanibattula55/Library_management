<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Approval Requests</title>
    <style>
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .accept-button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 8px 12px;
            cursor: pointer;
            text-align: center;
        }
        .accept-button:hover {
            background-color: #45a049;
        }
        .home-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            font-size: 16px;
        }
        .home-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <!-- Go to Home Button -->
    <a href="l_home.jsp">
        <button class="home-button">Go to Home</button>
    </a>

    <h1 style="text-align: center;">Approval Requests</h1>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Address</th>
                <th>Gender</th>
                <th>Branch</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${ls}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.address}</td>
                    <td>${student.gender}</td>
                    <td>${student.branch}</td>
                    <td>
                        <form action="accept" method="post">
                            <input type="hidden" name="email" value="${student.email}">
                            <button type="submit" class="accept-button">Accept</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
