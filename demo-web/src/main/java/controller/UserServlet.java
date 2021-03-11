package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "controller.UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "login":
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                if (name.equals("admin") && password.equals("123")) {
                    response.sendRedirect("/persons");
                } else {
                    request.setAttribute("error", "Invalid Username or Password");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                    dispatcher.include(request, response);
                }
                break;
        }
    }
}
