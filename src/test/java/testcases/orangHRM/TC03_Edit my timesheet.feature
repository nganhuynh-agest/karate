Feature: demo login

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data ('orangeHRM','webData')
    * def dataD = data ('orangeHRM','dashboard')
    * def dashBoard = locator ('orangeHRM','dashboard')
    * def timePage = locator('orangeHRM','timepage')
    * def addTimesheet = locator('orangeHRM','timepage')
    * def editTimesheet = data('orangeHRM','edittimesheet')

  Scenario:
    # Navigate orangeHRM
    * driver appData.url
    # Input username and password
    * call orangeHRM.login
    #Verify user is redirected to the OrangeHRM dashboard
    *  waitFor(dashBoard.dashboardText)

    # User is logged in and has access to the Time module
    # 1. Navigate to the Time module
    * click(timePage.timeSidebar)
    * waitFor(addTimesheet.timetextModule)

    # 2. Click "Timesheet" -> "My Timesheet"
    * click(timePage.timesheetsMenu)
    * click(timePage.myTimesheetsDropd)

    # 3. (If there is no record yet, click ""Create Timesheet"") Choose Current Week, Then Click Edit button"
    * click(timePage.editButton)

    # 4. Select Project then Activity
    * call orangeHRM.editmytimesheet

    # 5. Add time entries for each day


    # 6. Click "Save"













