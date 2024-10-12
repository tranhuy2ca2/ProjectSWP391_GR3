package DAO;

import DAL.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Customer;

public class CustomerDAO {

    private Connection con;
    PreparedStatement ps;
    ResultSet rs;
    private List<Customer> user;
    private String status = "ok";
<<<<<<< HEAD
=======
    
    public Customer getUserById(int userID) {
    String query = "SELECT * FROM [SWP391_G3_Project].[dbo].[Users] WHERE UserID = ?";
    try {
        DBContext dbContext = new DBContext();
        Connection con = dbContext.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, userID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Customer user = new Customer(
                rs.getInt("UserID"),
                rs.getString("userName"),
                rs.getString("password"),
                rs.getString("fullName"),
                rs.getString("Email"),
                rs.getString("phone"),
                String.valueOf(rs.getInt("role")),
                rs.getString("address"),
                rs.getDate("createdAt")
            );
            return user;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}

   public List<Customer> getAllUsers() {
    List<Customer> customers = new ArrayList<>();
    String query = "SELECT [UserID], [userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt] FROM [SWP391_G3_Project].[dbo].[Users]";
    try {
        // Create an instance of DBContext and get the connection
        DBContext dbContext = new DBContext();
        Connection con = dbContext.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Customer customer = new Customer();
            customer.setUserID(rs.getInt("UserID"));
            customer.setUserName(rs.getString("userName"));
            customer.setPassword(rs.getString("password"));
            customer.setFullName(rs.getString("fullName"));
            customer.setEmail(rs.getString("Email"));
            customer.setPhone(rs.getString("phone"));
            customer.setRole(rs.getString("role"));  // Assuming role is stored as an integer
            
            customer.setAddress(rs.getString("address"));
            customer.setCreatedAt(rs.getDate("createdAt"));
            customers.add(customer);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return customers;
}
   public boolean addUser(Customer customer) {
    String query = "INSERT INTO [SWP391_G3_Project].[dbo].[Users] (userName, password, fullName, Email, phone, role, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try {
        DBContext dbContext = new DBContext();
        Connection con = dbContext.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, customer.getUserName());
        ps.setString(2, customer.getPassword()); // Set the password here
        ps.setString(3, customer.getFullName());
        ps.setString(4, customer.getEmail());
        ps.setString(5, customer.getPhone());
        ps.setInt(6, Integer.parseInt(customer.getRole())); // Assuming role is stored as a string
        ps.setString(7, customer.getAddress());
        int result = ps.executeUpdate();
        return result > 0; // Return true if the insert was successful
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
public boolean updateUser(Customer customer) {
    String query = "UPDATE [SWP391_G3_Project].[dbo].[Users] SET userName = ?, fullName = ?, Email = ?, phone = ?, role = ?, address = ? " +
                   (customer.getPassword() != null && !customer.getPassword().isEmpty() ? ", password = ?" : "") + " WHERE UserID = ?";
    try {
        DBContext dbContext = new DBContext();
        Connection con = dbContext.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, customer.getUserName());
        ps.setString(2, customer.getFullName());
        ps.setString(3, customer.getEmail());
        ps.setString(4, customer.getPhone());
        ps.setInt(5, Integer.parseInt(customer.getRole()));
        ps.setString(6, customer.getAddress());

        int index = 7;  // Vị trí của tham số tiếp theo
        if (customer.getPassword() != null && !customer.getPassword().isEmpty()) {
            ps.setString(index++, customer.getPassword());
        }
        ps.setInt(index, customer.getUserID());

        int result = ps.executeUpdate();
        return result > 0; // Trả về true nếu cập nhật thành công
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}


public boolean deleteUser(int userID) {
    String query = "DELETE FROM [SWP391_G3_Project].[dbo].[Users] WHERE UserID = ?";
    try {
        DBContext dbContext = new DBContext();
        Connection con = dbContext.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, userID);
        int result = ps.executeUpdate();
        return result > 0; // Return true if the deletion was successful
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}

>>>>>>> cca4b9c09ddabc5793631385b888fd730a487ea7

    public CustomerDAO() {
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        }
    }

    public Customer login(String username, String password) {
        String sql = "select * from [Users] where [userName] = ? and [password] = ?;";
        Customer cus = null;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                cus = new Customer(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9));
            }
        } catch (Exception e) {
        }
        return cus;
    }

    public void logout() {
        user = null;
    }

    public Customer getUserDetailByUserID(int id) {
        String query = """
                       select*from [Users] u join Roles ur
                       on u.[role] = ur.RoleID
                       where u.userID = ?""";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9),
                        rs.getString(11)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Customer getUserDetailByEmail(String email) {
        String query = """
                       select*from [Users] u 
                       where u.email = ?""";
        try {
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getDate(9)
                );
            }
        } catch (Exception e) {

        }
        return null;
    }

    public boolean UpdateUser(int uID, String fullName, String email, String phone, String address) {
        String query = """
                       update [Users]
                       set [fullName] = ?,
                       [email] = ?
                       ,[phone] = ?
                       ,[address] = ?
                       where userID = ?""";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }
<<<<<<< HEAD

    public boolean signup(Customer customer) {
        String sql = "INSERT INTO [Users] ([userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, customer.getUserName());
            ps.setString(2, customer.getPassword());
            ps.setString(3, customer.getFullName());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getPhone());
            ps.setString(6, customer.getRole());
            ps.setString(7, customer.getAddress());
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

    public boolean UpdatePassword(int uID, String password) {
=======
    public boolean signup(Customer customer) {
String sql = "INSERT INTO [Users] ([userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt]) "
           + "VALUES (?, ?, ?, ?, ?, ?, ?, GETDATE())";
try {
    ps = con.prepareStatement(sql);
    ps.setString(1, customer.getUserName());
    ps.setString(2, customer.getPassword());
    ps.setString(3, customer.getFullName());
    ps.setString(4, customer.getEmail());
    ps.setString(5, customer.getPhone());
    ps.setString(6, customer.getRole());
    ps.setString(7, customer.getAddress());

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

    public boolean UpdatePassword(int uID,String password) {
>>>>>>> cca4b9c09ddabc5793631385b888fd730a487ea7
        String query = """
                       update [Users]
                       set [password] = ?
                       where userID = ?""";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, password);
            ps.setInt(2, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return true;
    }

    public Customer getUserById(int userID) {
        String query = "SELECT * FROM [SWP391_G3_Project].[dbo].[Users] WHERE UserID = ?";
        try {
            DBContext dbContext = new DBContext();
            Connection con = dbContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Customer user = new Customer(
                        rs.getInt("UserID"),
                        rs.getString("userName"),
                        rs.getString("password"),
                        rs.getString("fullName"),
                        rs.getString("Email"),
                        rs.getString("phone"),
                        String.valueOf(rs.getInt("role")),
                        rs.getString("address"),
                        rs.getDate("createdAt")
                );
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Customer> getAllUsers() {
        List<Customer> customers = new ArrayList<>();
        String query = "SELECT [UserID], [userName], [password], [fullName], [Email], [phone], [role], [address], [createdAt] FROM [SWP391_G3_Project].[dbo].[Users]";
        try {
            // Create an instance of DBContext and get the connection
            DBContext dbContext = new DBContext();
            Connection con = dbContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setUserID(rs.getInt("UserID"));
                customer.setUserName(rs.getString("userName"));
                customer.setPassword(rs.getString("password"));
                customer.setFullName(rs.getString("fullName"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("phone"));
                customer.setRole(rs.getString("role"));  // Assuming role is stored as an integer

                customer.setAddress(rs.getString("address"));
                customer.setCreatedAt(rs.getDate("createdAt"));
                customers.add(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customers;
    }

    public boolean addUser(Customer customer) {
        String query = "INSERT INTO [SWP391_G3_Project].[dbo].[Users] (userName, password, fullName, Email, phone, role, address) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            DBContext dbContext = new DBContext();
            Connection con = dbContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, customer.getUserName());
            ps.setString(2, customer.getPassword()); // Set the password here
            ps.setString(3, customer.getFullName());
            ps.setString(4, customer.getEmail());
            ps.setString(5, customer.getPhone());
            ps.setInt(6, Integer.parseInt(customer.getRole())); // Assuming role is stored as a string
            ps.setString(7, customer.getAddress());
            int result = ps.executeUpdate();
            return result > 0; // Return true if the insert was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUser(Customer customer) {
        String query = "UPDATE [SWP391_G3_Project].[dbo].[Users] SET userName = ?, fullName = ?, Email = ?, phone = ?, role = ?, address = ? "
                + (customer.getPassword() != null && !customer.getPassword().isEmpty() ? ", password = ?" : "") + " WHERE UserID = ?";
        try {
            DBContext dbContext = new DBContext();
            Connection con = dbContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, customer.getUserName());
            ps.setString(2, customer.getFullName());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getPhone());
            ps.setInt(5, Integer.parseInt(customer.getRole()));
            ps.setString(6, customer.getAddress());

            int index = 7;  // Vị trí của tham số tiếp theo
            if (customer.getPassword() != null && !customer.getPassword().isEmpty()) {
                ps.setString(index++, customer.getPassword());
            }
            ps.setInt(index, customer.getUserID());

            int result = ps.executeUpdate();
            return result > 0; // Trả về true nếu cập nhật thành công
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteUser(int userID) {
        String query = "DELETE FROM [SWP391_G3_Project].[dbo].[Users] WHERE UserID = ?";
        try {
            DBContext dbContext = new DBContext();
            Connection con = dbContext.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userID);
            int result = ps.executeUpdate();
            return result > 0; // Return true if the deletion was successful
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void main(String[] args) {
        CustomerDAO dao = new CustomerDAO();
        System.out.println(dao.getUserDetailByUserID(2));
    }
}
