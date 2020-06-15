$(document).ready(function () {
 //Establece am pata input time y no marque error en el submit
    $('input[name="hrsInves"]').prop({'min': '0', 'max': '30', 'maxlength':'2'});
    $('input[name="minInves"]').prop({'min': '0', 'max': '59', 'maxlength':'2'});
    $('input[name="hrsInter"]').prop({'min': '0', 'max': '30', 'maxlength':'2'});
    $('input[name="minInter"]').prop({'min': '0', 'max': '59', 'maxlength':'2'});

    //auto acompletado para las causas penales
    $("#causaClave").selectize({
        onBlur: function () {
            this.clearCache();
        }
    });
    
    //Guarda Audiencias
    $('#formAudiencias').submit(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        
        //valida que se seleccione por lo menos 1 juez
        if ($('input[name="chkJuez"]:checked').length === 0) {
            alert('Selecciona al menos 1 Juez y maximo 3 Jueces');
            $('input[name="chkJuez"]').focus();
            return false;
        
        //valida que se seleccione por lo menos 1 audiencia
        } else if ($('input[name="chkInves"]:checked').length === 0 && $('input[name="chkInter"]:checked').length === 0) {
            alert('Selecciona al menos una Audiencia celebrada');
            $('#chkInves1').focus();
            return false;
        }
        
        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: $('#formAudiencias').serialize(),
            success: function (response) {
                console.log("Respuesta del servidor Audiencias guardar: ", response);
                alert("Guardado con exito!!!");
                window.location='audiencias.jsp';
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
//Comprueba que primero se haya seleccionado un juzgado clave antes de agregar audiencias
function validaAddAudiencias() {
    if ($("#juzgado").val() !== "") {
        window.location.href = "capturaAudiencias.jsp";
    } else {
        $(".msjAviso").fadeIn("slow");
    }
}

//Elimina Audiencias
function deleteAudiencias(causa) {
    var resp = confirm("Realmente deseas eliminar este resgistro?");
    if (resp) {
        $.ajax({
            type: 'post',
            url: 'insrtAudiencias',
            data: {causaClave: causa, operacion: 'eliminar'},
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


