package model;

import java.sql.Date;

public class Customer {

    private int userID;
    private String userName;
    private String password;
    private String fullName;
    private String email;
    private String phone;
    private String role;
    private String address;
    private Date createdAt;
      private String statusGoogle;
    private String passwordStatus;
    private String banStatus;

    public Customer() {
    }

    public Customer(int userID, String userName, String password, String fullName, String email, String phone, String role, String address, Date createdAt, String statusGoogle, String passwordStatus, String banStatus) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.address = address;
        this.createdAt = createdAt;
        this.statusGoogle = statusGoogle;
        this.passwordStatus = passwordStatus;
        this.banStatus = banStatus;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getStatusGoogle() {
        return statusGoogle;
    }

    public void setStatusGoogle(String statusGoogle) {
        this.statusGoogle = statusGoogle;
    }

    public String getPasswordStatus() {
        return passwordStatus;
    }

    public void setPasswordStatus(String passwordStatus) {
        this.passwordStatus = passwordStatus;
    }

    public String getBanStatus() {
        return banStatus;
    }

    public void setBanStatus(String banStatus) {
        this.banStatus = banStatus;
    }

    @Override
    public String toString() {
        return "Customer{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", phone=" + phone + ", role=" + role + ", address=" + address + ", createdAt=" + createdAt + ", statusGoogle=" + statusGoogle + ", passwordStatus=" + passwordStatus + ", banStatus=" + banStatus + '}';
    }

}
