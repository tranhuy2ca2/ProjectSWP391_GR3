/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

public class LandLotImage {
    private int imageID;
    private int landlotID;
    private String imageURL;
    private Date uploadDate;

    public LandLotImage() {
    }

    public LandLotImage(int imageID, int landlotID, String imageURL, Date uploadDate) {
        this.imageID = imageID;
        this.landlotID = landlotID;
        this.imageURL = imageURL;
        this.uploadDate = uploadDate;
    }

    public int getImageID() {
        return imageID;
    }

    public void setImageID(int imageID) {
        this.imageID = imageID;
    }

    public int getLandlotID() {
        return landlotID;
    }

    public void setLandlotID(int landlotID) {
        this.landlotID = landlotID;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    @Override
    public String toString() {
        return "LandLotImage{" + "imageID=" + imageID + ", landlotID=" + landlotID + ", "
                + "imageURL=" + imageURL + ", uploadDate=" + uploadDate + '}';
    }
    
}
