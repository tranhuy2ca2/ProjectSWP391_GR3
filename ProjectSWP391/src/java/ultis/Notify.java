/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ultis;

import DAO.ContactDAO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import model.Customer;

/**
 *
 * @author Asus
 */
public class Notify {
    
    public static void getNotify(HttpServletRequest request, Customer cus ){
        ContactDAO condao = new ContactDAO();
        HttpSession ses = request.getSession();
        if(cus != null && cus.getRole().equals("1")){ //addmin
           boolean notify = condao.getAdminNotify();
           ses.setAttribute("notify", notify);
       }else if(cus != null && cus.getRole().equals("2")){ // user
           boolean notify = condao.getUserNotify(cus.getUserID());
            ses.setAttribute("notify", notify);
       }
    }
    
    public static  void updateReadStatus(HttpServletRequest request, int uid, String role){
        ContactDAO condao = new ContactDAO();
        condao.UpdateStatusNotify(uid, role);
        setNotify(request, false);
    }
    
     public static void setNotify(HttpServletRequest request ,boolean noti){
         HttpSession ses = request.getSession();
         ses.setAttribute("notify", noti);
     }
}
