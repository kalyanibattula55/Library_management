<%@ page import="java.util.List" %>
<%@ page import="library_project.dto.Querys" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Query</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .left-half, .right-half {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }

        .left-half {
            background-color: #FFEBCC; /* Light yellow background */
            border-right: 1px solid #ddd;
        }

        .right-half {
            background-color: #FFFFFF;
            overflow-y: auto;
        }

        .query-section h2, .solution-section h2 {
            margin: 0;
            padding: 10px 0;
            color: #333;
        }

        textarea {
            width: 100%;
            height: 200px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 10px;
            font-size: 16px;
            resize: none;
        }

        button {
            margin-top: 10px;
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

        .solution {
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f0f0f0;
        }

        .solution h3 {
            margin: 0;
            font-size: 18px;
            color: #444;
        }

        .solution p {
            margin: 5px 0 0;
            font-size: 16px;
            color: #666;
        }

        /* Styling for the Go to Home Button */
        .home-button {
            margin-top: 30px; /* Increased margin-top to add more space */
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
</head>
<body>

<div class="container">
    <!-- Left Half: Type Query -->
    <div class="left-half">
        <div class="query-section">
        <a href="shome" class="home-button">Go to Home</a><br>
            <h2>Type Query</h2>
            <form action="sendQuery" method="post">
                <textarea name="queryText" placeholder="Type your query here..." required></textarea>
                <button type="submit">Send Query</button>
            </form>
        </div>

        <!-- Go to Home Button -->
    </div>

    <!-- Right Half: Display Solutions -->
    <div class="right-half">
        <div class="solution-section">
            <h2>Solutions</h2>
            <%
                List<Querys> queries = (List<Querys>) request.getAttribute("queries");
                if (queries != null && !queries.isEmpty()) {
                    for (Querys q : queries) {
                        String solutionText = q.getSolutionText();
            %>
            <div class="solution">
                <h3>Query:</h3>
                <p><%= q.getQueryText() %></p>

                <%
                    if (solutionText != null && !solutionText.isEmpty()) {
                %>
                    <h3>Solution:</h3>
                    <p><%= solutionText %></p>
                <%
                    } else {
                %>
                    <p><em>No solution available yet.</em></p>
                <%
                    }
                %>
            </div>
            <% 
                    }
                } else {
            %>
            <p>No queries or solutions available yet.</p>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
