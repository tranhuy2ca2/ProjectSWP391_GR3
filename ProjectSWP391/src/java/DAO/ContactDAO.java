/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Contact;
import model.Customer;
import java.sql.SQLException;

/**
 *
 * @author TTT
 */
public class ContactDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";

    public ContactDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }
    public void SendContact(int UserID ,String username, String email, String subject, String detail,int status) {
        String sql = """
                     Insert into Contact (UserID, UserSend , Email , [Subject], Detail, CreateAt,status)
                     Values (?,?,?,?,?,GetDate(),?)""";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, subject);
            ps.setString(5, detail);
            ps.setInt(6, status);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public void SendContact1(String username, String email, String subject, String detail,int status) {
        String sql = """
                     Insert into Contact (UserSend , Email , [Subject], Detail, CreateAt,[status])
                     Values (?,?,?,?,GetDate(),?)""";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, detail);
            ps.setInt(5, status);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public List<Contact> getContactByUserID(int userID) {
        List<Contact> contact = new ArrayList<Contact>();
        String sql = """
                     select*from Contact
                     where UserID = ?""";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                contact.add(new Contact(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getString(8),
                        rs.getInt(9)
                ));
            }
        } catch (Exception e) {
        }
        return contact;
    }
    
    public List<Contact> getListContact(){
        List<Contact> contacts = new ArrayList<Contact>();
        String sql ="select * from Contact";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
             while (rs.next()) {
                contacts.add(new Contact(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getString(8),
                         rs.getInt(9)
                ));
            }
        } catch (Exception e) {
        }
        return contacts;
    }
    public void updateContactResponse(int contactID, String responseText) {
    String sql = "UPDATE [dbo].[Contact] SET [response] = ?, [status] = 3 WHERE [ContactID] = ?";

    try {
        // Use the existing connection object 'con' to prepare the statement
        ps = con.prepareStatement(sql);

        // Set the response text and contact ID in the prepared statement
        ps.setString(1, responseText);
        ps.setInt(2, contactID);

        // Execute the update
        int rowsAffected = ps.executeUpdate();
        if (rowsAffected > 0) {
            System.out.println("Contact updated successfully.");
        } else {
            System.out.println("No contact found with the provided ID.");
        }

    } catch (SQLException e) {
        e.printStackTrace();
        System.out.println("An error occurred while updating the contact.");
    }
}
    
    public boolean getAdminNotify(){
        String sql ="SELECT [ContactID],[status]\n" +
                            "  FROM [SWP391_G3_Project].[dbo].[Contact]\n" +
                            "  Where [status] = 1";
            try {
              ps = con.prepareStatement(sql);
              rs = ps.executeQuery();
              if(rs.next()) return  true;
              } catch (Exception e) {
              }
          return  false;
      }
    
        public boolean getUserNotify(int uid){
        String sql ="SELECT [ContactID]\n" +
                            "      ,[UserID]\n" +
                            "      ,[status]\n" +
                            "  FROM [SWP391_G3_Project].[dbo].[Contact]\n" +
                            "  Where UserID = ? and [status] = 3";
          try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, uid);
            rs = ps.executeQuery();
            if(rs.next()) return  true;
            } catch (Exception e) {
            }
        return  false;
    }
        
     public void UpdateStatusNotify( int uid, String  role){
         String sqlUser = "UPDATE [dbo].[Contact]\n" +
                            "   SET [status] = 2\n" +
                            " WHERE [UserID] = ? And status = 1 ";
         
         String sqlAdmin = "UPDATE [dbo].[Contact]\n" +
                            "   SET [status] = 4\n" +
                            " WHERE [status] = 3";
            try {
                if(role.equals("1")){
                     ps = con.prepareStatement(sqlAdmin);
                     ps.executeUpdate();
                }else if(role.equals("2")){
                    ps = con.prepareStatement(sqlUser);
                    ps.setInt(1, uid);
                    ps.executeUpdate();
                }
            } catch (Exception e) {
            }
     }
    public static void main(String[] args) {
        ContactDAO dao = new ContactDAO();
      //  System.out.println(dao.getListContact(4));
    }
}
