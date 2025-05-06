/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "RegistroUsuarioServlet", urlPatterns = {"/RegistroUsuarioServlet"})
public class RegistroUsuarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Configura tus credenciales de base de datos aquí
    private String jdbcURL = "jdbc:mysql://localhost:3306/reserva_hotel?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el driver JDBC", e);
        }
    }

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("registrar".equals(action)) {
            // Mostrar formulario de registro
            request.getRequestDispatcher("registroUsuario.jsp").forward(request, response);
        } else {
            // Acción por defecto si no se especifica o es incorrecta
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
    
    
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // Obtener parámetros del formulario
    String dni = request.getParameter("dni");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String fechaNacStr = request.getParameter("fechaNac");
    String direccion = request.getParameter("direccion");
    String cargo = request.getParameter("cargo");
    String usuario = request.getParameter("usuario");
    String clave = request.getParameter("clave");

    // Convertir fecha de String a Date
    Date fechaNac = null;
    try {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = sdf.parse(fechaNacStr);
        fechaNac = new Date(utilDate.getTime());
    } catch (ParseException e) {
        e.printStackTrace();
    }

    // Insertar en base de datos
    try {
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "INSERT INTO Empleado (dni, nombres, apellidos, fecha_nac, direccion, cargo, usuario, clave) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, dni);
        statement.setString(2, nombres);
        statement.setString(3, apellidos);
        statement.setDate(4, fechaNac);
        statement.setString(5, direccion);
        statement.setString(6, cargo);
        statement.setString(7, usuario);
        statement.setString(8, clave);

        int rowsInserted = statement.executeUpdate();
        if (rowsInserted > 0) {
            response.sendRedirect("exito.jsp");
        } else {
            throw new SQLException("No se pudo insertar el registro");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error de base de datos: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}
    
}
