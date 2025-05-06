<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Íconos (opcional) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .sidebar {
            height: 100vh;
            background-color: #fff;
            padding-top: 1rem;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: #333;
            text-decoration: none;
            font-weight: 500;
        }
        .sidebar a:hover {
            background-color: #f1f1f1;
            color: #0d6efd;
        }
        .alerta {
            background-color: red;
            color: white;
            padding: 20px;
            border-radius: 8px;
            font-size: 1.2rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .bot-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .content-section {
            display: none;
        }
        .active-section {
            display: block;
        }
        .table-container {
            max-height: 500px;
            overflow-y: auto;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-md-2 d-none d-md-block sidebar">
                <div class="text-center mb-4">
                    <img src="../img/img-logo.svg" alt="Logo" style="width: 80px;">
                </div>
                <div class="text-center">
                    <i class="bi bi-person-circle" style="font-size: 2rem; color: orange;"></i>
                    <p class="fw-bold mt-2">Juan Camilo Romero Pascuas</p>
                </div>
                <hr>
                <a href="#" class="user-link" data-section="registro-usuario"><i class="bi bi-person-plus"></i> Registrar Usuario</a>
                <hr>
                <a href="#" class="user-link" data-section="usuarios-registrados"><i class="bi bi-people"></i> Usuarios Registrados</a>
                <hr>
                <!-- Opciones de usuarios -->
                
            </nav>

            <!-- Main Content -->
            <main class="col-md-10 ms-sm-auto px-md-4 py-4">
                <!-- Sección de Dashboard (Inicio) -->
                <div id="dashboard-section" class="content-section active-section">
                    <h4>Bienvenido, Juan</h4>
                    <div class="alerta my-4">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i> Alerta de seguridad
                        <img src="ruta_robot.png" alt="Robot" style="width: 50px; margin-left: 20px;">
                    </div>
                    <div class="bot-content">
                        <p>Hola <strong>Juan Camilo Romero Pascuas</strong>, vamos a realizar una actualización de seguridad para la protección de tus datos personales.</p>
                    </div>
                </div>

                <!-- Sección de Registro de Usuario -->
                <div id="registro-usuario" class="content-section">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Registro de Usuario</h4>
                        </div>
                        <div class="card-body">
                            <form action="RegistroUsuarioServlet" method="post">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="dni" class="form-label">DNI</label>
                                            <input type="text" class="form-control" id="dni" name="dni" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="nombres" class="form-label">Nombres</label>
                                            <input type="text" class="form-control" id="nombres" name="nombres" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="apellidos" class="form-label">Apellidos</label>
                                            <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="fechaNac" class="form-label">Fecha de Nacimiento</label>
                                            <input type="date" class="form-control" id="fechaNac" name="fechaNac" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="direccion" class="form-label">Dirección</label>
                                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="cargo" class="form-label">Cargo</label>
                                            <input type="text" class="form-control" id="cargo" name="cargo" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="usuario" class="form-label">Usuario</label>
                                            <input type="text" class="form-control" id="usuario" name="usuario" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="clave" class="form-label">Clave</label>
                                            <input type="password" class="form-control" id="clave" name="clave" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-grid mt-3">
                                    <button type="submit" class="btn btn-primary">Registrar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Sección de Usuarios Registrados -->
                <div id="usuarios-registrados" class="content-section">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Usuarios Registrados</h4>
                        </div>
                        <div class="card-body table-container">
                            <table class="table table-bordered table-striped">
                                <thead class="table-secondary">
                                    <tr>
                                        <th>ID</th>
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
                                    <c:forEach var="usuario" items="${listaUsuarios}">
                                        <tr>
                                            <td>${usuario.id}</td>
                                            <td>${usuario.dni}</td>
                                            <td>${usuario.nombres}</td>
                                            <td>${usuario.apellidos}</td>
                                            <td>${usuario.fechaNac}</td>
                                            <td>${usuario.direccion}</td>
                                            <td>${usuario.cargo}</td>
                                            <td>${usuario.usuario}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Script para controlar las secciones -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Ocultar todas las secciones excepto el dashboard al inicio
            document.querySelectorAll('.content-section').forEach(section => {
                if(section.id !== 'dashboard-section') {
                    section.classList.remove('active-section');
                }
            });
            
            // Manejar clic en enlaces de usuario
            document.querySelectorAll('.user-link').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const sectionId = this.getAttribute('data-section');
                    
                    // Ocultar todas las secciones
                    document.querySelectorAll('.content-section').forEach(section => {
                        section.classList.remove('active-section');
                    });
                    
                    // Mostrar la sección seleccionada
                    document.getElementById(sectionId).classList.add('active-section');
                });
            });
            
            // Manejar clic en enlace de dashboard
            document.querySelector('.dashboard-link').addEventListener('click', function(e) {
                e.preventDefault();
                
                // Ocultar todas las secciones
                document.querySelectorAll('.content-section').forEach(section => {
                    section.classList.remove('active-section');
                });
                
                // Mostrar dashboard
                document.getElementById('dashboard-section').classList.add('active-section');
            });
        });
    </script>
</body>
</html>