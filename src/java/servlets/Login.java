package servlets;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidwer, reutbar
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Validate the email
        String userEmail = request.getParameter("email");
        if (userEmail == null) {
            request.getRequestDispatcher("logout.jsp").forward(request, response);
        }

        // Set current user in session
        HttpSession session = request.getSession();
        userEmail = userEmail.toLowerCase().trim();
        session.setAttribute("userEmail", userEmail);

        // Set servletContext
        ServletContext context = getServletContext();
        synchronized (this) {
            if (context.getAttribute("users") == null) {
                //First user, create the list
                ArrayList<BeansData> users = new ArrayList<BeansData>();
                users.add(new BeansData(userEmail));
                context.setAttribute("users", users);
            } else {
                //Check if new user
                ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
                Boolean newUser = true;
                for (BeansData temp : users) {
                    //if user found, update state
                    if (temp.getEmail().compareTo(userEmail) == 0) {
                        temp.setState(true);
                        newUser = false;
                        break;
                    }
                }
                //if new user add to the list
                if (newUser == true) {
                    users.add(new BeansData(userEmail));
                }
                context.setAttribute("users", users);
            }
        }

        // forward to list.jsp page
        String address = "list.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

    @Override
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

}
