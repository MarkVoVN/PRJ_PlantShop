/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyLib.DBUtils;
import Obj.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.Set;

/**
 *
 * @author User
 */
public class OrderDAO {
    public static ArrayList<Order> getAllOrder(){
        ArrayList<Order> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders ORDER BY OrderlD DESC";
                Statement st = cn.createStatement();
                ResultSet kq = st.executeQuery(s);
                if (kq!= null){
                    while(kq.next()){
                        int OrderID = Integer.parseInt(kq.getString("OrderlD"));
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        Order o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    public static ArrayList<Order> getAllOrderFromTo(String from, String to){
        ArrayList<Order> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s;
                PreparedStatement st;
                
                if (from == "" && to != ""){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE OrdDate <= ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(1, to);
                } else if (from !="" && to == ""){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE OrdDate >= ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(1, from);
                } else if (from != "" && to != ""){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE OrdDate BETWEEN ? AND ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(1, from);
                    st.setString(2, to);
                } else {
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                }
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int OrderID = Integer.parseInt(kq.getString("OrderlD"));
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        Order o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    public static ArrayList<Order> getAllOrderFromToByAccID(String from, String to, int accID){
        ArrayList<Order> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s;
                PreparedStatement st;
                if ("".equals(from) && !"".equals(to)){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE AccID LIKE ? AND OrdDate <= ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(2, to);
                } else if (!"".equals(from) && "".equals(to)){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE AccID LIKE ? AND OrdDate >= ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(2, from);
                } else if (!"".equals(from) && !"".equals(to)){
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE AccID LIKE ? AND OrdDate BETWEEN ? AND ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                    st.setString(2, from);
                    st.setString(3, to);
                } else {
                    s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE  AccID LIKE ? ORDER BY OrderlD DESC";
                    st = cn.prepareStatement(s);
                }
                st.setInt(1, accID);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int OrderID = Integer.parseInt(kq.getString("OrderlD"));
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        Order o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    public static ArrayList<Order> getAllOrderByStatus(int status){
        ArrayList<Order> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE status LIKE ?  ORDER BY OrderlD DESC";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, status);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int OrderID = Integer.parseInt(kq.getString("OrderlD"));
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        Order o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    public static ArrayList<Order> getAccOrder(int accID){
        ArrayList<Order> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE AccID LIKE ?  ORDER BY OrderlD DESC";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, accID);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int OrderID = Integer.parseInt(kq.getString("OrderlD"));
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        Order o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                        list.add(o);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    public static Order getOrderByID(int OrderID){
        Order o = null;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT OrderlD, OrdDate, shipdate, status, AccID FROM Orders WHERE OrderlD LIKE ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, OrderID);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        Date OrderDate = kq.getDate("OrdDate");
                        Date ShipDate = kq.getDate("shipdate");
                        int Status = Integer.parseInt(kq.getString("status"));
                        int AccID = Integer.parseInt(kq.getString("AccID"));
                        o = new Order(OrderID, OrderDate, ShipDate, Status, AccID);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return o;
        
    }
    
    public static Boolean addOrder(int accID, HashMap<Integer, Integer> cart){
        Connection cn = null;
        Boolean result = true;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null){
                cn.setAutoCommit(false);
                //insert order
                String s = "INSERT INTO Orders (OrdDate, status, AccID) VALUES (?,?,?)";
                PreparedStatement pst = cn.prepareStatement(s);
                Date OrderDate = new Date(System.currentTimeMillis());
                pst.setDate(1, OrderDate);
                pst.setInt(2, 1);
                pst.setInt(3, accID);
                int kq = pst.executeUpdate();
                
                //get orderID from newly inserted order
                s = "SELECT top 1 OrderlD FROM Orders ORDER BY OrderlD DESC";
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery(s);
                int OrderID = -1;
                if (rs!= null && rs.next()){
                    OrderID = Integer.parseInt(rs.getString("OrderlD"));
                }
                
                //insert Order Details
                Set<Integer> keys = cart.keySet();
                for (Integer pid : keys) {
                    s = "INSERT INTO OrderDetails (OrderlD, PID, quantity) VALUES (?,?,?)";
                    PreparedStatement tempPst = cn.prepareStatement(s);
                    tempPst.setInt(1, OrderID);
                    tempPst.setInt(2, pid);
                    tempPst.setInt(3, cart.get(pid));
                    tempPst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);
                }
            }
        } catch (Exception e) {
            if (cn != null){
                try {
                    cn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            result = false;
            e.printStackTrace();
        } finally {
            if (cn != null){
                try {
                    cn.close();
                } catch (SQLException ex) {
                    result = false;
                    ex.printStackTrace();
                }
                
            }
        }
        
        return result;
    }
    
    public static int cancelOrder(int OrderID){
        int kq = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Orders SET status = '0' WHERE OrderlD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                Date OrderDate = new Date(System.currentTimeMillis());
                st.setInt(1, OrderID);
                kq = st.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    public static int completeOrder(int OrderID){
        int kq = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Orders SET status = '3' WHERE OrderlD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, OrderID);
                kq = st.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
    
    public static int updateShippingDateServlet(int OrderID, String date){
        int kq = -1;
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "UPDATE Orders SET shipdate = ?, status = 2 WHERE OrderlD = ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setString(1, date);
                st.setInt(2, OrderID);
                kq = st.executeUpdate();
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kq;
    }
}
