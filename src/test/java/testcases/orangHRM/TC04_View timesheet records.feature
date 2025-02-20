Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def dataD = data('orangeHRM','dashboard')
    * def dashBoard = locator('orangeHRM','dashboard')
    * def timePage = locator('orangeHRM','timepage')
    * def addTimesheet = locator('orangeHRM','timepage')


  Scenario:
    * driver appData.url
    # Input username and password
    * call orangeHRM.login
    # Verify user is redirected to the OrangeHRM dashboard
    * waitFor(dashBoard.dashboardText)

    #- User is logged in and has approval rights
    # 1. Navigate to the Time module
    * click(timePage.timeSidebar)
    * waitFor(addTimesheet.timetextModule)
    # 2. Click "Reports" -> "Employee Reports"
    * click(timePage.reportButton)
    * delay(3000)
    * click(timePage.empReportButton)
    # 3. Enter input for Employee Name and Date
    # 4. Click "View"




