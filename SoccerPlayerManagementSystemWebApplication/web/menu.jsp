<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Menu Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .menu-container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }

        h1 {
            color: #2c3e50;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #555;
            margin-bottom: 25px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        li {
            margin: 12px 0;
        }

        a {
            display: block;
            text-decoration: none;
            color: #fff;
            background-color: #3498db;
            padding: 12px;
            border-radius: 6px;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover,
        a:focus {
            background-color: #2980b9;
            transform: translateY(-1px);
            outline: none;
        }
    </style>
</head>
<body>
    <div class="menu-container">
        <h1>Welcome to the Menu</h1>
        <p>Select an action below:</p>
        <ul>
            <li><a href="add_player.jsp">➕ Add a Player</a></li>
            <li><a href="update_player.jsp">✏️ Edit a Player</a></li>
            <li><a href="list_player.jsp">📋 View All Players</a></li>
            <li><a href="remove_player.jsp">🗑️ Remove a Player</a></li>
            <li><a href="search_player.jsp">🔍 Find a Player</a></li>
        </ul>
    </div>
</body>
</html>
