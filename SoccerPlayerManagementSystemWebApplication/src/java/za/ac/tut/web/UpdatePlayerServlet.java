package za.ac.tut.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.PlayerFacadeLocal;
import za.ac.tut.model.entities.Contract;
import za.ac.tut.model.entities.Player;
import za.ac.tut.model.entities.Team;

public class UpdatePlayerServlet extends HttpServlet {

    @EJB
    private PlayerFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Parse parameters
            Long id = Long.parseLong(request.getParameter("id"));
            String fullNames = request.getParameter("full_names");
            String dateOfBirthStr = request.getParameter("date_of_birth");
            String contact = request.getParameter("contact");
            String nationality = request.getParameter("nationality");
            String position = request.getParameter("position");
            String teamName = request.getParameter("team_name");
            String contractStartStr = request.getParameter("start_date");
            String contractEndStr = request.getParameter("end_date");
            double salary = Double.parseDouble(request.getParameter("salary"));

            // 2. Convert dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = sdf.parse(dateOfBirthStr);
            Date startDate = sdf.parse(contractStartStr);
            Date endDate = sdf.parse(contractEndStr);

            // 3. Retrieve existing player
            Player player = pfl.find(id);
            if (player == null) {
                request.setAttribute("error", "Player with ID " + id + " not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // 4. Update fields
            player.setFullnames(fullNames);
            player.setDateOfBirth(dateOfBirth);
            player.setContact(contact);
            player.setNationality(nationality);
            player.setPosition(position);

            // 5. Update team and contract
            Team team = new Team();
            team.setTeamName(teamName);
            player.setTeam(team);

            Contract contract = new Contract();
            contract.setStartDate(startDate);
            contract.setEndDate(endDate);
            contract.setSalary(salary);
            player.setContract(contract);

            // 6. Persist changes
            pfl.edit(player);

            // 7. Forward to output
            request.getRequestDispatcher("update_output.jsp").forward(request, response);

        } catch (ParseException | NumberFormatException e) {
            request.setAttribute("error", "Invalid input format: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
