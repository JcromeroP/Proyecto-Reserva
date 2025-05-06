<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesi�n</title>
    <link rel="stylesheet" href="../../style/styles.css">
</head>
<body>
    <div class="container">
        <div class="right-section">
            <img src="../../img/img-login.svg" alt="Iniciar sesi�n ilustraci�n" class="illustration">
        </div>

        <div class="left-section">
            <img src="../../img/img-logo.svg" alt="Hotel Logo" class="logo">
            <h1>Iniciar Sesi�n</h1>
            <div class="information">
                <p class="justify-text">Introduce tu nombre de usuario y contrase�a para iniciar sesi�n.</p>
                <%-- Mensaje de error si el inicio de sesi�n falla --%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <p class="error-message" style="color: red;"><%= request.getAttribute("errorMessage") %></p>
                <% } %>
            </div>

            <form action="LoginServlet" method="post">
                <div class="form-group">
                    <label for="usuario">Nombre de Usuario</label>
                    <input type="text" id="usuario" name="usuario" required>
                </div>

                <div class="form-group">
                    <label for="contrasena">Contrase�a</label>
                    <input type="password" id="contrasena" name="contrasena" required>
                </div>

                <div class="form-group-remember">
                    <input type="checkbox" id="remember" name="remember">
                    <label for="remember">Recordarme</label>
                </div>

                <button type="submit" class="btn-registrarse">Iniciar Sesi�n</button>
            </form>

            <p class="login-link">�No tienes una cuenta? <a href="../Registro/registro.jsp">Registrarse</a></p>
        </div>
    </div>
</body>
</html>