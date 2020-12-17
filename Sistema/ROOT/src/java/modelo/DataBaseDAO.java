package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import static java.time.Clock.system;

public class DataBaseDAO {

    Connection conn;

    public void conectar() throws Exception {
        String url = "jdbc:mysql://localhost/protecline";
        String user = "root";
        String pass = "";
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, pass);
    }

    public void desconectar() throws Exception {
        try {
            if (!conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            System.err.println("Erro:" + e);
        }
    }

}
