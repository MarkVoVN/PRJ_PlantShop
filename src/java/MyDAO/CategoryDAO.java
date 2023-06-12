/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyLib.DBUtils;
import Obj.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class CategoryDAO {
    public static ArrayList<Category> getAllCategory(){
        ArrayList<Category> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT CatelD, CateName FROM Categories";
                Statement st = cn.createStatement();
                ResultSet kq = st.executeQuery(s);
                if (kq!= null){
                    while(kq.next()){
                        int CateID = Integer.parseInt(kq.getString("CatelD"));
                        String CateName = kq.getString("CateName");
                        Category c = new Category(CateID, CateName);
                        list.add(c);
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
    
    public static int addCategory(String name){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "INSERT INTO Categories (CateName) VALUES (?)";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, name);
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
    
    public static int updateCategory(int id, String name){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Categories SET CateName = ? WHERE CatelD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, name);
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
    
        public static int removeCategory(int id){
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "DELETE FROM Categories WHERE CatelD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, id);
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
        
    public static int getCateIDByName(String name){
        int id = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT CatelD FROM Categories WHERE CateName = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, name);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        id= Integer.parseInt(kq.getString("CatelD"));
                    }
                }
                cn.close();
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public static int getNumOfPlantOfACategoryByID(int id){
        int num = 0;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT COUNT(p.PID) AS NumOfPlants FROM Categories c LEFT JOIN Plants p ON c.CatelD = p.CatelD WHERE c.CatelD = ? GROUP BY c.CatelD, CateName";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, id);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        num= Integer.parseInt(kq.getString("NumOfPlants"));
                    }
                }
                cn.close();
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return num;
    }

}
