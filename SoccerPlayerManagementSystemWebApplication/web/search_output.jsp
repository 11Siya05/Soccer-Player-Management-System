<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page import="za.ac.tut.model.entities.Player" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Player Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 600px;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        td:first-child {
            font-weight: bold;
            background-color: #f9f9f9;
            width: 40%;
        }

        a {
            display: inline-block;
            margin-top: 25px;
            padding: 10px 20px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            text-align: center;
        }

        a:hover {
            background-color: #2980b9;
        }

        .link-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Player Details</h1>
        <%
            Player player = (Player) request.getAttribute("player");
            if (player != null) {
                String name = player.getFullnames();
                Date date_of_birth = player.getDateOfBirth();
                String contact = player.getContact();
                String nationality = player.getNationality();
                String team_name = player.getTeam().getTeamName();
                String position = player.getPosition();
                Date start_date = player.getContract().getStartDate();
                Date end_date = player.getContract().getEndDate();
                Double salary = player.getContract().getSalary();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        %>
        <table>
            <tr><td>Full Names:</td><td><%= name %></td></tr>
            <tr><td>Date of Birth:</td><td><%= sdf.format(date_of_birth) %></td></tr>
            <tr><td>Contact:</td><td><%= contact %></td></tr>
            <tr><td>Nationality:</td><td><%= nationality %></td></tr>
            <tr><td>Position:</td><td><%= position %></td></tr>
            <tr><td>Team Name:</td><td><%= team_name %></td></tr>
            <tr><td>Contract Start Date:</td><td><%= sdf.format(start_date) %></td></tr>
            <tr><td>Contract End Date:</td><td><%= sdf.format(end_date) %></td></tr>
            <tr><td>Salary:</td><td><%= salary %></td></tr>
        </table>
        <%
            } else {
        %>
            <p>No player details available.</p>
        <%
            }
        %>
        <div class="link-container">
            <a href="menu.jsp">Return to Menu</a>
        </div>
    </div>
</body>
</html>
