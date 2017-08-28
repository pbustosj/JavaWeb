
<%@page import="duoc.cl.dej4501.entidades.Vendedor"%>
<%@page import="duoc.cl.dej4501.entidades.Compania"%>
<%@page import="duoc.cl.dej4501.negocio.CompaniaController"%>
<%@page import="duoc.cl.dej4501.negocio.VendedorController"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="duoc.cl.dej4501.negocio.MarcaController"%>
<%@page import="duoc.cl.dej4501.entidades.Marcas"%>
<%@page import="java.math.MathContext"%>
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
            <h1 class="center-align">Listado Venta</h1>
            <table class="highlight centered responsive-table">
                <thead>
                    <tr>
                        <th>Código Venta</th>
                        <th>Comprador</th>
                        <th>Cantidad</th>
                        <th>Vendedor</th>
                        <th>Marca</th>
                        <th>Compañia</th>
                    </tr>
                </thead>

                <tbody>

                    <%for (Venta venta : listadoVentas) {
                            LinkedList<Marcas> listaMarcas = (LinkedList<Marcas>) session.getAttribute("listadoMarcas");
                            LinkedList<Compania> listaCompa = (LinkedList<Compania>) session.getAttribute("listadoCompanias");
                            LinkedList<Vendedor> listaVende = (LinkedList<Vendedor>) session.getAttribute("listadoVendedores");
                            MarcaController mC = new MarcaController(listaMarcas);
                            VendedorController vC = new VendedorController(listaVende);
                            CompaniaController cC = new CompaniaController(listaCompa);
                            Marcas objMarca = mC.show(venta.getCodigoMarca());
                            Compania objCompa = cC.show(venta.getCodigoCompania());
                            Vendedor objVende = vC.show(venta.getCodVendedor());
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
                        <td>
                            <%=objVende.getFullName()%>
                        </td>
                        <td>
                            <%=objMarca.getNombre()%>
                        </td>
                        <td>
                            <%=objCompa.getNombre()%>
                        </td>


                    </tr>

                    <%
                            objMarca = null;
                        }
                    %>
                </tbody>
            </table>


        </div>
        <%    } else {
        %>
        No hay datos.
        <% }%>
        <br><br>
        <div class="center-align">   <a class="btn green pulse" href ="ingresoVenta.jsp">Ir a Ingresar Venta</a></div>
    </body>
</html>
