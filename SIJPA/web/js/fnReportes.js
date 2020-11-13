/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    //llenamos el campo del juzgado y de los años dependiendo del sistema
    $('#sisRepor').change(function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type : 'post',
            url : 'obtenReportes',
            dataType: 'html',
            data : {sisReporAnio : $(this).val()},
            success: function (response) {
                console.log("Respuesta obteniendo anios en reportes: ", response);
                $('#anioReporClave').html(response);
                $('#anioReporClave').prop('disabled', false);
            }
        });
        $.ajax({
            type : 'post',
            url : 'obtenReportes',
            dataType: 'html',
            data : {sisRepor : $(this).val()},
            success: function (response) {
                console.log("Respuesta obteniendo juzgados en reportes: ", response);
                $('#juzReporClave').html(response);
                $('#juzReporClave').prop('disabled', false);
            }
        });
    });
    
    //Generamos los reportes
    $('#generaRepor').click(function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        $('#descSistema').empty();
        $('#tblReportes tbody').empty();
        if($('#sisRepor').val() === ""){
            alert('Debes de seleccionar el Sistema para poder generar los reportes');
            $('#sisRepor').focus();
            return false;
        }else if($('#anioReporClave').val() === ""){
            alert('Debes de seleccionar el Anio para poder generar los reportes');
            $('#sisRepor').focus();
            return false;
        }
        $.ajax({
            type: 'post',
            url: 'obtenReportes',
            data: {
                sisRepor : $('#sisRepor').val(),
                anioReporClave : $('#anioReporClave').val(),
                juzReporClave : $('#juzReporClave').val()
            },
            success: function (response) {
                console.log("Respuesta del servidor Reportes: ", response);
                var sistem;
                if($('#sisRepor').val() === '1'){
                    sistem = 'Juzgado de Control';
                }else{
                    sistem = 'Juicio Oral';
                }
                $('#descSistema').append('Sistema: ' + sistem);
                $('#tblReportes tbody').append(response);
                $('#btnReporExcel').show();
            }
        });
    });
    
//    //Exportamos los reportes a excel
//    $('#btnReporExcel').click(function(e){
//        e.preventDefault();
//        e.stopImmediatePropagation();
//        var confirma = confirm('Seguro desea exportar los datos a Excel');
//        if(confirma){
//            $.ajax({
//                type: 'post',
//                contentType: "application/vnd.ms-excel",
//                url: 'exportaReportes',
//                data: $('#formReportes').serialize(),
//                success: function (response, status, xhr) {
//                    console.log("Respuesta del servidor exporta Reportes: ", response);
//                    console.log("type: ", xhr.getResponseHeader("Content-Type"));
//
//                }
//            });
//        }
//    });
});
