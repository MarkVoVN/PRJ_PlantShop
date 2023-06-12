/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyLib.DBUtils;
import Obj.Plant;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class PlantDAO {
    
    
    public static ArrayList<Plant> getAllPlant(){
        ArrayList<Plant> list = new ArrayList();
        
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT PID, PName, price, imgPath, description, status, CateName FROM Plants p JOIN Categories c ON p.CatelD = c.CatelD";
                Statement st = cn.createStatement();
                ResultSet kq = st.executeQuery(s);
                if (kq!= null){
                    while(kq.next()){
                        int pid = Integer.parseInt(kq.getString("PID"));
                        String pname = kq.getString("PName");
                        int price = Integer.parseInt(kq.getString("price"));
                        String imgPath = kq.getString("imgPath");
                        String desciption = kq.getString("description");
                        int status =Integer.parseInt(kq.getString("status"));
                        String cate =kq.getString("CateName");
                        Plant p = new Plant(pid, pname, price, imgPath, desciption, status, cate);
                        list.add(p);
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
    
    public static ArrayList<Plant> searchPlantByName(String name){
        ArrayList<Plant> list = new ArrayList();
        
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT PID, PName, price, imgPath, description, status, CateName FROM Plants p JOIN Categories c ON p.CatelD = c.CatelD WHERE PName LIKE ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, "%" + name + "%");
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int pid = Integer.parseInt(kq.getString("PID"));
                        String pname = kq.getString("PName");
                        int price = Integer.parseInt(kq.getString("price"));
                        String imgPath = kq.getString("imgPath");
                        String desciption = kq.getString("description");
                        int status =Integer.parseInt(kq.getString("status"));
                        String cate =kq.getString("CateName");
                        Plant p = new Plant(pid, pname, price, imgPath, desciption, status, cate);
                        list.add(p);
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
    
    public static ArrayList<Plant> searchPlantByCategory(String name){
        ArrayList<Plant> list = new ArrayList();
        
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT PID, PName, price, imgPath, description, status, CateName FROM Plants p JOIN Categories c ON p.CatelD = c.CatelD WHERE CateName LIKE ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, "%" + name + "%");
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int pid = Integer.parseInt(kq.getString("PID"));
                        String pname = kq.getString("PName");
                        int price = Integer.parseInt(kq.getString("price"));
                        String imgPath = kq.getString("imgPath");
                        String desciption = kq.getString("description");
                        int status =Integer.parseInt(kq.getString("status"));
                        String cate =kq.getString("CateName");
                        Plant p = new Plant(pid, pname, price, imgPath, desciption, status, cate);
                        list.add(p);
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
    
    public static Plant searchPlantByID(int id){
        try {
            Connection cn = DBUtils.makeConnection();
            Plant p = null;
            if (cn != null){
                String s = "SELECT PID, PName, price, imgPath, description, status, CateName FROM Plants p JOIN Categories c ON p.CatelD = c.CatelD WHERE PID LIKE ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, id);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int pid = Integer.parseInt(kq.getString("PID"));
                        String pname = kq.getString("PName");
                        int price = Integer.parseInt(kq.getString("price"));
                        String imgPath = kq.getString("imgPath");
                        String desciption = kq.getString("description");
                        int status =Integer.parseInt(kq.getString("status"));
                        String cate =kq.getString("CateName");
                        p = new Plant(pid, pname, price, imgPath, desciption, status, cate);
                        
                    }
                }
                cn.close();
            }
            return p;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public static int updatePlant(int pid, String name, int price, String imagePath, String des, int status, int cateID){
        int kq = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Plants SET PName = ?, price = ?, imgPath = ?, description = ?, status = ?, CatelD = ?  WHERE PID = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, name);
                st.setInt(2, price);
                st.setString(3, imagePath);
                st.setString(4, des);
                st.setInt(5, status);
                st.setInt(6, cateID);
                st.setInt(7, pid);
                kq = st.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static int createPlant(String name, int price, String imagePath, String des, int status, int cateID){
        int kq = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "INSERT INTO Plants (PName, price, imgPath,  description, status, CatelD) VALUES (?,?,?,?,?,?);";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, name);
                st.setInt(2, price);
                st.setString(3, imagePath);
                st.setString(4, des);
                st.setInt(5, status);
                st.setInt(6, cateID);
                kq = st.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
}
