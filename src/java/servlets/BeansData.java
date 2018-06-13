/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.util.*;

/**
 *
 * @author davidwer, reutbar
 */
public class BeansData {

    private String email;
    private String status;
    private Boolean state;

    public BeansData(String email) {
        this.email = email;
        this.status = "No status provided!";
        this.state = true;
    }

    public BeansData(String email, String status, Boolean state) {
        this.email = email;
        this.status = status;
        this.state = state;
    }

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

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
}
