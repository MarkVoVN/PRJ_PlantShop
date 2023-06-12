/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyLib.DBUtils;
import Obj.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class OrderDetailDAO {
    public static ArrayList<OrderDetail> getOrderDetails(int OrderID){
        ArrayList<OrderDetail> list = new ArrayList();
        try {
            Connection cn = DBUtils.makeConnection();
            if (cn != null){
                String s = "SELECT Detailld, PID, quantity FROM OrderDetails WHERE OrderlD LIKE ?";
                PreparedStatement st = cn.prepareStatement(s);
                st.setInt(1, OrderID);
                ResultSet kq = st.executeQuery();
                if (kq!= null){
                    while(kq.next()){
                        int DetailID = Integer.parseInt(kq.getString("Detailld"));
                        int PID = Integer.parseInt(kq.getString("PID"));
                        int Quantity = Integer.parseInt(kq.getString("quantity"));
                        OrderDetail od = new OrderDetail(DetailID, OrderID, PID, Quantity);
                        list.add(od);
                    }
                }
                cn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
        
    }
    
    
}
