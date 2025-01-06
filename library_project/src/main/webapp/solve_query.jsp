<%@ page import="java.util.List" %>
<%@ page import="library_project.dto.Querys" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solve Queries</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f5f5;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f4b41a;
            color: white;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        textarea {
            width: 100%;
            height: 60px;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Styling for the Go to Home Button */
        .home-button {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }

        .home-button:hover {
            background-color: #0056b3;
        }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            // When a solution is submitted
            $('form').on('submit', function(event) {
                event.preventDefault(); // Prevent form from reloading the page

                var form = $(this);
                var solution = form.find('textarea[name="solution"]').val();
                var queryId = form.find('input[name="queryId"]').val();

                $.ajax({
                    url: 'saveSolution',  // URL to send the data to (the endpoint that saves the solution)
                    type: 'POST',
                    data: {
                        solution: solution,
                        queryId: queryId
                    },
                    success: function(response) {
                        // If the solution is successfully saved, hide the row
                        form.closest('tr').fadeOut();  // Hide the row with animation
                    },
                    error: function() {
                        alert('There was an error while saving the solution.');
                    }
                });
            });
        });
    </script>
</head>
<body>

    <!-- Go to Home Button -->
    <a href="l_home.jsp" class="home-button">Go to Home</a>

    <h1>Solve Queries</h1>

    <table>
        <thead>
            <tr>
                <th>Query ID</th>
                <th>Student Query</th>
                <th>Solution</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Querys> queries = (List<Querys>) request.getAttribute("ls");
                if (queries != null && !queries.isEmpty()) {
                    for (Querys query : queries) {
            %>
            <tr>
                <td><%= query.getId() %></td>
                <td><%= query.getQueryText() %></td>
                <td>
                    <form action="saveSolution" method="post">
                        <textarea name="solution" placeholder="Type your solution here..." required></textarea>
                        <input type="hidden" name="queryId" value="<%= query.getId() %>">
                        <button type="submit">Submit Solution</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3" style="text-align: center;">No queries available.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
