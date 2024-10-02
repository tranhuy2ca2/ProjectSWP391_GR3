package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import model.Customer;

public class CustomerDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";

    public CustomerDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

   public Customer login(String username, String password) {
    String sql = "SELECT * FROM [Users] WHERE [userName] = ? AND [password] = ?;";
    Customer cus = null;
    try {
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        while (rs.next()) {
            cus = new Customer(rs.getInt(1),   // userID
                               rs.getString(2), // userName
                               rs.getString(3), // password
                               rs.getString(4), // fullName
                               rs.getString(5), // email
                               rs.getString(6), // phone
                               rs.getString(7), // role
                               rs.getString(8), // address
                               rs.getDate(9),   // createdAt
                               rs.getString(10), // statusGoogle
                               rs.getString(11), // passwordStatus
                               rs.getString(12)); // banStatus
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return cus;
}

public boolean signup(Customer customer) {
String sql = "INSERT INTO [Users] ([userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt], [GoogleStatus], [passwordStatus], [banStatus]) "
           + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE(), ?, ?, ?)";
try {
    ps = con.prepareStatement(sql);
    ps.setString(1, customer.getUserName());
    ps.setString(2, customer.getPassword());
    ps.setString(3, customer.getFullName());
    ps.setString(4, customer.getEmail());
    ps.setString(5, customer.getPhone());
    ps.setString(6, customer.getRole());
    ps.setString(7, customer.getAddress());
    ps.setString(8, customer.getStatusGoogle()); // Truyền giá trị statusGoogle
    ps.setString(9, customer.getPasswordStatus()); // Truyền giá trị passwordStatus
    ps.setString(10, customer.getBanStatus()); // Truyền giá trị banStatus
    ps.executeUpdate();
    return true;
} catch (Exception e) {
    e.printStackTrace();
    System.out.println("Lỗi trong quá trình đăng ký: " + e.getMessage());
}
return false;

}




public boolean checkCustomerExist(String email) {
    String sql = "SELECT * FROM [Users] WHERE [Email] = ?";
    try {
        ps = con.prepareStatement(sql);
        ps.setString(1, email);
        rs = ps.executeQuery();
        return rs.next(); // returns true if a user exists with this email
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

    public void logout() {
        user = null;
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        if(dao.login("admin","123") != null){
           System.out.println("Success"); 
        }else{
            System.out.println("Fail"); 
        }
    }
}
