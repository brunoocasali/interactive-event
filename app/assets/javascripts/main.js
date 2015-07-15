/**
 * Created by bruno on 25/04/15.
 */

$(document).ready(function() {
    $('select').material_select();
});

$('.datepicker').pickadate({
    labelMonthNext: 'Próximo mês',
    labelMonthPrev: 'Mês anterior',
    labelMonthSelect: 'Selecione um mês',
    labelYearSelect: 'Selecione um ano',
    monthsFull: [ 'Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro' ],
    monthsShort: [ 'Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez' ],
    weekdaysFull: [ 'Domingo', 'Segunda-Feira', 'Terça-Feira', 'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sábado' ],
    weekdaysShort: [ 'Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb' ],
    weekdaysLetter: [ 'D', 'S', 'T', 'Q', 'Q', 'S', 'S' ],
    today: 'Hoje',
    clear: 'Apagar',
    close: 'Fechar'
});

$('.dropdown-button').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false, // Does not change width of dropdown to that of the activator
        hover: false, // Activate on hover
        gutter: -50, // Spacing from edge
        belowOrigin: true // Displays dropdown below the button
    }
);

$('.profile-dropdown').dropdown({
        inDuration: 300,
        outDuration: 225,
        constrain_width: false,
        hover: false,
        gutter: 0,
        belowOrigin: true
    }
);
