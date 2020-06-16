/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    /*---------------------------- FUNCIONES TRAMITE JC----------------------------*/
    //Se usa para la recuperacion de BD
    if($('#eProcesal').val() === '1'){
        $('#dEstInvesti').show();
        $('#estIntermedia,#especifique').val('-2');
    }else if($('#eProcesal').val() === '2'){
        $('#dEstIntermedia').show();
         $('#estInvesti,#especifique').val('-2');
    }
    
    //Se usa para la recuperacion de BD
    if($('#estInvesti').val() === '6'){
        $('#dEspecifique').show();
    }
    
    //Se usa para la recuperacion de datos mostrar el campo de estados y municipios
    if($('#uActo').val() === '1899-09-09'){
        $('#uActo').prop("readonly", true);
        $('#chkUActo').prop("checked", true);
    }
    
    $('#eProcesal').change(function (){
        if ($('#eProcesal').val() === '1') {
            $('#dEstInvesti').fadeIn("slow");
            $('#estInvesti').val('').prop("required", true);
            $('#dEstIntermedia,#dEspecifique').hide();
            $('#estIntermedia,#especifique').val('-2').prop("required", false);
        } else if ($('#eProcesal').val() === '2') {
            $('#dEstIntermedia').fadeIn("slow");
            $('#estIntermedia').val('').prop("required", true);
            $('#dEstInvesti,#dEspecifique').hide();
            $('#estInvesti,#especifique').val('-2').prop("required", false);
        } else {
            $('#dEstInvesti,#dEstIntermedia,#dEspecifique').fadeOut("slow");
            $('#estInvesti,#estIntermedia,#especifique').val('-2').prop("required", false);
        }
    });
    
    $('#estInvesti').change(function (){
        if ($('#estInvesti').val() === '6' || $('#estIntermedia').val() === '4') {
            $('#dEspecifique').fadeIn('slow');
            $('#especifique').val('').prop("required", true);
        } else {
            $('#dEspecifique').fadeOut('slow');
            $('#especifique').val('-2').prop("required", false);
        }
    });
    
    //Guarda Tramite
    $('#formTramite').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtTramite',
            data: $('#formTramite').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Tramite: ", response);
                alert("Guardado con éxito!!!");
                if (response !== null && $.isArray(response)) {
                    if(response[0] === "null"){//No traemos posicion entonces agregamos la fila a la tabla
                        //Si no tare posicion significa que esta volando y se resta de adol por asignar estatus
                        buscaYremplaza(response[1], 3);//mandamos el nombre de procesado y la bandera nueva
                        parent.$('#tablaTramite tbody').append('<tr id="' + response[1].replace("/", "") + '"><td>' + response[1] + '</td>\n\
                            <td>' + response[2] + '</td><td>' + response[3] + '</td><td>' + response[4] + '</td>\n\
                            <td><a class="pop" href="tramite.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaTramite tbody tr').length +
                            '&edita=Si"><img src="img/editar.png" title="Modificar"/></a></td></tr>');
                        if(parent.$('#tablaConclu tbody tr').length === 0){
                            parent.$('#btn7').prop('disabled', true);
                        }
                        if(parent.$('#tablaTramite tbody tr').length === 0){
                            parent.$('#btn8').prop('disabled', true);
                        }
                    }else{
                        for (var i = 2; i <= 4; i++) {//pone filas correspondientes en la tabla de inicial
                            parent.$('#tablaTramite tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaTramite tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaTramite tbody tr').eq(response[0]).find('a').attr('href',enlace);
                    }
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Tramite: ", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
    /*---------------------------- FIN FUNCIONES TRAMITE JC----------------------------*/
});
