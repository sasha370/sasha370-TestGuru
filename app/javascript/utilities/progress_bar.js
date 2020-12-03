document.addEventListener('turbolinks:load', function () {
  var progressBar = document.querySelector('.progress-bar-js')

  if (progressBar) {
    var percent = progressBar.dataset.percent
    progressBar.style.width = percent + '%'
  }
})
