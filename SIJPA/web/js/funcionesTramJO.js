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
                console.log("Respuesta del servidor Tramite: ", response);
                alert("Guardado con exito!!!");
                if (response !== null && $.isArray(response)) {
                    if(response[0] === "null"){//No traemos posicion entonces agregamos la fila a la tabla
                        //Si no tare posicion significa que esta volando y se resta de adol por asignar estatus
                        buscaYremplaza(response[1], 3);//mandamos el nombre de procesado y la bandera nueva
                        
                        parent.$('#tablaTramiteJO tbody').append('<tr id="' + response[1].replace("/", "") + '"><td>' + response[1] + '</td>\n\
                            <td>' + response[2] + '</td><td>' + response[3] + '</td><td>' + response[4] + '</td>\n\
                            <td><a class="pop" href="tramiteJO.jsp?proceClave=' + response[1] + '&posicion=' + parent.$('#tablaTramiteJO tbody tr').length +
                            '&edita=Si"><img src="img/editar.png" title="Modificar"/></a></td></tr>');
                    }else{
                        for (var i = 2; i <= 4; i++) {//pone filas correspondientes en la tabla de inicial
                            parent.$('#tablaTramiteJO tbody').find('tr').eq(response[0]).children('td').eq(i-1).html(response[i]);
                        }
                        //editamos enlance para que pueda ser actualizado ya estando lleno
                        var enlace = parent.$('#tablaTramiteJO tbody tr').eq(response[0]).find('a').attr('href') + '&edita=Si';
                        parent.$('#tablaTramiteJO tbody tr').eq(response[0]).find('a').attr('href',enlace);
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
 
    });
