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

public class RemovePlayerServlet extends HttpServlet {

    @EJB
    private PlayerFacadeLocal pfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Parse player ID from request
            String idStr = request.getParameter("id");
            Long id = Long.parseLong(idStr);

            // Find the player
            Player player = pfl.find(id);

            if (player != null) {
                // Remove if exists
                pfl.remove(player);
                request.setAttribute("message", "Player removed successfully.");
                RequestDispatcher rd = request.getRequestDispatcher("remove_output.jsp");
                rd.forward(request, response);
            } else {
                // Player not found
                request.setAttribute("error", "Player with ID " + id + " not found.");
                RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);
            }

        } catch (NumberFormatException e) {
            // Invalid ID format
            request.setAttribute("error", "Invalid player ID format.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        } catch (Exception e) {
            // General error
            e.printStackTrace(); // Replace with logger in production
            request.setAttribute("error", "An error occurred while removing the player.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
