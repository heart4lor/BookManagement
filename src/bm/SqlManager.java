package bm;

import java.sql.*;

public class SqlManager {
    private Connection conn = null;

    public SqlManager() {
        try {
            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            Class.forName(JDBC_DRIVER);
            String DB_URL = "jdbc:mysql://localhost:3306/bm?characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
            String USER = "root";
            String PASS = "123456";
            this.conn = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet executeQuery(String sql, String[] args) {
        try {
            PreparedStatement pstm = conn.prepareStatement(sql);
            for(int i=0; i < args.length; i++) {
                System.out.println(args[i]);
                pstm.setString(i + 1, args[i]);
            }
            System.out.println(pstm.toString());
            return pstm.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public ResultSet executeQuery(String sql) {
        try {
            Statement stm = conn.createStatement();
            System.out.println(sql);
            return stm.executeQuery(sql);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public int executeUpdate(String sql, String[] args) {
        try {
            PreparedStatement pstm = conn.prepareStatement(sql);
            for(int i=0; i < args.length; i++)
                pstm.setString(i+1, args[i]);
            System.out.println(pstm.toString());
            return pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }
}
