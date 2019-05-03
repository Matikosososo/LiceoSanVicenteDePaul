package utils;

import Utils.Convertor;
import java.sql.Connection; // establecer la conexión
import java.sql.Statement;  // ejecutar querys
import java.sql.ResultSet;  // Tabla virtual MYSQL --> Select
import java.sql.DriverManager; // Obtener la conexión del Driver
import java.sql.SQLException;
import org.JSONArray;

public class Conexion {

    private Connection con;
    private Statement sentencia;
    private ResultSet tablaVirtual;

    // Constructor
    // Datos necesarios:
    /*
    server  --> localhost
    user    --> root
    pass    --> 123456
    bdName  --> bd_alimentos
     */
    public Conexion(String server, String user, String pass, String bdName) throws ClassNotFoundException, SQLException {
        // Definir la URL de conexión
        // jdbc:mysql//localhost/bdName?user=root&password=
        String protocolo = "jdbc:mysql://";
        String lineaUsuario = "user=" + user;
        String lineaPass = "password=" + pass;

//        String url2 = "jdbc:mysql//"+server+"/"+bdName+"?user="+user+"&pass="+pass;
        String url = protocolo
                + server + "/"
                + bdName + "?"
                + lineaUsuario + "&"
                + lineaPass;

        System.out.println(url);

        // Cargar en tiempo de ejecución el Driver de MySQL
//        Class.forName("MySQL-AB JDBC Driver");
        Class.forName("com.mysql.jdbc.Driver");

        // Rescatar el objeto Conexión desde el Driver
        con = DriverManager.getConnection(url);
    }
    
    public Conexion() throws ClassNotFoundException, SQLException{
        // Definir la URL de conexión
        // jdbc:mysql//localhost/bdName?user=root&password=
        String protocolo = "jdbc:mysql://";
        String lineaUsuario = "user=msilva@klawx3.softether.net";
        String lineaPass = "password=qweasdzxc";

//        String url2 = "jdbc:mysql//"+server+"/"+bdName+"?user="+user+"&pass="+pass;
        String url = protocolo
                + "http://klawx3.softether.net/"
                + "riego_bd?"
                + lineaUsuario + "&"
                + lineaPass;

        System.out.println(url);

        // Cargar en tiempo de ejecución el Driver de MySQL
        Class.forName("com.mysql.jdbc.Driver");

        // Rescatar el objeto Conexión desde el Driver
        con = DriverManager.getConnection(url);
    }

    public void ejecutar(String sql) throws SQLException {
        // 1.- Crear la sentencia a traves de la conexión
        // Abrir la conexión
        System.out.println(sql);
        sentencia = con.createStatement();

        // 2.- ejecutar sql
        sentencia.execute(sql);

        // 3.- Cerrar la conexión --> desconectar()
        desconectar();
    }
    public ResultSet ejecutarSelect(String select) throws SQLException {
        System.out.println(select);
        sentencia = con.createStatement();
        tablaVirtual = sentencia.executeQuery(select);
        
        return tablaVirtual;
    }
    public JSONArray SelectJson(String select) throws SQLException, Exception{
        Convertor x = new Convertor();
        return x.convertResultSetIntoJSON(this.ejecutarSelect(select));
    }
    public void desconectar() throws SQLException {
        sentencia.close();
    }
}