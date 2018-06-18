/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author davidwer
 */
public class Update extends HttpServlet {

    /**
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/JSON;charset=UTF-8");
        HttpSession session = request.getSession();
        synchronized (this) {
            ServletContext context = getServletContext();
            Timestamp serverTimestamp = (Timestamp) context.getAttribute("timestamp");
            Timestamp clientTimestamp = (Timestamp) session.getAttribute("clientTimestamp");

            session.setAttribute("clientTimestamp", new Timestamp(new Date().getTime()));
            if (clientTimestamp == null || serverTimestamp == null || serverTimestamp.after(clientTimestamp) || session.getAttribute("edit") != null) {
                JsonArray updateUsers = new JsonArray();
                ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
                String gson = new Gson().toJson(users);
                response.getWriter().write(gson);
            }
        }
    }
    /**
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
