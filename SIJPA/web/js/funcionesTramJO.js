/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 

$(document).ready(function() {
   
//Se usa para la recuperacion de BD
 // alert('Entro a balabla');
    if($('#estInvestiJO').val() === '4'){
        $('#dEspecifiqueJO').show();
    }
   
    if($('#uActoJO').val() === '1899-09-09'){
        $('#uActoJO').prop("readonly", true);
        $('#chkUActoJO').prop("checked", true);
    }


    $('#estInvestiJO').change(function (){
        if ($('#estInvestiJO').val() === '4') {
           $('#dEspecifiqueJO').show();
        }else
        {
         $('#dEspecifiqueJO').hide(); 
         $('#dEspecifiqueJO').val("-2");
        }
    });
    
     //Guarda Tramite
    $('#formTramiteJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        $.ajax({
            type: 'post',
            url: 'insrtTramiteJO',
            data: $('#formTramiteJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Tramite JO: ", response);
                alert("Guardado correctamente!!!");
                if (response !== null && $.isArray(response)) {
                    for (var i = 2; i < 5; i++) {//pone filas correspondientes en la tabla de inicial
                        console.log('Fila recibida: ' + response[0] + ', Columna: ' + i + ', Valor de la columna: ' + response[i]);
                        parent.$('#tablaTramiteJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                    } 
                    //editamos enlance para que pueda ser actualizado ya estando lleno
                    var enlace = parent.$('#tablaTramiteJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                    parent.$('#tablaTramiteJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
                }
                parent.$.fancybox.close();
            },
            error: function (response) {
                console.log("Respuesta del servidor Tramite: ", response);
                alert('Error al guardar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    });
 
    });
