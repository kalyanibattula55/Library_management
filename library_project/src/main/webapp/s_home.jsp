<%@ page import="java.util.List" %>
<%@ page import="library_project.dto.Book" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Home Page</title>
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #3B5998;
            color: white;
            padding: 10px 20px;
        }

        .menu-wrapper {
            position: relative;
        }

        .menu-icon {
            font-size: 30px;
            cursor: pointer;
        }

        .side-menu {
            display: none;
            position: absolute;
            top: 50px;
            left: 0;
            background-color: #333;
            width: 180px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .menu-item {
            padding: 10px;
            color: white;
            text-decoration: none;
            display: block;
            border-bottom: 1px solid #ddd;
        }

        .menu-item:hover {
            background-color: #FF4500;
        }

        .navbar-heading {
            font-size: 24px;
            font-weight: bold;
        }

        .search-bar {
            margin: 20px;
            display: flex;
            justify-content: center;
        }

        .search-bar input {
            padding: 10px;
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 5px 0 0 5px;
            font-size: 16px;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .action-button {
            padding: 10px 15px;
            background-color: #FF6F61;  /* Button color */
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            position: relative;  /* Needed for positioning the count */
        }

        .action-button:hover {
            background-color: #FF4C3B;
        }
        .action-buttons {
                flex-direction: column;
            }

        .search-bar button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 0 5px 5px 0;
        }

        .search-bar button:hover {
            background-color: #45a049;
        }

        .book-table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        .book-table th, .book-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .book-table th {
            background-color: #4CAF50;
            color: white;
        }

        .borrow-button {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .borrow-button:hover {
            background-color: #45a049;
        }

        .borrow-button:disabled {
            background-color: grey;
            cursor: not-allowed;
        }

        .message {
            text-align: center;
            font-size: 16px;
            color: green;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <div class="menu-wrapper" onmouseover="toggleMenu('sideMenu')" onmouseout="toggleMenu('sideMenu')">
        <div class="menu-icon">&#9776;</div>
        <div class="side-menu" id="sideMenu">
            <a href="sprofile" class="menu-item">Profile</a>
            <a href="s_update.jsp" class="menu-item">Update</a>
            <a href="sdelete" class="menu-item">Delete Account</a>
            <a href="logou" class="menu-item">Logout</a>
        </div>
    </div>
    <a href="mylist" class="action-button">My Books</a>
    <a href="query.jsp" class="action-button">Send Query</a>
    <h2 class="navbar-heading">Student Home Page</h2>
</div>

<!-- Success/Failure Message -->
<div class="message">
    <%
        String message = (String) request.getAttribute("message");
        if (message != null) {
            out.print(message);
        }
    %>
</div>

<!-- Search Bar -->
<div class="search-bar">
    <form action="search" method="post">
        <input type="text" name="query" placeholder="Search books by name, author, or genre..." required>
        <button type="submit">Search</button>
    </form>
</div>

<!-- Book Table -->
<table class="book-table">
    <thead>
        <tr>
            <th>Book Name</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Quantity</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <%
            List<Book> books = (List<Book>) request.getAttribute("lb");
            if (books != null && !books.isEmpty()) {
                for (Book book : books) {
                    if (book.getQuantity() > 0) { // Exclude books with zero quantity
        %>
        <tr>
            <td><%= book.getName() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getGeanre() %></td>
            <td><%= book.getQuantity() %></td>
            <td>
                <button class="borrow-button" onclick="borrowBook('<%= book.getId() %>')">Borrow</button>
            </td>
        </tr>
        <%
                    }
                }
            } else {
        %>
        <tr>
            <td colspan="5">No books available</td>
        </tr>
        <% } %>
    </tbody>
</table>

<script>
    function toggleMenu(menuId) {
        const menu = document.getElementById(menuId);
        menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
    }

    function borrowBook(bookId) {
        const currentDate = new Date().toISOString().split('T')[0];

        const data = new URLSearchParams();
        data.append('id', bookId);
        data.append('date', currentDate);

        fetch('borrowBooks', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: data.toString()
        })
        .then(response => response.text())
        .then(data => {
            alert(data || 'Book borrowed successfully!');
            location.reload();
        })
        .catch(error => console.error('Error:', error));
    }
</script>

</body>
</html>
