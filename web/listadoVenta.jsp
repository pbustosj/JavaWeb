<%-- 
    Document   : listadoVenta
    Created on : 21-08-2017, 10:30:52
    Author     : Desarrollador
--%>

<%@page import="java.util.List"%>
<%@page import="duoc.cl.dej4501.entidades.Venta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->


        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/css/materialize.min.css">

        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.1/js/materialize.min.js"></script>

        <title>Listado - Venta Celulares</title>
    </head>
    <body>
      

        <%
            if (session.getAttribute("listadoVentas") != null) {
                List<Venta> listadoVentas = (List<Venta>) session.getAttribute("listadoVentas");

        %>
        <div class="container">
              <h1>Listado Venta</h1>
            <table class="highlight centered responsive-table">
                <thead>
                    <tr>
                        <th>Código Venta</th>
                        <th>Comprador</th>
                        <th>Cantidad</th>
                    </tr>
                </thead>

                <tbody>

                    <%for (Venta venta : listadoVentas) {


                    %>
                    <tr>
                        <td>
                            <%=venta.getCodigo()%>
                        </td>
                        <td>
                            <%=venta.getNombreComprador()%>
                        </td>
                        <td>
                            <%=venta.getCantTelefonos()%>
                        </td>


                    </tr>

                    <%}
                    %>
                </tbody>
            </table>
        </div>
        <%    } else {
        %>
        No hay datos.
        <% }%>
    </body>
</html>
