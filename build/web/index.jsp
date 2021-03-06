<%-- 
    Document   : index
    Created on : 03-may-2019, 18:54:14
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery.dataTables.min.css" rel="stylesheet" type="text/css" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">

        <title>Control de Riego</title>
    </head>
    <body>
        <div class="container">
            <div id="toggleRiego">
                <input id='swtPrueba' type='checkbox' checked data-toggle='toggle' data-width='100' data-height='75' data-onstyle='info'>
            </div>
            <div id="eventoReigo"></div>
        </div>
    </body>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/sweetalert.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
    <script>

        $(document).ready(function () {
            setearToggle();
        });

        function setearToggle() {
            $.ajax({
                url: './ThingSpeakResponseServlet',
                type: "POST",
                success: function (datos) {
                    console.log(datos);
                    if (datos == 1) {
                        //document.getElementById("toggleRiego").innerHTML = ("<input id='swtPrueba' type='checkbox' data-toggle='toggle' data-width='100' data-height='75' data-onstyle='info'>");
                        //$("#toggleRiego").html('<input id="swtPrueba" type="checkbox" data-toggle="toggle" data-width="100" data-height="75" data-onstyle="info" >');
                        $("#swtPrueba").bootstrapToggle('off');
                        $('#eventoReigo').html('Estado: Encendido');
                    } else {
                        //document.getElementById("toggleRiego").innerHTML = ("<input id='swtPrueba' type='checkbox' checked data-toggle='toggle' data-width='100' data-height='75' data-onstyle='info'>");
                        //$("#toggleRiego").html('<input id="swtPrueba" type="checkbox"  data-toggle="toggle" data-width="100" data-height="75" data-onstyle="info" >');
                        $("#swtPrueba").bootstrapToggle('on');
                        $('#eventoReigo').html('Estado: Apagado');
                    }

                }
            });
        }


        

        $(function () {
            $('#swtPrueba').change(function () {
                var estado = $(this).prop('checked');
                if (estado) {
                    $.ajax({
                        url: './MqttRequestResponseServlet',
                        type: "POST",
                        data: {
                            estado: estado
                        },
                        success: function (datos) {
                            if (datos) {
                                $('#eventoReigo').html('Estado: Apagado');
                            }
                        }
                    });
                } else {
                    $.ajax({
                        url: './MqttRequestResponseServlet',
                        type: "POST",
                        data: {
                            estado: estado
                        },
                        success: function (datos) {
                            if (datos) {

                                $('#eventoReigo').html('Estado: Encendido');
                            }

                        }
                    });

                }
            });
        });
    </script>

</html>
