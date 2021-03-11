package controller;

import model.entities.Person;
import model.service.PersonService;
import model.service.PersonServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "PersonServlet", value = "/persons")
public class PersonServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PersonService ps = new PersonServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deletePerson(request, response);
                break;
            case "view":
                viewPerson(request, response);
                break;
            default:
                listPersons(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createPerson(request, response);
                break;
            case "edit":
                updatePerson(request, response);
                break;
            case "search":
                searchPerson(request, response);
                break;
            default:
                break;
        }
    }

    private void listPersons(HttpServletRequest request, HttpServletResponse response) {
        List<Person> persons = this.ps.findAll();
        request.setAttribute("persons", persons);

        RequestDispatcher dispatcher = request.getRequestDispatcher("person/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("person/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createPerson(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String address = request.getParameter("add");
        String id = request.getParameter("id");

        Person customer = new Person(id, name, username, email, address);
        this.ps.save(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("person/create.jsp");
        request.setAttribute("message", "New person was created");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Person person = this.ps.findById(id);
        RequestDispatcher dispatcher;
        if (person == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("person", person);
            dispatcher = request.getRequestDispatcher("person/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void updatePerson(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String username = request.getParameter("username");

        Person person = this.ps.findById(id);

        RequestDispatcher dispatcher;
        if(person == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            person.setName(name);
            person.setEmail(email);
            person.setAddress(address);
            person.setUsername(username);

            this.ps.update(id, person);

            request.setAttribute("person", person);
            request.setAttribute("message", "Person information was updated");
            dispatcher = request.getRequestDispatcher("person/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void deletePerson(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Person person = this.ps.findById(id);
        RequestDispatcher dispatcher;
        if(person == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            this.ps.remove(id);
            try {
                response.sendRedirect("/persons");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    private void viewPerson(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        getPersonDetail(request, response, id);
    }
    private void searchPerson(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("idSearch");
        getPersonDetail(request, response, id);
    }

    private void getPersonDetail(HttpServletRequest request, HttpServletResponse response, String id) {
        Person person = this.ps.findById(id);
        RequestDispatcher dispatcher;
        if(person == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("person", person);
            dispatcher = request.getRequestDispatcher("person/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
