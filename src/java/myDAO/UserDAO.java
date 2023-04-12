/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myDAO;

import myLib.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import myObj.User;

/**
 *
 * @author CCLaptop
 */
public class UserDAO {
    
    public static User getUser(String ac, String ps) throws Exception {
        User kq = null;
        Connection cn = myLib.DBUtils.makeConnection();
        if (cn != null) {
            String s = "Select accID, email, password, fullname, phone, status, role\n"
                    + "From Accounts\n"
                    + "Where email = ? AND password = ? Collate Latin1_General_CS_AI";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, ac);
            pst.setString(2, ps);
            ResultSet table = pst.executeQuery();
            if (table != null) {
                while (table.next()) {
                    int id = table.getInt("accID");
                    String email = table.getString("email");
                    String password = table.getString("password");
                    String fullname = table.getString("fullname");
                    String phone = table.getString("phone");
                    int status = table.getInt("status");
                    int role = table.getInt("role");
                    kq = new User(id, email, password, fullname, phone, status, role);
                }
            }
            cn.close();
        }
        return kq;
    }


    public User checkSignUp(String us) throws Exception {
        User kq = null;
        Connection cn = DBUtils.makeConnection();
        String s = "select *\n"
                + "from tblUsers\n"
                + "where userID=?";
        PreparedStatement pst = cn.prepareStatement(s);
        pst.setString(1, us);
        ResultSet table = pst.executeQuery();
        while (table != null) {
            while (table.next()) {
                String id = table.getString("userID");
                String name = table.getString("fullName");
                String role = table.getString("roleID");
                String password = table.getString("password");
                //kq = new User(id, password, role, name, role, us);
                return kq;
            }
        }
        cn.close();
        return null;
    }

    public int insertUser(String name, int role, String pass, String email, String phone, int status) throws Exception {
        int kq = 0;
        Connection cn = myLib.DBUtils.makeConnection();
        try {
            if (cn != null) {
                String s = "INSERT INTO Accounts(email,password,fullname,phone,status,role) VALUES (?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, email);
                pst.setString(2, pass);
                pst.setString(3, name);
                pst.setString(4, phone);
                pst.setInt(5, status);
                pst.setInt(6, role);
                kq = pst.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
        }
        return kq;
    }

}
