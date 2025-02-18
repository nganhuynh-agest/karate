@ignore
Feature:Login

  @Login
  Scenario: Login
    * print 'DEFAULT: login to orangeHrm'
    * input(loginpage.usernameTextbox, userData.validUser.username)
    * input(loginpage.passwordTextbox, userData.validUser.password)
    * click(loginpage.loginButton)