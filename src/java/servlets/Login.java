/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidwer
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
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        System.out.println("debug " + request.getParameter("email"));
        BeansData user = BeansData.getUser(request.getParameter("email"));
        if (user == null) {
            String email = request.getParameter("email");
            user = new BeansData(email, "some text", true);
        } else {
            System.out.println("debug else"); //#
            user.setEmail(request.getParameter("email"));
        }
        for (TypeKey name : BeansData.getUsers().keySet()) {
            String key = name.toString();
            BeansData val = BeansData.getUser(key);
            String value = example.get(name).toString();
            System.out.println(key + " " + value);

        }

        session.setAttribute("beansData", user);

        System.out.println("debug end"); //#
        String address = "list.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }

}
