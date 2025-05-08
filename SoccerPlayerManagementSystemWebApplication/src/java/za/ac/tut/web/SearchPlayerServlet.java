package za.ac.tut.web;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.PlayerFacadeLocal;
import za.ac.tut.model.entities.Player;

public class SearchPlayerServlet extends HttpServlet {

    @EJB
    private PlayerFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Parse player ID from form
            String idStr = request.getParameter("id");
            Long id = Long.parseLong(idStr);

            // Search for player
            Player player = pfl.find(id);

            if (player != null) {
                request.setAttribute("player", player);
                RequestDispatcher rd = request.getRequestDispatcher("search_output.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("error", "Player with ID " + id + " not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid ID format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Replace with logger in real use
            request.setAttribute("error", "An unexpected error occurred.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
