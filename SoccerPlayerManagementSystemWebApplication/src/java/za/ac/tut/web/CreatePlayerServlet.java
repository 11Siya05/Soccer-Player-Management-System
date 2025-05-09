package za.ac.tut.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.PlayerFacadeLocal;
import za.ac.tut.model.entities.Contract;
import za.ac.tut.model.entities.Player;
import za.ac.tut.model.entities.Team;

public class CreatePlayerServlet extends HttpServlet {

    @EJB
    private PlayerFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Get and parse parameters
            String fullNames = request.getParameter("full_names");
            String dateOfBirthStr = request.getParameter("date_of_birth");
            String contact = request.getParameter("contact");
            String nationality = request.getParameter("nationality");
            String position = request.getParameter("position");
            String teamName = request.getParameter("team_name");
            String contractStartStr = request.getParameter("start_date");
            String contractEndStr = request.getParameter("end_date");
            Double salary = Double.parseDouble(request.getParameter("salary"));

            // 2. Parse dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dateOfBirth = sdf.parse(dateOfBirthStr);
            Date startDate = sdf.parse(contractStartStr);
            Date endDate = sdf.parse(contractEndStr);

            // 3. Create related entities
            Contract contract = createContract(startDate, endDate, salary);
            Team team = createTeam(teamName);
            Player player = createPlayer(fullNames, contact, dateOfBirth, position, nationality, team, contract);

            // 4. Persist
            pfl.create(player);

            // 5. Redirect to success page
            response.sendRedirect("add_output.jsp");

        } catch (ParseException | NumberFormatException e) {
            e.printStackTrace();
            // Redirect to error page or display a message
            response.sendRedirect("error.jsp");
        }
    }

    private Contract createContract(Date startDate, Date endDate, double salary) {
        Contract contract = new Contract();
        contract.setStartDate(startDate);
        contract.setEndDate(endDate);
        contract.setSalary(salary);
        return contract;
    }

    private Team createTeam(String teamName) {
        Team team = new Team();
        team.setTeamName(teamName);
        return team;
    }

    private Player createPlayer(String fullNames, String contact, Date dateOfBirth, String position,
                                 String nationality, Team team, Contract contract) {
        Player player = new Player();
        player.setFullnames(fullNames);
        player.setContact(contact);
        player.setDateOfBirth(dateOfBirth);
        player.setPosition(position);
        player.setNationality(nationality);
        player.setTeam(team);
        player.setContract(contract);
        player.setCreationDate(new Date());
        return player;
    }
}
