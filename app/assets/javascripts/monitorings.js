$('.collapsible > li').click(function () {
    var id = $(this).data('id');
    var preloader = '#preloader-' + id;

    $(preloader).show();

    $.getJSON('info/'+ id +'.json', function(data) {
        $('#text-' + id).text(data.text);
        try{
            $('#image-' + id).attr('src', data.image.url);
            $('#avatar-' + id).attr('src', data.author.avatar);
        }catch(e){
            console.log("ERROR: "+ e);
        }
    });

    setTimeout(function() {
        $(preloader).hide();
    }, 4000);
});
