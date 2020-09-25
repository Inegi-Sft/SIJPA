/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    $('#sisRepor').change(function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
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
    $('#formReportes').submit(function(e){
        e.preventDefault();
        e.stopImmediatePropagation();
        $('#descSistema').empty();
        $('#tblReportes tbody').empty();
        $.ajax({
            type: 'post',
            url: 'obtenReportes',
            data: $('#formReportes').serialize(),
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
            }
        });
    });
});
