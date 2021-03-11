import entities.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", urlPatterns = "/products")
public class ProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handle(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        handle(request,response);
    }
    private static void handle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       String action = request.getParameter("action");
//       switch (action){
//           case "login":
//           break;
//       }
        List<Product> products = getAllProduct();
        request.setAttribute("product",new Product(100,"Quan tai",200.5f));
        request.setAttribute("products", products);
        request.getRequestDispatcher("/product/list.jsp")
                .forward(request,response);
    }
    public static List<Product> getAllProduct(){
        List<Product> products = new ArrayList<Product>();
        products.add(new Product(1,"product 1",5.4f));
        products.add(new Product(2,"product 2",51.4f));
        return products;
    }
}
