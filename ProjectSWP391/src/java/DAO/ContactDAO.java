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
    public void SendContact(int UserID ,String username, String email, String subject, String detail) {
        String sql = """
                     Insert into Contact (UserID, UserSend , Email , [Subject], Detail, CreateAt)
                     Values (?,?,?,?,?,GetDate())""";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, UserID);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, subject);
            ps.setString(5, detail);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
    
    public void SendContact1(String username, String email, String subject, String detail) {
        String sql = """
                     Insert into Contact (UserSend , Email , [Subject], Detail, CreateAt)
                     Values (?,?,?,?,GetDate())""";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, subject);
            ps.setString(4, detail);
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
                        rs.getDate(7)
                ));
            }
        } catch (Exception e) {
        }
        return contact;
    }
    public static void main(String[] args) {
        ContactDAO dao = new ContactDAO();
        System.out.println(dao.getContactByUserID(2));
    }
}
