/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.websocket.Session;

///**
// *
// * @author davidwer
// */
@WebListener
public class Listener implements HttpSessionListener {

    @Override
    public void sessionDestroyed(HttpSessionEvent sessionEvent) {
        HttpSession session = sessionEvent.getSession();

        if (session.getAttribute("userEmail") != null) {
            synchronized (this) {
                ServletContext context = session.getServletContext();
                ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
                String user = (String) session.getAttribute("userEmail");
                for (BeansData temp : users) {
                    if (temp.getEmail().compareTo(user) == 0) {
                        temp.setState(false);
                        break;
                    }
                }
            }
        }
    }

    @Override
    public void sessionCreated(HttpSessionEvent session) {
    }
}
