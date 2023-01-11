package DatabaseConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Connect {

    public static Connection con=null;
    public static Statement st=null;
    public Connect(){
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "system";
        String pass = "root";
        try {
            DriverManager.registerDriver(
                    new oracle.jdbc.OracleDriver());
            con = DriverManager.getConnection(url, user,
                    pass);
            st= con.createStatement();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

}
