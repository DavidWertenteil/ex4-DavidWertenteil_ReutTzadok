/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.annotation.WebListener;
//
///**
// *
// * @author davidwer
// */
//@WebListener
//public class Listener implements SessionRequestListener {
//
//    @Override
//    public void requestDestroyed(ServletRequestEvent servletRequestEvent) {
//        ServletContext context = servletRequestEvent.getServletContext();
//        if (context != null) {
//            ArrayList<BeansData> users = (ArrayList<BeansData>) context.getAttribute("users");
//            String user = (String) servletRequestEvent.getS("userEmail");
//            for (BeansData temp : users) {
//                if (temp.getEmail().compareTo(user) == 0) {
//                    temp.setState(false);
//                    break;
//                }
//            }
//        }
//    }
//
//    @Override
//    public void requestInitialized(ServletRequestEvent servletRequestEvent) {
//    }
//}
