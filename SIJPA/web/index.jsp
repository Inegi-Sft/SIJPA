<%-- 
    Document   : index
    Created on : 18/09/2019, 12:24:41 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.actualizador"%>
<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Ingreso</title>
        <%@include file="librerias.jsp"%>
        <script type="text/javascript" src="js/fnIndex.js"></script>
        <%
            String version = "";
            //Verificamos si la tabla de versiones existe si no la creamos
            actualizador act = new actualizador();
//            System.out.println("existe tabla version: " + act.findTablaVersion());
//            if(!act.findTablaVersion()){
//                out.println("<script>$(document).ready(function () {"
//                        + "$('.load').show();"
//                        + "$.ajax({"
//                        + "type: 'post',"
//                        + "url: 'actualiza',"
//                        + "data: {version: $('#version').html()},"
//                        + "success: function (response) {"
//                        + "console.log('Respuesta del servidor actualiza ', response);"
//                        + "$('.load').fadeOut();"
//                        + "if (response === '1') {"
//                        + "alert('Actualizado correctamente');"
//                        + "}"
//                        + "}"
//                        + "});"
//                        + "});</script>");
//            }
            System.out.println("es la version igual: " + act.findVersion("BETA 1.4"));
            //Verificacmos que version de sistema tiene para poder actualizar si es diferente
            if(!act.findVersion("BETA 1.4")){ 
                out.println("<script>$(document).ready(function () {"
                        + "$('.load').show();"
                        + "$.ajax({"
                        + "type: 'post',"
                        + "url: 'actualiza',"
                        + "data: {version: 'BETA 1.3'},"
                        + "success: function (response) {"
                        + "console.log('Respuesta del servidor actualiza ', response);"
                        + "$('.load').fadeOut();"
                        + "if (response === '1') {"
                        + "alert('Actualizado correctamente');"
                        + "}"
                        + "}"
                        + "});"
                        + "});</script>");
            }else{
                version = act.version();
                System.out.println("La version es: " + version);
            }
            
            //Si cierran sesion borramos las Variables de Session
            if(session.getAttribute("usuActivo") != null){
                session.invalidate();
            }

            //Verificamos si no hay ususarios entonces tenemos que capturar el Admin
            usuario usuario = new usuario();
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
                }else if(integer == 600){
                    out.println("alertify.alert('Importante','La sesión sufrio algun defecto, inicie sesión de nuevo', function(){"
                            + "alertify.error('Sesión Finalizada')});");
                }
                out.println("});</script>");
            }
        %>
    </head>
    <body>
        <!--<div class="load"></div>-->
        <div id="splash" class="oculto">
            <img src="img/logo_sijpa.png">
        </div>
        <div id="login" class="oculto">
            <img src="img/logo_sijpa.png" id="imgLogo"/>
            <form method="post" name="formLogin" id="formLogin">
                <label for="nomUsu">Usuario</label>
                <input type="text" id="nomUsu" name="nomUsu" style="text-transform: uppercase" required/>
                <label for="passUsu">Contraseña</label>
                <input type="password" id="passUsu" name="passUsu" required style="letter-spacing: 2px; font-size: 22px;"/>
                <input type="submit" name="enviaUsu" id="enviaUsu" value="Ingresar"/>
            </form>
            <h5 id="version"><%=version%></h5>
        </div>
    </body>
</html>
