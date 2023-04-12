package myLib;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author CCLaptop
 */
public class Tester {

    public static void main(String[] args) {
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null) {
                String s = "SELECT TOP (1000) [accID]\n"
                        + "      ,[email]\n"
                        + "      ,[password]\n"
                        + "      ,[fullname]\n"
                        + "      ,[phone]\n"
                        + "      ,[status]\n"
                        + "      ,[role]\n"
                        + "  FROM [PlantShop].[dbo].[Accounts]";
                Statement st = cn.createStatement();
                ResultSet kq = st.executeQuery(s);
                if (kq != null) {
                    while (kq.next()) {
                        String a = kq.getString("accID");
                        String b = kq.getString("fullName");
                        String c = kq.getString("role");
                        String d = kq.getString("password");
                        String e = kq.getString("email");
                        String p = kq.getString("phone");
                        String f = kq.getString("status");
                        System.out.println(a + "," + e + "," + d + "," + b + "," + p + "," + f + "," + c);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
