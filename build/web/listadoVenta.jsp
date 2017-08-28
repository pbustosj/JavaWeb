
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
                    int totalSI = 0;
                    int totalCI = 0;

            %>
        <div class="container">
            <div class="col l2">
                 <h1 class="center-align">Listado Venta</h1>
            </div>
            <div class="col l10">
                <a  onclick="location.reload();"><img class="" src="http://icons.iconarchive.com/icons/graphicloads/100-flat-2/256/arrow-refresh-4-icon.png" style="max-width: 25px;">Actualizar Lista</a>
            </div>
           
            <table class="highlight centered responsive-table bordered">
                <thead>
                    <tr class="orange lighten-2">
                        <th class="">Código Venta</th>
                        <th class="">Comprador</th>
                        <th class="">Cantidad</th>
                        <th class="">Vendedor</th>
                        <th class="">Marca</th>
                        <th class="">Compañia</th>
                        <th class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Unidad Sin Iva">Precio U/S/I</th>
                        <th class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Unidad Con Iva">Precio U/C/I</th>
                        <th class="red tooltipped lighten-2" data-position="bottom" data-delay="50" data-tooltip="Precio Total Con Iva">Precio T/S/I</th>
                        <th class="red tooltipped lighten-2" data-position="bottom" data-delay="50" data-tooltip="Precio Total Con Iva">Precio T/C/I</th>
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
                            int valorCI = (int) ((objMarca.getCosto() + objCompa.getCostoPlanBase()) * 0.19);
                            int valorCIF = (int) ((objMarca.getCosto() + objCompa.getCostoPlanBase()) + valorCI);
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
                        <td>
                            <%="$" + (int) (venta.getPrecioVentaSI()) + ".-"%>
                        </td>
                        <td>
                            <%="$" + (int) (venta.getPrecioVentaSI() + (venta.getPrecioVentaSI() * 0.19)) + ".-"%>
                        </td>
                        <td>
                            <%="$" + (int) (venta.getPrecioVentaSI() * venta.getCantTelefonos()) + ".-"%>
                        </td>
                        <td>
                            <%="$" + (int) ((venta.getPrecioVentaSI() + (venta.getPrecioVentaSI() * 0.19)) * venta.getCantTelefonos()) + ".-"%>
                        </td>


                    </tr>

                    <%
                            objMarca = null;
                            totalSI += (int) (venta.getPrecioVentaSI() * venta.getCantTelefonos());
                            totalCI += (int) ((venta.getPrecioVentaSI() + (venta.getPrecioVentaSI() * 0.19)) * venta.getCantTelefonos());
                        }

                    %>
                    <tr><br></tr>

                </tbody>
            </table>
                    <br>
            <table class="centered z-depth-5"">
                <tr>
                    <td class="" colspan="2">

                        <strong>Total Ventas Sin Iva:</strong>
                    </td>
                    <td class="orange-text" colspan="4" >

                        <%="<h2 style='font-weight: bold;'>$" + totalSI + "</h2>"%>
                    </td>
                    <td class="" colspan="2">

                        <strong> Total Ventas Con Iva:</strong>
                    </td>
                    <td class="green-text" colspan="4">
                        <%="<h1 style='font-weight: bold;'>$" + totalCI + "</h1>"%>
                    </td>
                </tr>
            </table>
                    <br><br>
            <div class="row center-align">
                <div class="col l6 red-text">
                    * U/S/I: Unidad Sin IVA (Impuesto Valor Agregado).<br>
                    * U/C/I: Unidad Con IVA (Impuesto Valor Agregado).

                </div>
                <div class="col l6 red-text">

                    * T/S/I: Total Sin IVA (Impuesto Valor Agregado).<br>
                    * T/C/I: Total Con IVA (Impuesto Valor Agregado).
                </div>
            </div>
        </div>
        <%    } else {
        %>
        <div class="container">

            <h2 class="center-align">Estimado Operador:<br>No ventas cargadas en sistema.</h2> 
        </div>

        <% }%>
        <br><br>
        <div class="center-align">   <a class="btn green pulse" href ="ingresoVenta.jsp">Ir a Ingresar Venta</a></div>
    </body>
</html>
