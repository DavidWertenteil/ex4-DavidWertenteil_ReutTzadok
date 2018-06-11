/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.*;
/**
 *
 * @author davidwer
 */
public class BeansData {

    private String email;
    private String status;
    private Boolean state;

    public void setStatus(String status) {
        this.status = status;
    }

    public void setState(Boolean state) {
        this.state = state;
    }

    public String getStatus() {
        return status;
    }

    public Boolean getState() {
        return state;
    }

    public BeansData(String email) {
        this.email = email;
        this.status = "";
        this.state = true;
    }

    public BeansData(String email, String status, Boolean state) {
        this.email = email;
        this.status = status;
        this.state = state;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    private static HashMap users;

    static {
        users = new HashMap();
    }

    /**
     * Finds the customer with the given ID. Returns null if there is no match.
     *
     * @return info of that user
     */
    public static BeansData getUser(String email) {
        return ((BeansData) users.get(email));
    }

    public static void addUser(String email) {
        users.put(email, new BeansData(email));
    }

    public static void setUser(String email, String status, Boolean state) {
        users.put(email, new BeansData(email, status, state));
    }
}

