/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Empleado;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "ConsultarUsuariosServlet", urlPatterns = {"/"})
public class ConsultarUsuariosServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
    
    // Método para mostrar el formulario
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    cargarUsuarios(request, response);
}

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String accion = request.getParameter("accion");
    String dni = request.getParameter("dni");

    if ("eliminar".equalsIgnoreCase(accion) && dni != null) {
        eliminarEmpleado(dni, request, response);
    } else if ("editar".equalsIgnoreCase(accion) && dni != null) {
        mostrarFormularioActualizacion(dni, request, response);
    } else if ("guardarActualizacion".equalsIgnoreCase(accion)) {
        guardarActualizacion(request, response);
    } else {
        cargarUsuarios(request, response);
    }
}

private void guardarActualizacion(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String dni = request.getParameter("dni");
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String fechaNac = request.getParameter("fecha_nac");
    String direccion = request.getParameter("direccion");
    String cargo = request.getParameter("cargo");
    String usuario = request.getParameter("usuario");

    try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
        String sql = "UPDATE empleado SET nombres=?, apellidos=?, fecha_nac=?, direccion=?, cargo=?, usuario=? WHERE dni=?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, nombres);
        statement.setString(2, apellidos);
        statement.setString(3, fechaNac);
        statement.setString(4, direccion);
        statement.setString(5, cargo);
        statement.setString(6, usuario);
        statement.setString(7, dni);
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error al actualizar: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return;
    }

    cargarUsuarios(request, response); // Recarga la lista después de actualizar
}

private void eliminarEmpleado(String dni, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
        String sql = "DELETE FROM empleado WHERE dni = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, dni);
        statement.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error al eliminar: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return;
    }
    // Redirige para recargar la lista
    cargarUsuarios(request, response);
}
private void mostrarFormularioActualizacion(String dni, HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
        String sql = "SELECT * FROM empleado WHERE dni = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, dni);
        ResultSet resultSet = statement.executeQuery();

        if (resultSet.next()) {
            Empleado empleado = new Empleado();
            empleado.setDni(resultSet.getString("dni"));
            empleado.setNombres(resultSet.getString("nombres"));
            empleado.setApellidos(resultSet.getString("apellidos"));
            empleado.setFechaNac(resultSet.getDate("fecha_nac"));
            empleado.setDireccion(resultSet.getString("direccion"));
            empleado.setCargo(resultSet.getString("cargo"));
            empleado.setUsuario(resultSet.getString("usuario"));

            request.setAttribute("empleado", empleado);
            request.getRequestDispatcher("editarUsuario.jsp").forward(request, response);
            return;
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error al cargar el empleado: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return;
    }
}

private void cargarUsuarios(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ArrayList<Empleado> listaEmpleados = new ArrayList<>();

    try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
        String sql = "SELECT * FROM empleado";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            Empleado empleado = new Empleado();
            empleado.setDni(resultSet.getString("dni"));
            empleado.setNombres(resultSet.getString("nombres"));
            empleado.setApellidos(resultSet.getString("apellidos"));
            empleado.setFechaNac(resultSet.getDate("fecha_nac"));
            empleado.setDireccion(resultSet.getString("direccion"));
            empleado.setCargo(resultSet.getString("cargo"));
            empleado.setUsuario(resultSet.getString("usuario"));
            listaEmpleados.add(empleado);
        }

        request.setAttribute("listaEmpleados", listaEmpleados);
        request.getRequestDispatcher("consultarUsuarios.jsp").forward(request, response);

    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error de base de datos: " + e.getMessage());
        request.getRequestDispatcher("error.jsp").forward(request, response);
    }
}
}
