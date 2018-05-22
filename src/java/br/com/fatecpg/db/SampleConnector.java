
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class SampleConnector {
    private static final String URL = "jdbc:derby://localhost:1527/sample";
    private static final String USER = "app";
    private static final String PASS = "app";
    
    public static ArrayList<Customer> getCustomers() throws Exception{
        ArrayList<Customer> newArrayList;
        ArrayList<Customer> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM CUSTOMER");
        while(rs.next()){
            Customer c = new Customer(
                     rs.getString("CUSTOMER_ID"),
                     rs.getString("NAME"),
                     rs.getDouble("CREDIT_LIMIT")
            );
            
            list.add(c);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static ArrayList<Customer> getBestCustomers() throws Exception{
        
        ArrayList<Customer> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(""
                + "SELECT * FROM CUSTOMER WHERE CREDIT_LIMIT > 50000 "
                + "ORDER BY CREDIT_LIMIT DESC");
        while(rs.next()){
            list.add(new Customer(
                     rs.getString("CUSTOMER_ID"),
                     rs.getString("NAME"),
                     rs.getDouble("CREDIT_LIMIT")
            ));
            
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
     public static ArrayList<Manufacturer> getManufacturer() throws Exception{
       
        ArrayList<Manufacturer> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection con = DriverManager.getConnection(URL, USER, PASS);
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM MANUFACTURER");
        while(rs.next()){
            Manufacturer m = new Manufacturer(
                     rs.getString("MANUFACTURER_ID"),
                     rs.getString("NAME"),
                     rs.getString("STATE"),
                     rs.getString("CITY")
            );
            
            list.add(m);
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    
}
