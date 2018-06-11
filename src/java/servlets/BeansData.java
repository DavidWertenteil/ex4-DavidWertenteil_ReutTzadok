/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

/**
 *
 * @author davidwer
 */
public class BeansData {
    private String email = "null";
//    private String[] email = null;
    private String[]  status = null;
    private Boolean[] state = null;

    public BeansData(String s) {
        this.email = s;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

}
