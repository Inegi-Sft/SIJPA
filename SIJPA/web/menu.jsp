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
            <h4>Men� Usuario</h4>
        </li>
        <li><a href="juzgados.jsp">Juzgados</a></li>
        <li><a href="jueces.jsp">Jueces</a></li>
        <li><a href="causasPenales.jsp">Juzgado de Control</a></li>
        <li><a href="causasPenalesJO.jsp">Juicio Oral</a></li>
        <li><a>Audiencias +</a>
            <ul>
                <li><a href="audiencias.jsp">Audiencias JC</a></li>
                <li><a href="audienciasJO.jsp">Audiencias JO</a></li>
            </ul>
        </li>
        <li><a>Utilidades +</a>
            <ul>
                <li><a href="exportarBD.jsp">Exportar BD</a></li>
                <li><a href="importarBD.jsp">Importar BD</a></li>
                <li><a href="reportes.jsp">Reportes</a></li>
                <li><a href="validaciones.jsp">Validar Datos</a></li>
                <li><a href="bienvenida.jsp">Acuerdo</a></li>
            </ul>
        </li>
        <% 
            //Si es un administrador entonces le mostramos el boton para agregar usuarios
            if((Integer)session.getAttribute("tipoUsuario") == 1 || (Integer)session.getAttribute("tipoUsuario") > 3){
                out.println("<li><a href='usuario.jsp'>Usuarios</a></li>"); 
            }
        %>
    </ul>
</nav>