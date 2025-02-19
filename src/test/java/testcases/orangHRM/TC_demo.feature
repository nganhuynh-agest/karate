Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def dataD = data('orangeHRM','dashboard')
    * def dashBoard = locator('orangeHRM','dashboard')


  Scenario:
    * driver appData.url
    # 2. Input username and password

    * call orangeHRM.login

    # 3. Verify user is redirected to the OrangeHRM dashboard
    * waitFor(dashBoard.dashboardText)
    * match exists(dashBoard.dashboardText) == true

