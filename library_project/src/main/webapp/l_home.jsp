<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Librarian Home</title>
    <style>
        /* Styling for the badge displaying the approval count */
        .badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px;
            font-size: 12px;
            font-weight: bold;
        }
        /* Navbar and page styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #3B5998;  /* Navbar background color */
            color: white;
            padding: 10px 20px;
        }

        .menu-wrapper {
            position: relative;
        }

        .menu-icon {
            font-size: 30px;
            cursor: pointer;
            color: white;
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
            flex: 1;
            text-align: center;
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

        .content {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-top: 20px;
        }

        .text-section {
            flex: 1;
        }

        .image-section {
            flex: 1;
            text-align: center;
            background: #F0F8FF;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .marquee {
            background-color: #3B5998;
            color: white;
            padding: 10px;
            text-align: center;
            font-size: 18px;
        }

        @media screen and (max-width: 768px) {
            .content {
                flex-direction: column;
                align-items: center;
            }

            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<div class="navbar">
    <!-- Side Menu -->
    <div class="menu-wrapper" onmouseover="toggleMenu('sideMenu')" onmouseout="toggleMenu('sideMenu')">
        <div class="menu-icon">&#9776;</div>
        <div class="side-menu" id="sideMenu">
            <a href="fetch" class="menu-item">Profile</a>
            <a href="l_update.jsp" class="menu-item">Update</a>
            <a href="delete" class="menu-item">Delete</a>
            <a href="logout" class="menu-item">Logout</a>
        </div>
    </div>

    <h2 class="navbar-heading">Librarian Home Page</h2>

    <!-- Action Buttons with dynamic approval count -->
    <div class="action-buttons">
        <a href="appr" class="action-button">
            Approve Request
            <!-- Approval count badge -->
            <span class="badge">${approvalCount}</span>
        </a>
        <a href="add_books.jsp" class="action-button">Add Book</a>
        <a href="borrow" class="action-button">Borrower Data</a>
        <a href="qsol" class="action-button">Solve Queries</a>
    </div>
</div>

<!-- Main Content Section -->
<div class="content">
    <div class="text-section">
        <h2>Adding Books</h2>
        <p>Adding books is one of the core responsibilities of a librarian. It ensures that the library has an updated collection for users.</p>

        <h2>Importance of Librarian Tasks</h2>
        <p>Librarians play a vital role in maintaining a well-organized library, assisting users in accessing resources, and managing administrative tasks.</p>
    </div>

    <!-- Image Section or Extra Content -->
    <div class="image-section">
        <h1>Library System</h1>
        <p>Where knowledge meets organization</p>
    </div>
</div>

<!-- Marquee Section -->
<div class="marquee">
    <p>Welcome to the Library System! Manage books, approve requests, borrow data, and solve queries effectively.</p>
</div>

<!-- Internal JavaScript for menu toggle -->
<script>
    function toggleMenu(menuId) {
        const menu = document.getElementById(menuId);
        if (menu.style.display === 'block') {
            menu.style.display = 'none';
        } else {
            menu.style.display = 'block';
        }
    }
</script>

</body>
</html>
