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
#
#    * def getMonthDay =
#    """
#    function(firstOrLast) {
#      var SimpleDateFormat = Java.type('java.text.SimpleDateFormat')
#      var sdf = new SimpleDateFormat('yyyy-dd-MM');
#      var Calendar = Java.type('java.util.Calendar');
#      var cal = Calendar.getInstance();
#
#      if (firstOrLast == 'first') {
#        cal.set(Calendar.DAY_OF_MONTH, 1); // Ngày đầu tiên của tháng
#      } else
#      {
#        cal.set(Calendar.DAY_OF_MONTH, cal.getActualMaximum(Calendar.DAY_OF_MONTH));// Ngày cuối cùng của tháng
#      }
#      return sdf.format(cal.getTime());
#    }
#    """
#    * def firstDay = getMonthDay ('first')
#    * def lastDay = getMonthDay ('last')
#
#    * print 'First day of the month:', firstDay
#    * print 'Last day of the month:', lastDay
#
#    * value(leavePage.fromDateTextbox) == ""
#    * delay(5000)
#    * mouse().move(leavePage.fromDateTextbox)
#    * input(leavePage.fromDateTextbox,firstDay)
#    * delay(4000)
#
#    * value(leavePage.fromDateTextbox) == ""
#    * delay(3000)
#    * mouse().move(leavePage.toDateTextbox)
#    * input(leavePage.toDateTextbox,lastDay)
#    * delay(4000)

    # Date from first day of current month
    * def yearValue = '2025'
    * def yearSelect = format("//li[normalize-space()='%s']", yearValue)
    * click(leavePage.fromDateTextbox)
    * click(leavePage.yearFromDateSelect)
    * click(yearSelect)
    * delay(3000)

    * def monthValue = 'February'
    * def monthSelect = format("//li[normalize-space()='%s']", monthValue)
    * click(leavePage.monthSelect)
    * click(monthSelect)
    * print monthSelect

    * def dayValue = '1'
    * def monthSelect = format("//div[normalize-space()='%s']", dayValue)
    * click(monthSelect)

    # Add last day of current month on to Date textbox

    * def yearValue = '2025'
    * def yearSelect = format("//li[normalize-space()='%s']", yearValue)
    * click(leavePage.toDateTextbox)
    * click(leavePage.yearFromDateSelect)
    * click(yearSelect)
    * delay(3000)

    * def monthValue = 'February'
    * def monthSelect = format("//li[normalize-space()='%s']", monthValue)
    * click(leavePage.monthSelect)
    * click(monthSelect)
    * print monthSelect

    * def dayValue = '28'
    * def monthSelect = format("//div[normalize-space()='%s']", dayValue)
    * click(monthSelect)
    * delay(5000)

    # 4. Select "Show Leave with Status" all options
  * call orangeHRM.showleaveselect

   # Verify all option displayed
  * match exists(format(leavePage.optionSelect,"Rejected ")) == true
  * match exists(format(leavePage.optionSelect,"Cancelled ")) == true
  * match exists(format(leavePage.optionSelect,"Pending Approval ")) == true
  * match exists(format(leavePage.optionSelect,"Scheduled ")) == true
  * match exists(format(leavePage.optionSelect,"Taken ")) == true
  * delay(5000)

  # 4. Click "Search"
  * click(leavePage.searchButton)
  # Verify records displayed correctly
  * match exists(leavePage.recordsDisplayed) == true





















