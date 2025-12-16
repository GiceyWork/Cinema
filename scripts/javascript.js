$(document).ready(function() {


let main_block=$('.block-films')

$.ajax({
  url: 'functions/all_films.php',
  method: 'GET',
  dataType: 'json',
  success: function(data) {
    main_block.empty
    data.forEach(item => {
        main_block.append('<div class="film"><div class="film-photo"><img src="'+item.photo_path+'" alt=""></div><div class="d-flex  align-items-start"><p class="film-text">'+item.title+'</p><p class="film-text">'+item.price+'</p></div><div class="d-flex  align-items-start"><p class="film-text">'+item.duration_minute+' минут</p><p class="film-text d-flex gap-1 align-items-center"><i class="fi d-flex align-items-center fi-rr-star"></i>'+item.rating+'</p></div><div class="d-flex  align-items-start"><p class="film-text">'+item.release_date+'</p><button onclick=SelectSeans('+item.id+') type="button" class="film-buy">Забронировать</button></div></div>')
    });
  }
});



  



});

	$(document).keydown(function(e) {
		if (e.keyCode === 27) {
			e.stopPropagation();
			$('.modal-seans-fade').fadeOut();
		}
	});
	
	$('.modal-seans-fade').click(function(e) {
		if ($(e.target).closest('.modal-seans').length == 0) {
			$(this).fadeOut();					
		}
	});	

function SelectSeans(film_id){
  $('.modal-seans-fade').fadeIn();
console.log(film_id)
$.ajax({
    url: 'functions/seans_find.php',
    method: 'POST',
    data: { film_id: film_id },
    dataType: 'json',
    success: function(data) {
      $('.block-seanses').empty()
      data.forEach(item => {
        $('.block-seanses').append(`
          <div>`+item.id+`</div>
          `)
      })
    }
})};
