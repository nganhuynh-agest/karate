Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def dataD = data('orangeHRM','dashboard')
    * def dashBoard = locator('orangeHRM','dashboard')
    * def performancePage = locator('orangeHRM','performancepage')
    * def addPerformance = data('orangeHRM','addperformance')

  Scenario:
    #  User is logged in and has access to the Performance module
    * driver appData.url
    * call orangeHRM.login

    # 1. Navigate to the Performance module
    * click(performancePage.performanceSidebar)

    # 2. Click "Add Performance Review"
    * click(performancePage.manageMenu)
    * click(performancePage.manageList)
    * click(performancePage.addButton)

#    # 3. Select the employee
#    * def username = text(performancePage.userLogin)
#    * def first4Chars = username.substring(0.4)
#
#    # Gõ tên vào ô input để gợi ý và click option name
#    * mouse().move(performancePage.employeeNameTextbox).click()
#    * input(performancePage.employeeNameTextbox,first4Chars)
#    * delay(4000)
#    * mouse().move(performancePage.optionName).click()
#    * delay(3000)
#
#    # 4. Input supervisor reviewer: karate demo
#    * mouse().move(performancePage.supervisorTextbox).click()
#    * input(performancePage.supervisorTextbox,addPerformance.inputSupervisor.supervisortextbox)
#    * delay(4000)

    # 5.1 Select the review period start date
    * mouse().move(performancePage.startDateTextbox).click()
    * click(performancePage.yearSelect)
    * click(format(performancePage.yearValue,"2025"))
    * click(performancePage.monthSelect)
    * click(format(performancePage.monthValue,"February"))
    * click(format(performancePage.dayValue,"1"))
    * delay(10000)

    # 5.2 Select the review period end date
    * scroll(performancePage.endDateTextbox).click()
    * mouse().move(performancePage.endDateTextbox)
#    * delay(3000)
#    * click(performancePage.endDateTextbox)
#    * delay(5000)
#    * click(performancePage.yearSelect)
#    * click(format(performancePage.yearValue,"2025"))
#    * delay(3000)
#    * click(format(performancePage.monthValue,"February"))
#    * click(performancePage.monthSelect)
#    * delay(3000)
#    * click(format(performancePage.dayValue,"28"))
#    * delay(5000)


    # 6. Select Due Date
#    * scroll(performancePage.dueDateTextbox)
#    * mouse().move(performancePage.dueDateTextbox).click()
#    * click(performancePage.dueDateTextbox)
#    * click(performancePage.yearSelect)
#    * click(format(performancePage.yearValue,"2025"))
#    * delay(3000)
#    * click(format(performancePage.monthValue,"March"))
#    * click(performancePage.monthSelect)
#    * delay(3000)
#    * click(format(performancePage.dayValue,"10"))
#    * delay(5000)

    # 7. Click "Save"








