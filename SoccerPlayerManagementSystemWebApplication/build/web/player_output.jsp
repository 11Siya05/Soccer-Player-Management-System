<%@page import="za.ac.tut.model.entities.Player"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Players List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f9f9f9;
        }

        h1 {
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #3498db;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #3498db;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
        }

        a:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>List of Players</h1>

    <%
        List<Player> players = (List<Player>) request.getAttribute("player");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (players == null || players.isEmpty()) {
    %>
        <p>No players found.</p>
    <%
        } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Date of Birth</th>
                    <th>Contact</th>
                    <th>Nationality</th>
                    <th>Position</th>
                    <th>Team Name</th>
                    <th>Contract Start</th>
                    <th>Contract End</th>
                    <th>Salary</th>
                </tr>
            </thead>
            <tbody>
            <%
                for (Player p : players) {
            %>
                <tr>
                    <td><%= p.getFullnames() %></td>
                    <td><%= sdf.format(p.getDateOfBirth()) %></td>
                    <td><%= p.getContact() %></td>
                    <td><%= p.getNationality() %></td>
                    <td><%= p.getPosition() %></td>
                    <td><%= p.getTeam().getTeamName() %></td>
                    <td><%= sdf.format(p.getContract().getStartDate()) %></td>
                    <td><%= sdf.format(p.getContract().getEndDate()) %></td>
                    <td><%= p.getContract().getSalary() %></td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    <%
        }
    %>

    <a href="menu.jsp">Return to Menu</a>
</body>
</html>
