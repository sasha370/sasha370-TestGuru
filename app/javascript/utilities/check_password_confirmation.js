document.addEventListener('turbolinks:load', function () {
  // Get form block whit password
  form = document.querySelector('.need-validation')
  if (form) {
    var passwordField = this.querySelector('.password_field')
    var confirmationField = this.querySelector('.confirmation_field')

    // listen to an event in any field
    if (passwordField && confirmationField) {
      passwordField.addEventListener('input', validateFields)
      confirmationField.addEventListener('input', validateFields)
    }

    function validateFields() {
      var password = passwordField.value
      var confirmation = confirmationField.value

      if (confirmation === '') {
        // cleaUp field`s status if delete all chars
        confirmationField.classList.remove('is-invalid')
        confirmationField.classList.remove('is-valid')
        return
      }

      if (password !== confirmation) {
        confirmationField.classList.remove('is-valid')
        confirmationField.classList.add('is-invalid')
      } else {
        confirmationField.classList.remove('is-invalid')
        confirmationField.classList.add('is-valid')
      }
    }
  }
})
