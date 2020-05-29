<%-- 
    Document   : menu
    Created on : 25/09/2019, 02:36:27 PM
    Author     : CARLOS.SANCHEZG
--%>

<nav>
    <ul>
        <li>
            <p class="fUsuario">
                <img src="img/usuario.png" class="img-circle" width="80">
            </p>
            <h4>Menú Usuario</h4>
        </li>
        <li><a href="causasPenales.jsp">JC</a></li>
        <li><a href="causasPenalesJO.jsp">JO</a></li>
        <li><a href="juzgados.jsp">Juzgados</a></li>
        <li><a href="jueces.jsp">Jueces</a></li>
        <li><a href="audiencias.jsp">Audiencias</a></li>
        <!--<li><a href="sistemasCap.jsp">Sistemas de Captura</a></li>-->
        <% 
            if(session.getAttribute("tipoUsuario") != null){
                if((Integer)session.getAttribute("tipoUsuario") == 1){ %>
                    <li><a href="usuario.jsp">Usuarios</a></li>
                    <li><a href="BDMySQL/sijpa_db_290520.sql" download="sijpa_db.sql">Base de Datos SIJPA</a></li>
        <% 
                }
            }else{
                response.sendRedirect("index.jsp");
            }
        %>
    </ul>
</nav>