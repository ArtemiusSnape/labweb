package controller.command;

import model.DAO.DAORequest;
import model.exceptions.DAOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteRequestCommand implements Command {
    final String urlPattern = "deleteRequest";
    final int accessLevel = 1;

    @Override
    public String getPattern() {
        return urlPattern;
    }

    @Override
    public int getAccessLevel() {
        return accessLevel;
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response, ServletContext servletContext) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/view/requestsView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response, ServletContext servletContext) throws ServletException, IOException {

        int request_id = Integer.parseInt(request.getParameter("request_id"));

        try {
            (new DAORequest()).deleteRequest(request_id);
        } catch (DAOException e) {
            e.printStackTrace();
        }

        ((HttpServletResponse)response).sendRedirect("/lab5_war_exploded/?command=requestsList");
    }
}
