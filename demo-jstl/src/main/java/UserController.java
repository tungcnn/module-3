import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserController", urlPatterns = "/users")
public class UserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("ac");
        if(action.equals("login")){
            String userName = request.getParameter("username");
            String password = request.getParameter("password");
            if(login(userName,password)){

               response.sendRedirect("products");

            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("user/login.jsp");
    }
    public static boolean login(String uName, String pwd){
        if(uName.equals("admin") && pwd.equals("123")){
            return true;
        }
        return false;
    }
}
