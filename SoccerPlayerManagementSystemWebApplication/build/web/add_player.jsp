<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Player</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }

        form {
            max-width: 600px;
            margin: auto;
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <form action="CreatePlayerServlet.do" method="post">
        <div class="form-group">
            <label for="full_names">Full Names</label>
            <input type="text" id="full_names" name="full_names" required placeholder="John Doe">
        </div>

        <div class="form-group">
            <label for="date_of_birth">Date of Birth</label>
            <input type="date" id="date_of_birth" name="date_of_birth" required>
        </div>

        <div class="form-group">
            <label for="contact">Contact</label>
            <input type="tel" id="contact" name="contact" required placeholder="+1234567890">
        </div>

        <div class="form-group">
            <label for="nationality">Nationality</label>
            <input type="text" id="nationality" name="nationality" required placeholder="Country">
        </div>

        <div class="form-group">
            <label for="position">Position</label>
            <input type="text" id="position" name="position" required placeholder="Midfielder">
        </div>

        <div class="form-group">
            <label for="team_name">Team Name</label>
            <input type="text" id="team_name" name="team_name" required placeholder="Team XYZ">
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
            <input type="number" id="salary" name="salary" required placeholder="50000" min="0">
        </div>

        <div class="form-group">
            <button type="submit">Add Player</button>
        </div>
    </form>
</body>
</html>
