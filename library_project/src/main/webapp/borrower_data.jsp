<%@ page import="java.util.List" %>
<%@ page import="library_project.dto.Book" %>
<%@ page import="library_project.dto.Borrower_data" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="library_project.dto.S_dto" %>
<%@ page import="java.text.DateFormat" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Borrowed Data</title>
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

        .search-container {
            margin-bottom: 20px;
        }

        .search-bar {
            padding: 5px;
            font-size: 14px;
            width: 20%;
        }

        /* New CSS for the Home link */
        .home-link {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 5px;
        }

        .home-link:hover {
            background-color: #45a049;
        }
    </style>
</head>

<body>

    <!-- Go to Home Page Link -->
    <a href="l_home.jsp" class="home-link">Go to Home Page</a>

    <h2 class="title">Borrowed Data</h2>

    <!-- Search Bar -->
    <div class="search-container">
        <form action="searchdata" method="GET">
            <input type="text" class="search-bar" name="searchQuery" placeholder="Search by student or status..." />
            <button type="submit" class="submit-button">Search</button>
        </form>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Book Name</th>
                    <th>Author</th>
                    <th>Genre</th>
                    <th>Student Name</th>
                    <th>Borrow Date</th>
                    <th>Submit Date</th>
                    <th>Fine &#8377;</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Borrower_data> borrowedBooks = (List<Borrower_data>) request.getAttribute("lb");
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                    if (borrowedBooks != null && !borrowedBooks.isEmpty()) {
                        for (Borrower_data borrower : borrowedBooks) {
                            for (Book book : borrower.getBook()) {
                                Date borrowDate = borrower.getBorrow_date();
                                Date submitDate = borrower.getSubmit_date();
                                long fine = 0;

                                // Calculate the fine if the book is not submitted and overdue by more than 10 days
                                if (submitDate == null) {
                                    long diffInMillies = new Date().getTime() - borrowDate.getTime();
                                    long diffDays = diffInMillies / (1000 * 60 * 60 * 24);
                                    if (diffDays > 10) {
                                        fine = (diffDays - 10) * 20; // Fine calculation after 10 days
                                    }
                                }
                %>
                <tr>
                    <td><%= book.getName() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getGeanre() %></td>
                    <td><%= borrower.getStudent().get(0).getName() %></td> <!-- Assuming one student per borrow -->
                    <td><%= (borrowDate != null) ? sdf.format(borrowDate) : "N/A" %></td>
                    <td><%= (submitDate != null) ? sdf.format(submitDate) : "Not Submitted" %></td>
                    <td>&#8377; <%= fine %></td>
                </tr>
                <% 
                            }
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7">No borrowed books found.</td>
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
