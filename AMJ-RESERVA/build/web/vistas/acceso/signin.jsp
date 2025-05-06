<%-- 
    Document   : signin
    Created on : 27/04/2025, 5:14:31 p. m.
    Author     : USUARIO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar cuenta</title>
    <link rel="stylesheet" href="../../style/styles.css"> <!-- Aquí enlazas tu CSS -->
</head>
<body>
    <div class="container">
        <div class="left-section">
            <img src="../../img/img-logo.svg" alt="Hotel Logo" class="logo"> <!-- Puedes cambiar el src -->
            <h1>Registrar cuenta</h1>
            <p>Hazte miembro y disfruta de las mejores estadías</p>
            
            <form action="registro" method="post">
                <div class="form-group">
                    <label for="telefono">Número de teléfono</label>
                    <input type="text" id="telefono" name="telefono" required>
                </div>

                <div class="form-group">
                    <label for="correo">Correo</label>
                    <input type="email" id="correo" name="correo" required>
                </div>

                <div class="form-group">
                    <label for="contrasena">Contraseña</label>
                    <input type="password" id="contrasena" name="contrasena" required>
                </div>

                <div class="form-group-remember">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Remember me</label>
                </div>

                <button type="submit" class="btn-registrarse">Registrarse</button>
            </form>

            <p class="login-link">¿Ya tienes una cuenta? <a href="vistas/Acceso/login.jsp">Iniciar sesión</a></p>
        </div>

        <div class="right-section">
            <!-- Imagen o ilustración -->
            <img src="../../img/registro.svg" alt="Registro ilustración" class="illustration">
        </div>
    </div>
</body>
</html>
