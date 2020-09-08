<%-- 
    Document   : cabecera
    Created on : 19/09/2019, 12:45:50 PM
    Author     : CARLOS.SANCHEZG
--%>

<header class="cabecera">
    <img id="logo" src="img/logo.png" alt="Logo Inegi">
    <img id="titulo" src="img/logo_sijpa.png">
    <div id="usu">
        <div id="enlace"hidden><a href="index.jsp">CERRAR SESIÓN</a></div>
        <img src="img/sort_desc.png" title="Cerrar Sesión"/>
        <h5>Usuario: ${sessionScope.usuActivo}</h5>
        <% 
            //Si las variable de session tipo de  usuario esta vacia quiere decir que se perdio toda la session y lo regresamos al index
            if(session.getAttribute("usuActivo") == null){
                response.sendRedirect("index.jsp?insert=600");
            }
        %>
    </div>
    <div id="doscolores"></div>
</header>
