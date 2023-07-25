/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

import dao.AccountDAO;
import java.sql.SQLException;
import java.util.ArrayList;

public class TestConnection {

    public static void main(String[] args) throws SQLException, Exception {
        System.out.println("test login");
        Account acc = AccountDAO.checkLogin("1", "1");
        System.out.println(acc);
        if (acc != null) {
            if (acc.getRole() == 1) {
                System.out.println("i am an admin");
            } else {
                System.out.println("i am  a user");
            }
        } else {
            System.out.println("login fail");
        }
        System.out.println("test the first challenge===============================================");
        ArrayList<Account> list = AccountDAO.getAccounts();
        for (Account account : list) {
            System.out.println(account);
        }
        System.out.println("test the second challenge===============================================");
        if (AccountDAO.updateAccountStatus("1", 0)) {
            System.out.println("update successfull");

        } else {
            System.out.println("update fail");
        }
        System.out.println("test the third challenge===============================================");
        if (AccountDAO.updateAccount("1", "2", "asas", "123132123")) {
            System.out.println("update profiled");

        } else {
            System.out.println("update profiled fail");
        }

        System.out.println("test the fourth challenge===============================================");
        if (AccountDAO.insertAccount("7891212", "1", "aaa", "2131", 1, 0)) {
            System.out.println("insert profiled");

        } else {
            System.out.println("insert profiled fail");
        }

    }
}
