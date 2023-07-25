/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import java.io.Serializable;


public class Plant implements Serializable {

    private int id;
    private String name;
    private int price;
    private String imgPath;
    private String description;
    private int status;
    private int cateid;
    private String catename;
    private int quantity;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Plant() {
    }

    public Plant(int id, String name, int price, String imgPath, String description, int status, int cateid, String catename, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgPath = imgPath;
        this.description = description;
        this.status = status;
        this.cateid = cateid;
        this.catename = catename;
        this.quantity = quantity;
    }

    public Plant(int id, String name, int price, String path, String descrip, int status, int cate_id, String cate_name) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.imgPath = path;
        this.description = descrip;
        this.status = status;
        this.cateid = cate_id;
        this.catename = cate_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
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

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

}
