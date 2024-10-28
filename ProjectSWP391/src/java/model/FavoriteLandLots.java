/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Administator
 */
public class FavoriteLandLots {
    private int userID;
    private int landLotID;

    public FavoriteLandLots() {
    }

    public FavoriteLandLots(int userID, int landLotID) {
        this.userID = userID;
        this.landLotID = landLotID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getLandLotID() {
        return landLotID;
    }

    public void setLandLotID(int landLotID) {
        this.landLotID = landLotID;
    }

}
