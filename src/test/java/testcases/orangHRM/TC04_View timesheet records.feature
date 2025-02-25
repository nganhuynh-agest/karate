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
    * def addDate = data('orangeHRM','date')


  Scenario:

    #- User is logged in and has approval rights
    * driver appData.url
    * call orangeHRM.login
#    * waitFor(dashBoard.dashboardText)

    # 1. Navigate to the Time module
    * click(timePage.timeSidebar)
    * waitFor(timePage.timetextModule)

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
    * def getDay =
      """
      function(dayOfWeek) {
        var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
        var sdf = new SimpleDateFormat('yyyy-MM-dd');
        var Calendar = Java.type('java.util.Calendar');
        var cal = Calendar.getInstance();

        cal.set(Calendar.WEEK_OF_YEAR, cal.get(Calendar.WEEK_OF_YEAR)); // Giữ nguyên tuần hiện tại
        cal.set(Calendar.DAY_OF_WEEK, dayOfWeek); // Đặt đúng thứ trong tuần
        return sdf.format(cal.getTime());
      }
      """
    * def monday = getDay(2)+ ''
    * def friday = getDay(6)+ ''


    * scroll(timePage.projectFrom).input(monday)
    * delay(5000)
    * scroll(timePage.projectTo).input(friday)
    * delay(5000)

    # 4. Click "View" - Records displayed correctly
    * click(timePage.viewButton)
    * delay(5000)
    * match exists(timePage.recordText) == true




