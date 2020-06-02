<%-- 
    Document   : index
    Created on : 18/09/2019, 12:24:41 PM
    Author     : CARLOS.SANCHEZG
--%>

<%@page import="clasesAuxiliar.usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("usuActivo") != null){
        session.invalidate();
    }
    
    usuario usuario = new usuario();
    if(usuario.findTotUsu() == 0){
        response.sendRedirect("capturaUsuario.jsp");
    }
    
    if(request.getParameter("errorbd") != null){
        out.println("<script>alert('Error con la Base de Datos, favor de chacarlo')</script>");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJPA::Ingreso</title>
        <%@include file="librerias.jsp"%>
        <script>
            var es_chrome = navigator.userAgent.toLowerCase().indexOf('chrome') > -1;
            if(!es_chrome){
                window.location.href = "navegador.jsp";
            }
        </script>
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
