$(document).ready(function () {
    //Establece am pata input time y no marque error en el submit
    $('input[name="hrsJO"]').prop({'min': '0', 'max': '30', 'maxlength':'2'});
    $('input[name="minJO"]').prop({'min': '0', 'max': '59', 'maxlength':'2'});
    
    /*----------------Cabecera despliega cerrar cesion------------------------*/
    $('#usu img').click(function () {
        $('#usu #enlace').animate({
            right: "0",
            width: "toggle",
            opacity: "toggle"
        }, 800);
    });
    
    $(".load").fadeOut("slow");//proceso de carga para causas penales

    
    //auto acompletado para las causas penales
    $('#causaClaveJO').selectize({
        render: {
            option: function (data) {
                return '<div data-causajc="' + data.causajc + '">' + data.text + '</div>';
            }
        },
        onChange: function (value) {// Dehabilita el juez que atendio la audiencia en jc
            $('input[name="chkJuez"]').prop("disabled",false);
            $('input[name="chkJuez"]').prop("checked",false);
            var causaJC = this.getOption(value).data('causajc');
            
            $.ajax({
                type: 'post',
                url: 'obtenJuezJC',
                data: {causa_juzgado: causaJC},
                success: function (response) {
                    console.log("Respuesta del servidor Obten JuezJC: ", response);
                    $('input[name="chkJuez"][value='+response+']').prop("disabled",true);
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
        if ($('input[name="chkJuez"]:checked').length === 0) {
            alert('Selecciona al menos 1 Juez y maximo 3 Jueces');
            $('input[name="chkJuez"]').focus();
            return false;
        
        //valida que se seleccione por lo menos 1 audiencia
        } else if ($('input[name="chkJO"]:checked').length === 0) {
            alert('Selecciona al menos una Audiencia celebrada');
            $('#chkJO1').focus();
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
    
});

// habilita las audiencias de acuaerdo si el checkbox esta checkeado
function habilitaTxt(obj, idTxt1, hrs, min, chkNi1, chkNi2) {
    if (obj.checked) {
        $(idTxt1).prop({"required": true, "disabled": false});
        $(hrs).prop({"required": true, "disabled": false});
        $(min).prop({"required": true, "disabled": false});
        $(chkNi1).prop("disabled", false);
        $(chkNi2).prop("disabled", false);
    } else {
        $(idTxt1).prop({"required": false, "disabled": true, "readonly": false}).val("");
        $(hrs).prop({"required": false, "disabled": true, "readonly": false}).val("");
        $(min).prop({"required": false, "disabled": true, "readonly": false}).val("");
        $(chkNi1).prop({"disabled": true, "checked": false});
        $(chkNi2).prop({"disabled": true, "checked": false});
    }
}

//cuenta cuantos jueces se han seleccionado
function cuenta(obj) {
    if ($('input[name="chkJuez"]:checked').length > 3) {
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
//duracion no identificada
function duracionNI(obj, hrs, min) {
    if (obj.checked) {
        $(hrs).prop("readonly", true).val("99");
        $(min).prop("readonly", true).val("99");
    } else {
        $(hrs).prop("readonly", false).val("");
        $(min).prop("readonly", false).val("");
    }
}

//Elimina Audiencias
function deleteAudienciasJO(causa) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudienciasJO',
            data: {causaClaveJO: causa, operacion: 'eliminar'},
            success: function (response) {
                console.log("Respuesta del servidor al borrar: ", response);
                if (response === "AudienciasDeleted") {
                    alert("Audiencias de la Causa Penal: " + causa + " Eliminadas!!!"); 
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
