package DBA;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Antena;
import modelos.Quickpass;
import modelos.Tarifas;
import modelos.Usuario;
import oracle.jdbc.OracleTypes;

public class DBConnection {

    public Connection crearConexion() throws SQLException {
        String DB_URL = "jdbc:oracle:thin:@localhost:1521:orcl";
        String USER = "desa01";
        String PASS = "desa01";
        Connection conn = null;
        // Creating Connection
        try {
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            if (conn != null) {
                System.out.println("Connected to the Oracle DB!");
            } else {
                System.out.println("Failed to make connection!");
            }

        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }

    public ArrayList<Usuario> getUsuarios() {

        ArrayList<Usuario> respuesta = new ArrayList<>();
        try {
            Connection conn = crearConexion();
            Statement stmt = conn.createStatement();
            String Consulta = "select idUsuario,nombre from tablas_banco.usuario";
            ResultSet rs = stmt.executeQuery(Consulta);
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                int idUsuario = rs.getInt("idUsuario");

                respuesta.add(new Usuario(idUsuario, nombre));
            }

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return respuesta;
    }

    public ArrayList<Quickpass> getQuickpass(int idUsuario) {

        ArrayList<Quickpass> respuesta = new ArrayList<>();
        try {
            Connection conn = crearConexion();

            String Consulta = "select distinct q.idquickpass,cl.nombrebanco,q.activo from tablas_quickpass.quickpass q\n"
                    + "join tablas_banco.cliente cl on q.idcliente = cl.idcliente\n"
                    + "join tablas_banco.cuentasporquickpass cpq on q.idquickpass = cpq.idquickpass\n"
                    + "join tablas_banco.cuenta c on cpq.idcuenta = c.idcuenta\n"
                    + "where c.idusuario = ?";
            PreparedStatement stmt = conn.prepareStatement(Consulta);
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String nombreBanco = rs.getString("nombrebanco");
                int idQuickpass = rs.getInt("idquickpass");
                boolean activo = rs.getInt("activo") == 1;

                respuesta.add(new Quickpass(idQuickpass, nombreBanco, activo));
            }

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return respuesta;
    }

    public ArrayList<Antena> getAntena() {

        ArrayList<Antena> respuesta = new ArrayList<>();
        try {
            Connection conn = crearConexion();
            Statement stmt = conn.createStatement();
            String Consulta = "select a.idantena,p.rutapeaje\n"
                    + "from tablas_peaje.antena a\n"
                    + "join tablas_peaje.peaje p on a.idpeaje = p.idpeaje";
            ResultSet rs = stmt.executeQuery(Consulta);
            while (rs.next()) {
                String rutaPeaje = rs.getString("rutapeaje");
                int idAntena = rs.getInt("idantena");

                respuesta.add(new Antena(idAntena, rutaPeaje));
            }

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return respuesta;
    }

    public ArrayList<Tarifas> getMontoAntena(int idAntena) {

        ArrayList<Tarifas> respuesta = new ArrayList<>();
        try {
            Connection conn = crearConexion();

            String Consulta = "SELECT cp.monto, \n"
                    + "       tp.descripcion\n"
                    + "FROM tablas_peaje.antena a\n"
                    + "JOIN tablas_peaje.peaje p ON a.idpeaje = p.idpeaje\n"
                    + "JOIN tablas_peaje.costopeaje cp ON p.idpeaje = cp.idpeaje\n"
                    + "JOIN tablas_quickpass.tipovehiculo tp ON cp.idtipovehiculo = tp.idtipovehiculo\n"
                    + "WHERE a.idantena = ?";
            PreparedStatement stmt = conn.prepareStatement(Consulta);
            stmt.setInt(1, idAntena);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String descripcionTipoVehiculo = rs.getString("descripcion");
                int monto = rs.getInt("monto");

                respuesta.add(new Tarifas(monto, descripcionTipoVehiculo));
            }

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }

        return respuesta;
    }

    public int procesarPase(int idAntena, int idQuickpass) {
        int resultado = -1;
        
        try {
            Connection conn = crearConexion();
            
            String Consulta = "{call AutorizarPase(?,?,?)}";
            CallableStatement stmt = conn.prepareCall(Consulta);
            stmt.setInt(1, idQuickpass);
            stmt.setInt(2, idAntena);
            
            stmt.registerOutParameter(3, OracleTypes.INTEGER);
            stmt.execute();
            
            resultado = stmt.getInt(3);

            stmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultado;
    }
}
