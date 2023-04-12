/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import myLib.DBUtils;
import myObj.Plant;

/**
 *
 * @author CCLaptop
 */
public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null && searchby != null) {
                String sql = "select PID,PName,imgPath,description,status,Plants.cateID as 'CateID',CateName\n"
                        + "from Plants join Categories on Plants.CateID=Categories.CateID\n";
                if (searchby.equalsIgnoreCase("byname")) {
                    sql=sql + "Where Plants.PName like ?";
                } else {
                    sql=sql+"Where CateName like ?";
                }
                PreparedStatement pst= cn.prepareStatement(sql);
                pst.setString(1, "%"+keyword+"%");
                ResultSet rs = pst.executeQuery();
                if (rs!=null) {
                    while (rs.next()) {                        
                        int id=rs.getInt("PID");
                        String name = rs.getString("PName");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        String catename = rs.getString("CateName");
                        int price = rs.getInt("price");
                        int status = rs.getInt("status");
                        int cateID = rs.getInt("CateID");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateID, catename);
                        list.add(plant);
                    }   
                }
            }
        } catch (Exception e) {

        }
        return list;
    }
}
