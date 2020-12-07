document.addEventListener('turbolinks:load', function () {
  if (document.getElementById('clock')) {
    let endTime = document.getElementById('hidden-time').textContent;
    initializeClock('clock', endTime);
  }

  // calculate remaining time
  function getTimeRemaining(endTime) {
    let t = endTime - Date.parse(new Date());
    let minutes = Math.floor((t / 1000 / 60) ); // Minute count without hours, e.t.  '120 min' displayed in three digits
    let seconds = Math.floor((t / 1000) % 60);
    return {
      'total': t,
      'minutes': minutes,
      'seconds': seconds
    };
  }

  // setup  clock inside view
  function initializeClock(id, endTime) {

    let clock = document.getElementById(id),
      minutes = clock.querySelector('.minutes'),
      seconds = clock.querySelector('.seconds'),
      timeInterval = setInterval(updateClock, 1000);

    // hide clock and show Alert if time is over
    function infoBlock() {
      clock.classList.add('hide')
      document.getElementById('time-over').classList.remove('hide')
    }

    function updateClock() {
      let t = getTimeRemaining(endTime);

      // check if time is over
      if (t.total <= 0) {
        clearInterval(timeInterval);
        infoBlock();
        // redirect to result page
        setTimeout(function () {
          window.location.href = window.location.pathname + "/result";
        }, 2000);
      }

      // show "00" in empty cell
      if ((String(t.minutes).length) <= 1) {
        minutes.textContent = ('0' + t.minutes);
      } else {
        minutes.textContent = t.minutes;
      }

      if ((String(t.seconds).length) <= 1) {
        seconds.textContent = ('0' + t.seconds);
      } else {
        seconds.textContent = t.seconds;
      }
    }
  }
});

