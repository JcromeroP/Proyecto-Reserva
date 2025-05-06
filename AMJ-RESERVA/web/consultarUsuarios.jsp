<%@page import="modelo.Empleado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Empleados</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <div class="container mt-5">
            <h2 class="text-center mb-4">Lista de Empleados</h2>
            <a href="RegistroUsuarioServlet?action=registrar" class="btn btn-success">Registrar nuevo usuario</a>
<hr>
            <table class="table table-bordered table-hover shadow">
                <thead class="table-primary">
                    <tr>
                        <th>DNI</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Fecha Nacimiento</th>
                        <th>Dirección</th>
                        <th>Cargo</th>
                        <th>Usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Empleado> listaEmpleados = (ArrayList<Empleado>) request.getAttribute("listaEmpleados");
                        if (listaEmpleados != null) {
                            for (Empleado emp : listaEmpleados) {
                    %>
                    <tr>
                        <td><%= emp.getDni()%></td>
                        <td><%= emp.getNombres()%></td>
                        <td><%= emp.getApellidos()%></td>
                        <td><%= emp.getFechaNac()%></td>
                        <td><%= emp.getDireccion()%></td>
                        <td><%= emp.getCargo()%></td>
                        <td><%= emp.getUsuario()%></td>
                        <td>
                            <form action="ConsultarUsuariosServlet" method="post" style="display:inline;">
                                <input type="hidden" name="dni" value="<%= emp.getDni()%>">
                                <input type="hidden" name="accion" value="editar"> <!-- CAMBIA ESTO -->
                                <button type="submit" class="btn btn-warning btn-sm">Actualizar</button>
                            </form>
                            <form action="ConsultarUsuariosServlet" method="post" style="display:inline;" onsubmit="return confirm('¿Estás seguro de eliminar este empleado?');">
                                <input type="hidden" name="dni" value="<%= emp.getDni()%>">
                                <input type="hidden" name="accion" value="eliminar">
                                <button type="submit" class="btn btn-danger btn-sm">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>

            <div class="text-center mt-4">
                <a href="dashboard.jsp" class="btn btn-secondary">Volver al Dashboard</a>
            </div>
        </div>

    </body>
</html>
