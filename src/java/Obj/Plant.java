/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Obj;

/**
 *
 * @author User
 */
public class Plant {
    private int PID;
    private String Pname;
    private int price;
    private String imagePath;
    private String description;
    private String cate;
    private int status;

    public Plant() {
        PID = 0;
        Pname = "";
        price = 0;
        imagePath = "";
        description = "";
        cate = "";
        status = 1;
    }

    public Plant(int PID, String Pname, int price, String imagePath, String description, int status, String cate) {
        this.PID = PID;
        this.Pname = Pname;
        this.price = price;
        this.imagePath = imagePath;
        this.description = description;
        this.cate = cate;
        this.status = status;
    }

    public int getPID() {
        return PID;
    }

    public void setPID(int PID) {
        this.PID = PID;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String Pname) {
        this.Pname = Pname;
    }

    public int getPrice() {
        return price;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
