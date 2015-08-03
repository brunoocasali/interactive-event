$('.collapsible > li').click(function () {
    var id = $(this).data('id');
    $.getJSON('info/'+ id +'.json', function(data) {
        $('#text-' + id).text(data['text']);
        $('#image-' + id).attr('src', data['image']['url']);
        $('#avatar-' + id).attr('src', data['avatar']['url']);
        console.log(data['image']['url']);
        console.log(data['image']);
    });
});
