<%@page import="modelo.Empleado"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Empleado empleado = (Empleado) request.getAttribute("empleado");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Empleado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4">Editar Empleado</h2>
    
    <form action="ConsultarUsuariosServlet" method="post">
        <input type="hidden" name="accion" value="guardarActualizacion">
        <input type="hidden" name="dni" value="<%= empleado.getDni() %>">
        
        <div class="mb-3">
            <label class="form-label">Nombres</label>
            <input type="text" name="nombres" class="form-control" value="<%= empleado.getNombres() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Apellidos</label>
            <input type="text" name="apellidos" class="form-control" value="<%= empleado.getApellidos() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Fecha de Nacimiento</label>
            <input type="date" name="fecha_nac" class="form-control" value="<%= empleado.getFechaNac() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Dirección</label>
            <input type="text" name="direccion" class="form-control" value="<%= empleado.getDireccion() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Cargo</label>
            <input type="text" name="cargo" class="form-control" value="<%= empleado.getCargo() %>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Usuario</label>
            <input type="text" name="usuario" class="form-control" value="<%= empleado.getUsuario() %>" required>
        </div>

        <button type="submit" class="btn btn-success">Guardar Cambios</button>
        <a href="ConsultarUsuariosServlet" class="btn btn-secondary">Cancelar</a>
    </form>
</div>

</body>
</html>
