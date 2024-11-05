package model;

import java.sql.Date;

public class Contact {
    private int contactID;
    private int userID;
    private String userName;
    private String email;
    private String subject;
    private String detail;
    private Date createAt;
    private String response;
    private int status;
    public Contact() {
    }

    public Contact(int contactID, int userID, String userName, String email, String subject, String detail, Date createAt,String response ,int status) {
        this.contactID = contactID;
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.subject = subject;
        this.detail = detail;
        this.createAt = createAt;
        this.status = status;
        this.response = response;
    }

    public int getContactID() {
        return contactID;
    }

    public void setContactID(int contactID) {
        this.contactID = contactID;
    }

    public int getUserID() {
        return userID;
    }

    public int getStatus() {
        return status;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public void setStatus(int status) {
        this.status = status;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @Override
    public String toString() {
        return "Contact{" + "contactID=" + contactID + ", userID=" + userID + ", userName=" + userName + ", "
                + "email=" + email + ", subject=" + subject + ", detail=" + detail + ", createAt=" + createAt + '}';
    }
    
}
