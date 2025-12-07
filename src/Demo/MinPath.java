package Demo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.db.utils.DbConnection;

public class MinPath {

    public boolean insert_history(String uid, String itemId) {
        Connection con = null;
        try {
            con = DbConnection.init();
            try (Statement st = con.createStatement()) {
                st.executeUpdate("CREATE TABLE IF NOT EXISTS order_history (id INT AUTO_INCREMENT PRIMARY KEY, uname VARCHAR(255) NOT NULL, item_id INT NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)");
            }
            int iid = Integer.parseInt(itemId);
            try (PreparedStatement ps = con.prepareStatement("INSERT INTO order_history(uname, item_id) VALUES (?, ?)")) {
                ps.setString(1, uid);
                ps.setInt(2, iid);
                ps.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            return false;
        } finally {
            try {
                if (con != null) con.close();
            } catch (SQLException ex) {
            }
        }
    }
}
