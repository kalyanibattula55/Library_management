<%@ page import="java.util.List" %>
<%@ page import="library_project.dto.Book" %>
<%@ page import="library_project.dto.Borrower_data" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="library_project.dto.S_dto" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Borrowed Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            padding: 20px;
        }

        .table-container {
            margin: 20px auto;
            width: 80%;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        .submit-button {
            background-color: #FF6F61;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #FF4C3B;
        }

        .message {
            color: green;
            text-align: center;
            margin-top: 20px;
        }

        /* Home button style */
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
    <a href="shome">
        <button class="home-button">Go to Home</button>
    </a>

    <h2 class="title">My Borrowed Books</h2>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Borrow Date</th>
                    <th>Submit Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Borrower_data> borrowedBooks = (List<Borrower_data>) request.getAttribute("lb");

                    if (borrowedBooks != null && !borrowedBooks.isEmpty()) {
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                        for (Borrower_data borrower : borrowedBooks) {
                            for (Book book : borrower.getBook()) {
                                Date borrowDate = borrower.getBorrow_date();
                                Date submitDate = borrower.getSubmit_date();
                %>
                <tr>
                    <td><%= book.getName() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getGeanre() %></td>
                    <td><%= (borrowDate != null) ? sdf.format(borrowDate) : "N/A" %></td>
                    <td><%= (submitDate != null) ? sdf.format(submitDate) : "Not Submitted" %></td>
                    <td>
                        <%-- If the book is already submitted, disable the button --%>
                        <button class="submit-button" id="submitButton_<%= borrower.getId() %>"
                                <% if (submitDate != null) { %> disabled <% } %>
                                onclick="submitBook('<%= borrower.getId() %>')">Submit</button>
                    </td>
                </tr>
                <% 
                            }
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">No borrowed books found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <div class="message">
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.print(message);
            }
        %>
    </div>

    <script>
        function submitBook(borrowerDataId) {
            fetch('submitbook?borrowerDataId=' + borrowerDataId)
                .then(response => response.text())
                .then(data => {
                    alert('Book submitted successfully!');
                    document.getElementById('submitButton_' + borrowerDataId).disabled = true; // Disable button
                    document.getElementById('submitButton_' + borrowerDataId).innerText = 'Submitted'; // Change button text
                })
                .catch(error => console.error('Error:', error));
        }
    </script>

</body>

</html>
