<%-- 
    Document   : index
    Created on : 18/09/2019, 12:24:41 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Ingreso</title>
        <%@include file="librerias.jsp"%>
        <script>
            //Solo se puede abrir en google chrome, validamos con cual inicializa el sistema
            var es_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
            if(!es_chrome){
                window.location.href = "navegador.jsp";
            }
        </script>
        <%
            //Si cierran sesion borramos las Variables de Session
            if(session.getAttribute("usuActivo") != null){
                session.invalidate();
            }

            //Verificamos si no hay ususarios entonces tenemos que capturar el Admin
            usuario usuario = new usuario();
            System.out.println(usuario.findTotUsu());
            if(usuario.findTotUsu() == 0){
                response.sendRedirect("capturaUsuario.jsp");
            }

            //Control de Acertados o errores al insertar o actualizar registros
            if(request.getParameter("insert") != null){
                int integer = Integer.parseInt(request.getParameter("insert"));
                out.println("<script>$(document).ready(function () {");
                if(integer == 100){
                    out.println("alertify.alert('Confirmado','El Usuario fue guardado correctamente', function(){"
                            + "alertify.success('Usuario Guardado OK')});");
                }else if(integer == 200){
                    out.println("alertify.alert('Error','El Usuario no se pudo guardar', function(){"
                            + "alertify.error('Usuario Sin Guardar')});");
                }
                out.println("});</script>");
            }
        %>
    </head>
    <body>
        <div id="splash" hidden="true">
            <img src="img/logo_sijpa.png">
        </div>
        <div id="login" hidden="true">
            <img src="img/logo_sijpa.png"/>
            <form method="post" name="formLogin" id="formLogin">
                <label for="nomUsu">Usuario</label>
                <input type="text" id="nomUsu" name="nomUsu" style="text-transform: uppercase" required/>
                <label for="passUsu">Contraseña</label>
                <input type="password" id="passUsu" name="passUsu" required style="letter-spacing: 2px; font-size: 22px;"/>
                <input type="submit" name="enviaUsu" id="enviaUsu" value="Ingresar"/>
            </form>
        </div>
    </body>
</html>
