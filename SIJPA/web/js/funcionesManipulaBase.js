/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    
    /*if($('#tipo_operacion').val() === 'importar'){
        $('#tipoArchivo').prepend("<option value='csv'>CSV(.csv)</option>");    
    }
    
    $('#tipo_operacion').change(function () {
        if($('#tipo_operacion').val() === 'importar'){
            $('#tipoArchivo').prepend("<option value='csv'>CSV(.csv)</option>"); 
          }
        else if($('#tipo_operacion').val() === 'ver'){
            $("#tipoArchivo").find("[value='csv']").remove();
        }
          
    });*/
   
   $('#form_import').submit(function(e){
       e.preventDefault();
       e.stopImmediatePropagation();
       $('.load').show();
       $.ajax({
           type:'post',
           url:'importaBD',
           //data:$('#form_import').serialize(),
            data: new FormData( this ),
            processData: false,
            contentType: false,
           success: function (response) {
                console.log("Respuesta del servidor ImportaBD: ", response);
                $('.load').fadeOut();
                if(response === '1'){
                    alert('Importado correctamente');
                }
                if(response === '0'){
                    alert('Error al importar, archivo incorrecto');
                }
                if(response === '2'){
                    window.location.href = "veArchivoSIJPA.jsp";
                }
                if(response === '3'){
                    alert('Error en el nombre del archivo, dicho nombre debe contener "ADOJC o ADOJO según sea el caso"');
                }
           },
           error: function (response) {
                console.log("Respuesta del servidor ImportaBD: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
       }); 
   });
});

