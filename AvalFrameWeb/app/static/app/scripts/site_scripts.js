$(document).ready(function() {
    $('.datatable').DataTable({
        "ordering": false,
        "bLengthChange": false
    });
});

$(document).ready(function () {
    $("#sel1").change(function () {
        var tipo = $("#sel1 option:checked").val();
        if (tipo == "A") {
            $("#relatorioAprendizagens").show();
            $("#relatorioCompetencias").hide();
        }
        else {
            $("#relatorioAprendizagens").hide();
            $("#relatorioCompetencias").show();
        }
    })
})