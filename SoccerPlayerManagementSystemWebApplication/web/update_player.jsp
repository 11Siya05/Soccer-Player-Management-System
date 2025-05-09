<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Player</title>
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

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background-color: #f39c12;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #e67e22;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Player Details</h1>
        <form action="UpdatePlayerServlet.do" method="post">
            <div class="form-group">
                <label for="id">Player ID</label>
                <input type="text" id="id" name="id" required placeholder="Enter player ID">
            </div>
            <div class="form-group">
                <label for="full_names">Full Names</label>
                <input type="text" id="full_names" name="full_names" required placeholder="e.g., John Doe">
            </div>
            <div class="form-group">
                <label for="date_of_birth">Date of Birth</label>
                <input type="date" id="date_of_birth" name="date_of_birth" required>
            </div>
            <div class="form-group">
                <label for="contact">Contact</label>
                <input type="tel" id="contact" name="contact" required placeholder="e.g., +123456789">
            </div>
            <div class="form-group">
                <label for="nationality">Nationality</label>
                <input type="text" id="nationality" name="nationality" required placeholder="e.g., South African">
            </div>
            <div class="form-group">
                <label for="position">Position</label>
                <input type="text" id="position" name="position" required placeholder="e.g., Midfielder">
            </div>
            <div class="form-group">
                <label for="team_name">Team Name</label>
                <input type="text" id="team_name" name="team_name" required placeholder="e.g., Pirates FC">
            </div>
            <div class="form-group">
                <label for="start_date">Contract Start Date</label>
                <input type="date" id="start_date" name="start_date" required>
            </div>
            <div class="form-group">
                <label for="end_date">Contract End Date</label>
                <input type="date" id="end_date" name="end_date" required>
            </div>
            <div class="form-group">
                <label for="salary">Salary</label>
                <input type="number" id="salary" name="salary" required placeholder="e.g., 50000" min="0">
            </div>
            <button type="submit">Update Player</button>
        </form>
    </div>
</body>
</html>
