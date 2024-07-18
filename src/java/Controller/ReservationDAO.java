package Controller;

import DB.DBConnection;
import java.sql.Connection;
import Model.ReservationBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    static Connection conn;
    static PreparedStatement ps;
    static ResultSet rs;
    static String sql;
    
     public static int countUnconfirmedRecords() {
        int count = 0;
        try {
            conn = new DBConnection().setConnection(); // Assuming this method returns a valid Connection object
            ps = conn.prepareStatement("SELECT COUNT(*) FROM tbl_reservation WHERE status='unconfirmed'");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return count;
    }
     
     public static int countConfirmedRecords() {
        int count = 0;
        try {
            conn = new DBConnection().setConnection(); // Assuming this method returns a valid Connection object
            ps = conn.prepareStatement("SELECT COUNT(*) FROM tbl_reservation WHERE status='confirmed'");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return count;
    }
     
     public static int countCompletedRecords() {
        int count = 0;
        try {
            conn = new DBConnection().setConnection(); // Assuming this method returns a valid Connection object
            ps = conn.prepareStatement("SELECT COUNT(*) FROM tbl_reservation WHERE status='completed'");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return count;
    }
     
     public static int countReservationsRecords() {
        int count = 0;
        try {
            conn = new DBConnection().setConnection(); // Assuming this method returns a valid Connection object
            ps = conn.prepareStatement("SELECT COUNT(*) FROM tbl_reservation");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return count;
    }
     
     public static int countPrice() {
        int count = 0;
        try {
            conn = new DBConnection().setConnection(); // Assuming this method returns a valid Connection object
            ps = conn.prepareStatement("SELECT SUM(price) FROM tbl_reservation");
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                System.out.println(e);
            }
        }
        return count;
    }

    public static int save(ReservationBean rb) {
        int status = 0;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("insert into db_event.tbl_reservation(name,email,phone,location,date,service,message,status) values(?,?,?,?,?,?,?,?)");
            ps.setString(1, rb.getName());
            ps.setString(2, rb.getEmail());
            ps.setString(3, rb.getPhone());
            ps.setString(4, rb.getLocation());
            ps.setString(5, rb.getDate());
            ps.setString(6, rb.getService());
            ps.setString(7, rb.getMessage());
            ps.setString(8, rb.getStatus());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int updateUnconfirmed(ReservationBean rb) throws ClassNotFoundException {
        int status = 0;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("update db_event.tbl_reservation set name=?,email=?,phone=?,location=?,date=?,service=?,message=?,status=?,price=? where id_reservation=?");
            ps.setString(1, rb.getName());
            ps.setString(2, rb.getEmail());
            ps.setString(3, rb.getPhone());
            ps.setString(4, rb.getLocation());
            ps.setString(5, rb.getDate());
            ps.setString(6, rb.getService());
            ps.setString(7, rb.getMessage());
            ps.setString(8, rb.getStatus());
            ps.setDouble(9, rb.getPrice());
            ps.setInt(10, rb.getId_reservation());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
    
    public static int updateToCompleted(ReservationBean rb) throws ClassNotFoundException {
        int status = 0;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("update db_event.tbl_reservation set status=? where id_reservation=?");
            ps.setString(1, rb.getStatus());
            ps.setInt(2, rb.getId_reservation());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public static int deleteUnconfirmed(ReservationBean rb) {
        int status = 0;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("delete from db_event.tbl_reservation where id_reservation=?");
            ps.setInt(1, rb.getId_reservation());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

        return status;
    }

    public static List<ReservationBean> getAllRecords() {
        List<ReservationBean> list = new ArrayList<>();

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_reservation");
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                ReservationBean u = new ReservationBean();
                u.setId_reservation(rsu.getInt("id_reservation"));
                u.setName(rsu.getString("name"));
                u.setEmail(rsu.getString("email"));
                u.setPhone(rsu.getString("phone"));
                u.setLocation(rsu.getString("location"));
                u.setDate(rsu.getString("date"));
                u.setService(rsu.getString("service"));
                u.setMessage(rsu.getString("message"));
                u.setStatus(rsu.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static List<ReservationBean> getUnconfirmedRecords() {
        List<ReservationBean> list = new ArrayList<>();

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_reservation where status='unconfirmed'");
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                ReservationBean u = new ReservationBean();
                u.setId_reservation(rsu.getInt("id_reservation"));
                u.setName(rsu.getString("name"));
                u.setEmail(rsu.getString("email"));
                u.setPhone(rsu.getString("phone"));
                u.setLocation(rsu.getString("location"));
                u.setDate(rsu.getString("date"));
                u.setService(rsu.getString("service"));
                u.setMessage(rsu.getString("message"));
                u.setStatus(rsu.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static List<ReservationBean> getConfirmedRecords() {
        List<ReservationBean> list = new ArrayList<>();

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_reservation where status='confirmed'");
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                ReservationBean u = new ReservationBean();
                u.setId_reservation(rsu.getInt("id_reservation"));
                u.setName(rsu.getString("name"));
                u.setEmail(rsu.getString("email"));
                u.setPhone(rsu.getString("phone"));
                u.setLocation(rsu.getString("location"));
                u.setDate(rsu.getString("date"));
                u.setService(rsu.getString("service"));
                u.setMessage(rsu.getString("message"));
                u.setStatus(rsu.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static List<ReservationBean> getCompletedRecords() {
        List<ReservationBean> list = new ArrayList<>();

        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_reservation where status='completed'");
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                ReservationBean u = new ReservationBean();
                u.setId_reservation(rsu.getInt("id_reservation"));
                u.setName(rsu.getString("name"));
                u.setEmail(rsu.getString("email"));
                u.setPhone(rsu.getString("phone"));
                u.setLocation(rsu.getString("location"));
                u.setDate(rsu.getString("date"));
                u.setService(rsu.getString("service"));
                u.setMessage(rsu.getString("message"));
                u.setStatus(rsu.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static ReservationBean getRecordById(int id_reservation) {
        ReservationBean u = null;
        try {
            conn = new DBConnection().setConnection();
            ps = conn.prepareStatement("select * from tbl_reservation where id_reservation=?");
            ps.setInt(1, id_reservation);
            ResultSet rsu;
            rsu = ps.executeQuery();
            while (rsu.next()) {
                u = new ReservationBean();
                u.setId_reservation(rsu.getInt("id_reservation"));
                u.setName(rsu.getString("name"));
                u.setEmail(rsu.getString("email"));
                u.setPhone(rsu.getString("phone"));
                u.setLocation(rsu.getString("location"));
                u.setDate(rsu.getString("date"));
                u.setService(rsu.getString("service"));
                u.setMessage(rsu.getString("message"));
                u.setStatus(rsu.getString("status"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return u;
    }
}
