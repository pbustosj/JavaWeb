

<%@page import="duoc.cl.dej4501.entidades.Vendedor"%>
<%@page import="duoc.cl.dej4501.entidades.Marcas"%>
<%@page import="java.util.List"%>
<%@page import="duoc.cl.dej4501.entidades.Compania"%>
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

        <title>Ingreso - Venta Celulares</title>
    </head>
    <body>

        <jsp:include page="/cargaCompania" flush="true" />
        <jsp:include page="/cargaMarca" flush="true" />
        <jsp:include page="/cargaVendedores" flush="true" />

        <div class="container">
            <h1 class="center">Ingreso Venta</h1><hr><br>
            <div class="row">
                <form class="col s12" method="POST" action="./creaVentaServlet" id="frmEnvio" name="frmEnvio">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">account_box</i>
                            <input id="txtComprador" name="txtComprador" type="text" class="validate">
                            <label for="txtComprador">Comprador</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix">account_circle</i>
                            <select name="ddlVendedor" id="ddlVendedor">
                                <option value="0" disabled selected>--Seleccion Opción--</option>
                                <%
                                    if (session.getAttribute("listadoVendedores") != null) {

                                        List<Vendedor> listadoVende = (List<Vendedor>) session.getAttribute("listadoVendedores");
                                        for (Vendedor comp : listadoVende) {

                                %>

                                <option value="<%=comp.getId()%>"><%=comp.getFullName()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label for="ddlVendedor">Vendedor</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class=" input-field col s6">
                            <i class="material-icons prefix">phone_android</i>
                            <select id="ddlMarcas" name="ddlMarcas">
                                <option value="0" disabled selected>--Seleccion Opción--</option>
                                <%
                                    if (session.getAttribute("listadoMarcas") != null) {

                                        List<Marcas> listadoMarcas = (List<Marcas>) session.getAttribute("listadoMarcas");
                                        for (Marcas comp : listadoMarcas) {

                                %>

                                <option name="<%=comp.getCosto()%>" value="<%=comp.getId()%>"><%=comp.getNombre()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label for="icon_prefix">Marca</label>
                        </div>
                        <!--<div class="input-field col s6">
                            <i class="material-icons prefix">vpn_key</i>
                            <input id="icon_prefix" type="text" class="validate">
                            <label for="icon_prefix">Código Venta</label>
                        </div>-->

                        <div class="input-field col s6">
                            <i class="material-icons prefix">business</i>
                            <select id="ddlCompanias" name="ddlCompanias">
                                <option value="0" disabled selected>--Seleccion Opción--</option>
                                <%
                                    if (session.getAttribute("listadoCompanias") != null) {

                                        List<Compania> listadoCompa = (List<Compania>) session.getAttribute("listadoCompanias");
                                        for (Compania comp : listadoCompa) {

                                %>

                                <option  name="<%=comp.getCostoPlanBase()%>" value="<%=comp.getId()%>"><%=comp.getNombre()%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                            <label for="icon_prefix">Compañia</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix">add_shopping_cart</i>
                            <input name="txtCantidad" id="txtCantidad" value="1" type="number" min="1" class="validate">
                            <label for="txtCantidad">Cantidad</label>
                        </div>

                        <div class="input-field col s6 center">
                            <a class="waves-effect waves-light btn modal-trigger green btn-large" href="#modal1" id="calcularPrecio" style="font-size:25px;">Cotizar<i class="material-icons large">attach_money</i></a>
                        </div>
                    </div>
                    <div class="row" id="respuesta" style="display:none;border: solid 1px #00cc00;">


                        <div id="modal1" class="modal modal-fixed-footer">
                            <div class="modal-content">
                                <h4 class="center-align">  <strong>Resultado Cotización</strong></h4>
                                <div class="input-field col s12 " style="margin-top: 0px;">
                                    <div class="row  white-text " id="estimado" >
                                        <div class="col s12 center-align">

                                            <p class="center-align green"><strong>A continuación se detalla información de cotización:</strong></p> 
                                            <p class="left-align black-text" id="data-weon"></p>
                                        </div>

                                    </div>

                                    <div class="row center">
                                        <div class="col s12 ">

                                            <table class="centered responsive-table highlight">
                                                <thead class="green white-text">
                                                    <tr>
                                                        <th class="green tooltipped" data-position="bottom" data-delay="50" data-tooltip="Producto Seleccionado">Producto</th>
                                                        <th class="green  tooltipped" data-position="bottom" data-delay="50" data-tooltip="Marca Seleccionada"> Marca</th>
                                                        <th class="green  tooltipped" data-position="bottom" data-delay="50" data-tooltip="Compañia Seleccionada">Compañia</th>
                                                        <th class="green  tooltipped" data-position="bottom" data-delay="50" data-tooltip="Cantidad Seleccionada">Cantidad</th>
                                                        <th class="green  tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Unidad Sin Iva">Precio U/S/I</th>
                                                        <th class="green  tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Unidad Con Iva">Precio U/C/I</th>



                                                    </tr>

                                                </thead>

                                                <tbody>
                                                    <tr>
                                                        <td id="producto">Smartphone</td>
                                                        <td id="marca"></td>
                                                        <td id="compania">Movistar</td>
                                                        <td id="cantidad">2</td>
                                                        <td id="presi">$50000</td>
                                                        <td id="preci">$60000</td>


                                                    </tr>

                                                </tbody>
                                            </table >
                                            <table class="centered responsive-table highlight">
                                                <thead class="green white-text">
                                                    <tr>

                                                        <th  class="green tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Total Sin Iva" colspan="3">Precio Total Sin Iva</th>
                                                        <th  class="green tooltipped" data-position="bottom" data-delay="50" data-tooltip="Precio Toal Con Iva" colspan="3">Precio Total Con Iva</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="3" id="pretosi">$100000</td>
                                                        <td colspan="3" id="pretoci">$120000</td>
                                                    </tr>
                                                </tbody>

                                            </table>



                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col l12 red-text">
                                            * U/S/I: Unidad Sin IVA (Impuesto Valor Agregado).<br>
                                            * U/C/I: Unidad Con IVA (Impuesto Valor Agregado).
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="modal-footer">
                                <a href="home.jsp" class="red white-text modal-action modal-close waves-effect waves-green btn-flat">Ir a Menú Principal</a>
                                <a class="cancelar orange white-text modal-action modal-close waves-effect waves-green btn-flat">Cambiar Datos</a>
                                <a class="confirmar green white-text modal-action modal-close waves-effect waves-green btn-flat">Confirmar</a>                        </div>
                        </div>



                    </div>

                </form>
            </div>
        </div>

        <% if (session.getAttribute("menOk") != null) {

        %>

        <div id="respuesta2" class="black white-text">
            <div class="modal-content center-align">
                <h4>¡Venta Ingresada Exitósamente!</h4>
                <p>Excelente:<br>Se ha ingresado registro con éxito.</p>
            </div>
            <div class="center-align">
                <a href="home.jsp" class="red white-text modal-action modal-close waves-effect waves-green btn-flat">Ir a Menú Principal</a>
                <a href="listadoVenta.jsp" class="orange white-text modal-action modal-close waves-effect waves-green btn-flat">Ir a Lista de Ventas</a>
                <a onclick="location.reload();" class="green white-text modal-action modal-close waves-effect waves-green btn-flat">Ingresar Nueva Venta</a>
            </div>
        </div>
        <br>

        <%  session.removeAttribute("menOk");
            }


        %>

    </body>
</html>
<script>
    $(document).ready(function () {
        $('.tooltipped').tooltip({delay: 50});
        $('.modal').modal();
        $('select').material_select();
        $('.confirmar').click(function () {
            $('#frmEnvio').submit();
        });
        $('#calcularPrecio').click(function () {
            var txtComprador = $('#txtComprador').val();
            var ddlVendedor = $('#ddlVendedor').val();
            var nomVendedor = $('#ddlVendedor option[value="' + ddlVendedor + '"]').text();
            var ddlMarcas = $('#ddlMarcas').val();
            var nomMarcas = $('#ddlMarcas option[value="' + ddlMarcas + '"]').text();
            var valorMarca = parseInt($('#ddlMarcas option[value="' + ddlMarcas + '"]').attr('name'));
            var ddlCompanias = $('#ddlCompanias').val();
            var nomCompanias = $('#ddlCompanias option[value="' + ddlCompanias + '"]').text();
            var valorCompañia = parseInt($('#ddlCompanias option[value="' + ddlCompanias + '"]').attr('name'));
            var txtCantidad = parseInt($('#txtCantidad').val());

            //alert(valorMarca);
            // alert(valorCompañia);
            var valorCI = (valorMarca + valorCompañia) * 0.19;
            var valorCIF = (valorMarca + valorCompañia) + valorCI;

            var valorTCI = (valorMarca + valorCompañia) * 0.19;
            var valorTCIF = ((valorMarca + valorCompañia) + valorCI) * txtCantidad;

            if (txtComprador.trim() == "") {
                Materialize.toast('Comprador es olbigatorio', 4000, "red");
                $('#txtComprador').focus();
                return false;
            }

            if (ddlVendedor == null) {
                Materialize.toast('Vendedor es olbigatorio', 4000, "red");
                $('#ddlVendedor').focus();
                return false;
            }
            if (ddlMarcas == null) {
                Materialize.toast('Marca es olbigatorio', 4000, "red");
                $('#ddlMarcas').focus();
                return false;
            }
            if (ddlCompanias == null) {
                Materialize.toast('Compañia es olbigatorio', 4000, "red");
                $('#ddlCompanias').focus();
                return false;
            } else {
                var dt = new Date();
                var time = dt.getDate() + "/" + dt.getMonth() + 1 + "/" + dt.getFullYear();
                $('#data-weon').html("");
                $('#data-weon').append("<strong>Comprador:</strong> " + txtComprador + "<br>");
                $('#data-weon').append("<strong>Vendedor&nbsp;: </strong>" + nomVendedor + "<br>");
                $('#data-weon').append("<strong>Fecha: </strong>" + time + "<br>");

                $('#marca').html("");
                $('#marca').append(nomMarcas);
                $('#compania').html("");
                $('#compania').append(nomCompanias);
                $('#cantidad').html("");
                $('#cantidad').html("");
                $('#cantidad').append(txtCantidad);
                $('#presi').html("");
                $('#presi').append('$' + (valorMarca + valorCompañia) + '.-');
                $('#preci').html("");
                $('#preci').append('$' + (valorCIF) + '.-');
                $('#pretosi').html("");
                $('#pretosi').append('$' + ((valorMarca + valorCompañia) * txtCantidad) + '.-');
                $('#pretoci').html("");
                $('#pretoci').append('$' + (valorTCIF) + '.-');

                $('#respuesta').show("slow");


            }
        });
        $('.cancelar').click(function () {
            $('#respuesta').hide("slow");
        });
    
        
        /*$('#calcularPrecio').click(function () {
         Materialize.toast('I am a toast!', 4000, "red");
         
         });*/

    });

</script>