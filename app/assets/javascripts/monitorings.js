$('.collapsible > li').click(function () {
    var id = $(this).data('id');
    var preloader = '#preloader-' + id;

    if($('#text-' + id).is(':empty')){
        $.ajax({
            url: 'info/'+ id +'.json',
            context: this,
            beforeSend: function(){
                $(preloader).show();
            },
            success: function(data){
                $('#text-' + id).text(data.text);
                try{
                    $('#image-' + id).attr('src', data.image.url);
                    $('#avatar-' + id).attr('src', data.author.avatar);
                }catch(e){
                    console.log("ERROR: "+ e);
                }
            }
        }).done(function() {
            $(preloader).hide();
        });
    }
});
