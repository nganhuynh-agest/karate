Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def leavePage = locator('orangeHRM','leavepage')

  Scenario:

    #- User is logged in and has approval rights
    * driver appData.url
    * call orangeHRM.login

    # 1. Navigate to the Leave module
    * click(leavePage.leaveSidebar)

    # 2. Click "Leave List"
    * click(leavePage.leaveListMenu)

    # 3. Select Date from first day of current month to last day of current month

    * def getMonthDay =
    """
    function(firstOrLast) {
      var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
      var sdf = new SimpleDateFormat('yyyy-dd-MM');
      var Calendar = Java.type('java.util.Calendar');
      var cal = Calendar.getInstance();

      if (firstOrLast == 'first') {
        cal.set(Calendar.DAY_OF_MONTH, 1); // Ngày đầu tiên của tháng
      } else
      {
        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));// Ngày cuối cùng của tháng
      }
      return sdf.format(cal.getTime());
    }
    """
    * def firstDay = getMonthDay ('first')
    * def lastDay = getMonthDay ('last')

    * print 'First day of the month:', firstDay
    * print 'Last day of the month:', lastDay

    * value(leavePage.fromDateTextbox) == ""

    * delay(5000)
    * mouse().move(leavePage.fromDateTextbox)
    * input(leavePage.fromDateTextbox,firstDay)
    * delay(4000)


#    * clear(leavePage.toDateTextbox)
#    * delay(3000)
#    * input(leavePage.toDateTextbox,lastDay)
#    * delay(4000)

#    * scroll(leavePage.fromDateTextbox).input(firstDay)
#    * delay(5000)
#    * scroll(leavePage.toDateTextbox).input(lastDay)
#    * delay(5000)



    # 4. Select "Show Leave with Status" all options

    # 4. Click "Search"




















