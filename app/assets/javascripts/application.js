//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

function startTimer(duration, display) {
  var timer = duration, minutes, seconds;
  var iteration = 0;
  setInterval(function () {
    minutes = parseInt(timer / 60, 10)
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    display.text(minutes + ":" + seconds);

    if (--timer < 0) {
      console.log('restart');
      if (iteration == 1) {
        $( "#results-form" ).submit();
        console.log('finished');
      }
      $('#player-two').removeClass('hidden');
      $('#player-one').addClass('hidden');

      iteration ++;
      timer = duration;
    }

  }, 1000);
}

$( document ).ready(function() {
  // change time back to 2 minutes later
  var fiveMinutes = 60 * 0.1,
  display = $('#time');
  startTimer(fiveMinutes, display);
});

$(".alert" ).fadeOut(3000);