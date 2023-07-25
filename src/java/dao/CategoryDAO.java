/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Categorie;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;


public class CategoryDAO {

    public static List<Categorie> getCategories(String search)  {
        List<Categorie> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String SEARCH = "SELECT * FROM Categories WHERE CateName LIKE ? ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(SEARCH);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Categorie(rs.getInt(1), rs.getString(2)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return list;
    }

    public static boolean updateCategory(Categorie dto)  {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;

        String UPDATE = "UPDATE Categories SET CateName=? WHERE CateID=?";

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(UPDATE);

                stm.setString(1, dto.getCateName());
                stm.setInt(2, dto.getCateID());

                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return result;
    }

    public static boolean insertCategory(Categorie dto)  {
        boolean result = false;
        Connection conn = null;
        PreparedStatement stm = null;
        String INSERT = "insert into Categories(CateName) values(?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                stm = conn.prepareStatement(INSERT);
                stm.setString(1, dto.getCateName());
                result = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return result;
    }

}
