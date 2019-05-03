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

        <title>Control de Riego</title>
    </head>
    <body>
        <div class="container">
            <input id="swtPrueba" type="checkbox" checked data-toggle="toggle" data-width="100" data-height="75" data-onstyle="info">
            <div id="eventoReigo"></div>
        </div>
    </body>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/sweetalert.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $('#swtPrueba').change(function () {
                if(!$(this).prop('checked')){
                    $('#eventoReigo').html('Estado: Encendido');
                }else{
                    $('#eventoReigo').html('Estado: Apagado');
                }
                
            });
        });
    </script>
</html>
