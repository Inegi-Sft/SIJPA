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
    </div>
    <div id="doscolores"></div>
</header>
