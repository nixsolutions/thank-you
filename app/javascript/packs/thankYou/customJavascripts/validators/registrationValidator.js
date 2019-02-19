document.addEventListener('DOMContentLoaded', () => {
  $('#register_form').form({
    fields: {
      email: {
        identifier  : 'user[email]',
        rules: [
          {
            type   : 'email',
            prompt : 'Please enter a valid Email.'
          }
        ]
      },
      password: {
        identifier  : 'user[password]',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a Password.'
          },
          {
            type   : 'minLength[6]',
            prompt : 'Password should be minimum 6 characters long.'
          }
        ]
      },
      password_confirmation: {
        identifier  : 'user[password_confirmation]',
        rules: [
          {
            type   : 'empty',
            prompt : 'Please enter a Password Confirmation.'
          },
          {
            type   : `match[user[password]]`,
            prompt : 'Password Confirmation doesn\'t match Password.'
          }
        ]
      }
    }
  });
  document.getElementsByClassName('sign-up')[0].addEventListener('click', () => {
    const serverErrors = document.getElementsByClassName('servers-errors')[0];
    if (serverErrors) {
      serverErrors.classList.add('hidden');
    }
  });
});