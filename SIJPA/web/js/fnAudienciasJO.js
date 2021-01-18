$(document).ready(function () {
    
    //auto acompletado para las causas penales
    $('#causaJO').selectize({
        render: {
            option: function (data) {
                return '<div data-causajc="' + data.causajc + '">' + data.text + '</div>';
            }
        },
        onChange: function (value) {// Deshabilita el juez que atendio la audiencia en jc
            $('input[name="juezJO"]').prop("disabled",false);
            $('input[name="juezJO"]').prop("checked",false);
            var causaJC = this.getOption(value).data('causajc');
            
            $.ajax({
                type: 'post',
                url: 'obtenJuezJC',
                data: {causa_juzgado: causaJC},
                success: function (response) {
                    console.log("Respuesta del servidor Obten JuezJC: ", response);
                    if (response !== null && $.isArray(response)) {
                        
                        if(!causaJC.includes('-2&')){//cuando la cuasa es no especificada permite seleccionar cualquier juez
                            for (var i = 0; i < response.length; i++) {
                                console.log('juez: ' + response[i]);
                                $('input[name="juezJO"][value='+response[i]+']').prop("disabled",true);
                            }
                        }
                    }
                },
                error: function (response) {
                    console.log("Respuesta del servidor error Obten JuezJC: ", response);
                    alert('Error inesperado, vuelva a intentarlo o cunsulte al administrador');
                }
            });
        },
        onBlur: function () {
            this.clearCache();
        }
    });
    
    //Guarda Audiencias
    $('#formAudienciasJO').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        //valida que se seleccione por lo menos 1 juez
        if ($('input[name="juezJO"]:checked').length === 0) {
            alert('Selecciona al menos 1 Juez y maximo 3');
            $('input[name="juezJO"]').focus();
            return false;
        }
        
        $.ajax({
            type: 'post',
            url: 'insrtAudienciasJO',
            data: $('#formAudienciasJO').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Audiencias guardar: ", response);
                alert("Guardado correctamente!!!");
                window.location='audienciasJO.jsp';
            },
            error: function (response) {
                console.log("Respuesta del servidor Audiencias error: ", response);
                alert('Error al guardar, posible audiencia duplicada');
            }
        });
    });
    
    
    //bloque para data tables
    $('#tblAudiJO').DataTable({
        "lengthMenu": [[20, 50, 100, -1], [20, 50, 100, "Todo"]],
        "language": {
            "decimal": "",
            "emptyTable": "No hay registros",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ registros",
            "infoEmpty": "Mostrando 0 to 0 of 0 registros",
            "infoFiltered": "(Filtrado de _MAX_ total entradas)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ registros",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });
    
    
});


//cuenta cuantos jueces se han seleccionado
function cuenta(obj) {
    if ($('input[name="juezJO"]:checked').length > 3) {
        alert('Solo puedes seleccionar hasta 3 Jueces');
        $(obj).prop("checked", false);
    }
}

// Fechas No identificadas
function fechaNI(obj, idTxtDate) {
    if (obj.checked) {
        $(idTxtDate).prop("readonly", true).val("1899-09-09");
    } else {
        $(idTxtDate).prop("readonly", false).val("");
    }
}

//Elimina Audiencias
function deleteAudienciasJO(causa, idAudi) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudienciasJO',
            data: {
                causaJO: causa, 
                idAudiencia: idAudi, 
                operacion: 'eliminar'
            },
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                if (response === "AudienciasDeleted") {
                    alert("Audiencia Id: "+idAudi+" de la Causa Penal: " + causa + " Eliminada!!!"); 
                    location.reload();
                }
            },
            error: function (response) {
                console.log("Respuesta del servidor error al borrar: ", response);
                alert('Error al eliminar, vuelva a intentarlo o cunsulte al administrador');
            }
        });
    }
}

//valida la duracion de la audiencia
function duracion(fchIni, fchFin){
    var inicio = $(fchIni).val();
    var fin = $(fchFin).val();
    if(inicio!=='' && inicio!=='1899-09-09' && fin!=='' && fin!=='1899-09-09'){
        if(inicio > fin){
            alert("La fecha en que inicia esta audiencia, no puede ser mayor a la fecha en que finaliza");
            $(fchIni).val('');
            $(fchFin).val('');
            $(fchIni).focus();
        }
    }
}

function validaJuzAdd() {
    if ($("#juzgado").val() === "") {
        alertify.alert('Juzgado Clave sin seleccionar','Favor de seleccionar un Juzgado Clave para poder continuar con la captura');
        return false;
    } else {
        return true;
    }
}
