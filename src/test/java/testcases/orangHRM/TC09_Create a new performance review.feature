Feature:
  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data('orangeHRM','webData')
    * def dataD = data('orangeHRM','dashboard')
    * def dashBoard = locator('orangeHRM','dashboard')
    * def performancePage = locator('orangeHRM','performancepage')


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

    # 3. Select the employee
    * def username = text(performancePage.userLogin)
    * def first4Chars = username.substring(0.4)

    # Gõ tên vào ô input để gợi ý và click option name
    * mouse().move(performancePage.employeeNameTextbox).click()
    * input(performancePage.employeeNameTextbox,first4Chars)
    * delay(4000)
    * mouse().move(performancePage.optionName).click()
    * delay(5000)

    # 4. Select the review period
    #*input(performancePage., s1)

    # 5. Select Due Date

    # 6. Click "Save"







