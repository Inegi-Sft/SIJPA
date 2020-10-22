<%-- 
    Document   : validaSesion
    Created on : 21/10/2020, 06:58:11 PM
    Author     : CARLOS.SANCHEZG
--%>

<%
    //Si las variable de session tipo de  usuario esta vacia quiere decir que se perdio toda la session y lo regresamos al index
    if(session.getAttribute("usuActivo") == null){
        response.sendRedirect("index.jsp?insert=600");
    }
%>
