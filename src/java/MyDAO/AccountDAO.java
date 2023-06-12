/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyLib.DBUtils;
import Obj.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author User
 */
public class AccountDAO {
    public static ArrayList<Account> getAllAccount(){
        ArrayList<Account> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT acciD, email, password, fullname, phone, status, role, token FROM Accounts";
                Statement st = cn.createStatement();
                ResultSet kq = st.executeQuery(s);
                if (kq!= null){
                    while(kq.next()){
                        int accID = Integer.parseInt(kq.getString("accID"));
                        String email = kq.getString("email");
                        String password = kq.getString("password");
                        String fullname = kq.getString("fullname");
                        String phone = kq.getString("phone");
                        int status = Integer.parseInt(kq.getString("status"));
                        int role = Integer.parseInt(kq.getString("role"));
                        String token = kq.getString("token");
                        Account acc = new Account(accID, email, password, fullname, phone, status, role, token);
                        list.add(acc);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        return list;
    }
    
    public static Account getAccount(String email, String pwd) throws Exception {
        Connection cn = MyLib.DBUtils.makeConnection();
        if (cn!= null){
            String s = " SELECT acciD, email, password, fullname, phone, status, role, token FROM Accounts WHERE email = ? AND password = ? COLLATE Latin1_General_CS_AI";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, email);
            pst.setString(2, pwd);
            ResultSet kq = pst.executeQuery();
            if (kq != null){
                while (kq.next()){
                    int accID = Integer.parseInt(kq.getString("accID"));
                    String fullname = kq.getString("fullname");
                    String phone = kq.getString("phone");
                    int status = Integer.parseInt(kq.getString("status"));
                    int role = Integer.parseInt(kq.getString("role"));
                    String token = kq.getString("token");
                    Account acc = new Account(accID, email, pwd, fullname, phone, status, role, token);
                    cn.close();
                    return acc;
                }
            }
        }
        
        return null;
    }
    public static Account getAccountByID(int id) throws Exception {
        Connection cn = MyLib.DBUtils.makeConnection();
        if (cn!= null){
            String s = " SELECT acciD, email, password, fullname, phone, status, role, token FROM Accounts WHERE acciD = ?";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setInt(1, id);
            ResultSet kq = pst.executeQuery();
            if (kq != null){
                while (kq.next()){
                    int accID = Integer.parseInt(kq.getString("accID"));
                    String email = kq.getString("email");
                    String fullname = kq.getString("fullname");
                    String phone = kq.getString("phone");
                    int status = Integer.parseInt(kq.getString("status"));
                    int role = Integer.parseInt(kq.getString("role"));
                    String token = kq.getString("token");
                    Account acc = new Account(accID, email, "", fullname, phone, status, role, token);
                    cn.close();
                    return acc;
                }
            }
        }
        
        return null;
    }
    
    public static String registerMemberAccount(String email, String fullname, String phone, String password){
        Connection cn;
        String message = "";
        try {
            cn = MyLib.DBUtils.makeConnection();
        Boolean available = true;
        if (cn!= null){
            String s = "SELECT email FROM Accounts WHERE email = ? COLLATE Latin1_General_CS_AI";
            PreparedStatement pst1 = cn.prepareStatement(s);
            pst1.setString(1, email);
            ResultSet kq1 = pst1.executeQuery();
            if (kq1 != null && kq1.next()){
                message += "Email already used. ";
                available = false;
            }
            
            s = "SELECT email FROM Accounts WHERE phone = ? COLLATE Latin1_General_CS_AI";
            PreparedStatement pst2 = cn.prepareStatement(s);
            pst2.setString(1, phone);
            ResultSet kq2 = pst2.executeQuery();
            if (kq2 != null && kq2.next()){
                message += "Phone already used. ";
                available = false;
            }
            
            if (available){
                s = "INSERT INTO Accounts (email, password, fullname, phone, status, role) VALUES (?, ?, ?, ?, '1', '0')";
                PreparedStatement pst3 = cn.prepareCall(s);
                pst3.setString(1, email);
                pst3.setString(2, password);
                pst3.setString(3, fullname);
                pst3.setString(4, phone);
                int rs = pst3.executeUpdate();
                System.out.println("ACCOUNT CREATED: rs is " + rs);
                message += "Account Created Successfully";
                
            }
            
        }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        
        return message;
    }
    
    public static Account getAccount(String token) {
        Connection cn;
        try {
            cn = MyLib.DBUtils.makeConnection();
        if (cn!= null){
            String s = "SELECT acciD, email, password, fullname, phone, status, role, token FROM Accounts WHERE token = ? COLLATE Latin1_General_CS_AI";
            PreparedStatement pst = cn.prepareStatement(s);
            pst.setString(1, token);
            ResultSet kq = pst.executeQuery();
            if (kq != null){
                while (kq.next()){
                        int accID = Integer.parseInt(kq.getString("accID"));
                        String email = kq.getString("email");
                        String password = kq.getString("password");
                        String fullname = kq.getString("fullname");
                        String phone = kq.getString("phone");
                        int status = Integer.parseInt(kq.getString("status"));
                        int role = Integer.parseInt(kq.getString("role"));
                    Account acc = new Account(accID, email, password, fullname, phone, status, role, token);
                    cn.close();
                    return acc;
                }
            }
        }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    public static int setAccountToken(int id, String token){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Accounts SET token = ? WHERE acciD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, token);
                st.setInt(2, id);
                int kq = st.executeUpdate();
                cn.close();
                return kq;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }
    
    
            
    public static int setAccountStatus(int accID, int status){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Accounts SET status = ? WHERE acciD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, status);
                st.setInt(2, accID);
                int kq = st.executeUpdate();
                cn.close();
                return kq;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }
    
    public static int updateAccount(String email, String fullname, String phone, int accID){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Accounts SET email = ?, fullname = ?, phone = ? WHERE acciD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, email);
                st.setString(2, fullname);
                st.setString(3, phone);
                st.setInt(4, accID);
                int kq = st.executeUpdate();
                cn.close();
                return kq;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
        return 1;
    }
}
