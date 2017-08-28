
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

        <title>Home - Venta Celulares</title>
    </head>
    <body>
        <div class="container">
            <h1 class="center red-text"><strong>Sistema de Venta Celulares</strong></h1>
            <div class=" card-panel" style="margin-top:10%;background: rgba(238, 238, 238, 0.5);">
                <div class="row">
                    <div class="col l12 center"><h1>Seleccione Opción</h1></div>  
                </div>
                <div class="row">
                    <div class="col l2 center"></div>  
                    <div class="col l8 center">
                        <div class="row">
                            <div class="col l6 center">
                                <a class="btn-large green waves-effect waves-light" href="ingresoVenta.jsp">Ingreso Venta</a>
                            </div>
                            <div class="col l6 center">
                                <a class="btn-large orange waves-effect waves-light " href="listadoVenta.jsp">Listado Venta</a>
                            </div>
                        </div>
                    </div>  
                    <div class="col l2 center"></div>  
                </div>

            </div>
        </div>
    </body>
</html>
