Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def dataD = data('orangeHRM','dashboard')
    * def dashBoard = locator ('orangeHRM','dashboard')
    * def appData = data('orangeHRM','webData')
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
    # Lấy tên user từ góc phải trên cùng
    * def username = text(timePage.userLogin)
    * def first4Chars = username.substring(0, 4)

    # Gõ tên vào ô input để gợi ý và click option name
    * mouse().move(timePage.employeeNameTextbox).click()
    * input(timePage.employeeNameTextbox,first4Chars)
    * delay(4000)
    * mouse().move(timePage.optionName).click()

    # Chọn Date
#    * def currentDate = getCurrentDate()
    * mouse().move(timePage.projectFrom).click()

    * def getMonday =
      """
      function() {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat('yyyy-dd-MM');
        var Calendar = Java.type('java.util.Calendar');
        var cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
        return sdf.format(cal.getTime());
      }
      """
    * def monday = getMonday()
    * print 'Monday selected:', monday

    * input(timePage.projectFrom, monday)





  # 4. Click "View"




