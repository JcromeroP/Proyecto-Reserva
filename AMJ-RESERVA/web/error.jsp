<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error en el Registro</title>
</head>
<body>
    <h2>¡Error al registrar el usuario!</h2>
    <p>Motivo: ${errorMessage}</p>
    <p>Detalles técnicos: <%= exception != null ? exception.getMessage() : "No disponible" %></p>
    <p><a href="registroUsuario.jsp">Volver al formulario</a></p>
</body>
</html>