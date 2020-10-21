/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {

    if ($('#tipo_operacion').val() === 'importar') {
        $('#tipoArchivo').prepend("<option value='csv'>CSV(.csv)</option>");
        $('#importaBD').val('Importar');
    }

    $('#tipo_operacion').change(function () {
        if ($('#tipo_operacion').val() === 'importar') {
            $('#tipoArchivo').prepend("<option value='csv'>CSV(.csv)</option>");
            $('#importaBD').val('Importar');
        } else if ($('#tipo_operacion').val() === 'ver') {
            $("#tipoArchivo").find("[value='csv']").remove();
            $('#importaBD').val('Ver');
        }

    });
    $('#tipoArchivo').change(function () {
        if ($('#tipoArchivo').val() === 'csv') {
            $('#EspecifiqueTabla').fadeIn();
        } else if ($('#tipo_operacion').val() !== 'csv') {
            $("#EspecifiqueTabla").fadeOut();
        }

    });


    $('#formImport').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        if ($('#tipoArchivo').val() === 'csv' && $('#tabla').val() === '') {
            alert('Seleccione una tabla');
            $('#tabla').focus();
            return false;
        }
        $('.load').show();
        $.ajax({
            type: 'post',
            url: 'importaBD',
            //data:$('#form_import').serialize(),
            data: new FormData(this),
            processData: false,
            contentType: false,
            success: function (response) {
                console.log("Respuesta del servidor ImportaBD: ", response);
                $('.load').fadeOut();
                if (response === '1') {
                    alert('Importado correctamente');
                }
                if (response === '0') {
                    alert('Error al importar, archivo incorrecto');
                }
                if (response === '2') {
                    window.location.href = "veArchivoSIJPA.jsp";
                }
                if (response === '3') {
                    alert('Error, las columnas del archivo no coinciden con los de las tablas');
                }
                if (response === '4') {
                    alert('Error, se trata de subir archivo CSV sin especificar tabla destino');
                }
                if (response === '5') {
                    alert('Error,los datos del csv no corresponden con el tipo de dato de las columnas');
                }
                if (response === '6') {
                    alert('Error, el archivo se encuentra estropeado o en blanco');
                }
                if (response === '7') {
                    alert('Error, el archivo subido no coincide con el tipo de archivo indicado');
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor ImportaBD: ", response);
                alert('Error al guardar, cunsulte al administrador!');
            }
        });
    });
});

