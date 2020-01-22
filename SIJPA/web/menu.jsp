<%-- 
    Document   : menu
    Created on : 25/09/2019, 02:36:27 PM
    Author     : CARLOS.SANCHEZG
--%>

<nav>
    <ul>
        <li><a href="causasPenales.jsp">Causas Penales</a></li>
        <li><a href="juzgados.jsp">Juzgados</a></li>
        <li><a href="jueces.jsp">Jueces</a></li>
        <li><a href="audiencias.jsp">Audiencias</a></li>
        <% if((Integer)session.getAttribute("tipoUsuario") == 1){ %>
            <li><a href="usuario.jsp">Usuarios</a></li>
        <% } %>
    </ul>
</nav>