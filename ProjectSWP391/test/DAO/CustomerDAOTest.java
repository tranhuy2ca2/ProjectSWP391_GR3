/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit5TestClass.java to edit this template
 */
package DAO;

import java.util.List;
import model.Customer;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author FPTSHOP
 */
public class CustomerDAOTest {

    private CustomerDAO customerDAO = new CustomerDAO();
    private Customer testCustomer;

    public CustomerDAOTest() {
    }

    @BeforeAll
    public static void setUpClass() {
    }

    @AfterAll
    public static void tearDownClass() {
    }

    @BeforeEach
    public void setUp() {
        customerDAO = new CustomerDAO();
        testCustomer = new Customer();
        testCustomer.setUserName("testUser");
        testCustomer.setPassword("Test@123");
        testCustomer.setEmail("test@example.com");
        testCustomer.setPhone("0123456789");
        testCustomer.setAddress("Test Address");
    }

    @AfterEach
    public void tearDown() {
        customerDAO = null;
        testCustomer = null;
    }

    /**
     * Test of deleteUser method, of class CustomerDAO.
     */
    @Test
    public void testSignup() {
        System.out.println("signup");
        Customer customer = null;
        CustomerDAO instance = new CustomerDAO();
        boolean expResult = false;
        boolean result = instance.signup(customer);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    @Test
    public void testSignupWithValidUserName() {
        System.out.println("signup");
        Customer customer = new Customer();
        customer.setAddress("ABC");
        customer.setEmail("abc@gmail.com");
        customer.setFullName("Nguyen A");
        customer.setPhone("0123456789");
        customer.setPassword("Abc-1234");
        customer.setUserName("ABCXYZ");
        CustomerDAO instance = new CustomerDAO();
        String result = instance.signup(customer);
        assertEquals("Registration successful", result);
        
        // TODO review the generated test code and remove the default call to fail.
    }
    /**
     * Test of checkUsernameExist method, of class CustomerDAO.
     */
    @Test
    public void testCheckUsernameExist() {
        System.out.println("checkUsernameExist");
        String username = "";
        CustomerDAO instance = new CustomerDAO();
        boolean expResult = false;
        boolean result = instance.checkUsernameExist(username);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of checkCustomerExist method, of class CustomerDAO.
     */
    @Test
    public void testCheckCustomerExist() {
        System.out.println("checkCustomerExist");
        String email = "";
        CustomerDAO instance = new CustomerDAO();
        boolean expResult = false;
        boolean result = instance.checkCustomerExist(email);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of UpdatePassword method, of class CustomerDAO.
     */
    @Test
    public void testUpdatePassword() {
        System.out.println("UpdatePassword");
        int uID = 0;
        String password = "";
        CustomerDAO instance = new CustomerDAO();
        boolean expResult = false;
        boolean result = instance.UpdatePassword(uID, password);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getAccountByID method, of class CustomerDAO.
     */
    @Test
    public void testGetAccountByID() {
        System.out.println("getAccountByID");
        int id = 0;
        CustomerDAO instance = new CustomerDAO();
        Customer expResult = null;
        Customer result = instance.getAccountByID(id);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ChangePassword method, of class CustomerDAO.
     */
    @Test
    public void testChangePassword() {
        System.out.println("ChangePassword");
        int user_id = 0;
        String user_pass = "";
        CustomerDAO instance = new CustomerDAO();
        boolean expResult = false;
        boolean result = instance.ChangePassword(user_id, user_pass);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of main method, of class CustomerDAO.
     */
    @Test
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        CustomerDAO.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

}
