$(document).ready(function() {

let main_block=$('.block-films')

$.ajax({
  url: 'functions/all_films.php',
  method: 'GET',
  dataType: 'json',
  success: function(data) {
    main_block.empty
    data.forEach(item => {
        main_block.append('<div class="film"><div class="film-photo"><img src="'+item.photo_path+'" alt=""></div><div class="d-flex w-100 gap-4 align-items-start"><p class="film-text">'+item.title+'</p><p class="film-text">'+item.price+'</p></div><div class="d-flex w-100 gap-4 align-items-start"><p class="film-text">'+item.duration_minute+' минут</p><p class="film-text d-flex gap-1 align-items-center"><i class="fi d-flex align-items-center fi-rr-star"></i>'+item.rating+'</p></div><div class="d-flex w-100 gap-4 align-items-start"><p class="film-text">'+item.release_date+'</p><button type="button" class="film-buy">Забронировать</button></div></div>')
    });
  }
});

});