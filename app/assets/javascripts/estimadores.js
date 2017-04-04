// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

if ( window.location.pathname == "/estimadores") {


    $("#datepicker").datepicker({
        format: "mm-yyyy",
        viewMode: "months",
        minViewMode: "months"
    });

    var nivel;

    $("#ciclo").change(function () {

        if (+$("#ciclo").val() != -1) {

            $("#nivel").attr('disabled', false);
            $("#nivel").select2('destroy').empty().select2({data: ciclos[+$("#ciclo").val() + 1].cursos});
            nivel = ciclos[+$("#ciclo").val() + 1].cursos;
        }
        else {
            $("#nivel").attr('disabled', 'disabled');

        }
        $("#grado").attr('disabled', 'disabled');

    });

    $("#nivel").change(function () {

        if (+$("#nivel").val() != -1) {
            $("#grado").attr('disabled', false);
            $("#grado").select2('destroy').empty().select2({data: nivel[+$("#nivel").val() + 1].grados});
        }
        else {

            $("#grado").attr('disabled', 'disabled');
        }

    });

    $("#grado").change(function () {


    });
    $(".js-example-basic-single").select2({
        placeholder: 'Select an option'
    });

    $("#ciclo").select2('destroy').empty().select2({data: ciclos});
    $("#nivel").attr('disabled', 'disabled');
    $("#grado").attr('disabled', 'disabled');


    $("#estimar").click(function () {

        window.location = "/estimadores/"+ $("#grado").val()
    })

}