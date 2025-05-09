package za.ac.tut.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.PlayerFacadeLocal;
import za.ac.tut.model.entities.Player;

public class ListPlayerServlet extends HttpServlet {

    @EJB
    private PlayerFacadeLocal pfl;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch list of players (null-safe)
            List<Player> players = pfl.findAll();
            if (players == null) {
                players = new ArrayList<>();
            }

            // Pass list to JSP
            request.setAttribute("player", players);
            RequestDispatcher rd = request.getRequestDispatcher("player_output.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace(); // Replace with a logger in production
            response.sendRedirect("error.jsp"); // Optional: show friendly error page
        }
    }
}
