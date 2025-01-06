<!DOCTYPE html>
<html>
<head>
    <title>Add Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .form-container {
            width: 50%;
            margin: 50px auto;
            padding: 20px;
            background-color: #fffacd; /* Light yellow color */
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .form-container h2 {
            text-align: center;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .form-group input:focus {
            border-color: #999;
            outline: none;
        }
        .submit-btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #45a049;
        }
        .home-link {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 14px;
            color: #4caf50;
            text-decoration: none;
            background-color: #fff;
            padding: 5px 10px;
            border: 1px solid #4caf50;
            border-radius: 5px;
        }
        .home-link:hover {
            background-color: #4caf50;
            color: white;
        }
    </style>
    <script>
        function validateForm() {
            const author = document.forms["addBookForm"]["author"].value;
            const name = document.forms["addBookForm"]["name"].value;
            const genre = document.forms["addBookForm"]["genre"].value;
            const quantity = document.forms["addBookForm"]["quantity"].value;

            if (author.trim() === "") {
                alert("Author field is required.");
                return false;
            }
            if (name.trim() === "") {
                alert("Book Name field is required.");
                return false;
            }
            if (genre.trim() === "") {
                alert("Genre field is required.");
                return false;
            }
            if (quantity === "" || isNaN(quantity) || quantity <= 0) {
                alert("Quantity must be a positive number.");
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <!-- Home Page Link -->
        <a href="l_home.jsp" class="home-link">Go to Home Page</a>

        <h2>Add a New Book</h2>
        <form name="addBookForm" action="addb" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="author">Author:</label>
                <input type="text" id="author" name="author" placeholder="Enter author's name">
            </div>
            <div class="form-group">
                <label for="name">Book Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter book name">
            </div>
            <div class="form-group">
                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="geanre" placeholder="Enter genre">
            </div>
            <div class="form-group">
                <label for="quantity">Quantity:</label>
                <input type="number" id="quantity" name="quantity" placeholder="Enter quantity">
            </div>
            <button type="submit" class="submit-btn">Add Book</button>
            <% String successMessage = (String) request.getAttribute("s"); %>
            <% if (successMessage != null) { %>
                <p style="color: green;"><%= successMessage %></p>
            <% } %>
        </form>
    </div>
</body>
</html>
