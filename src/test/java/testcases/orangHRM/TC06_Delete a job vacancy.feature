Feature: demo login

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data ('orangeHRM','webData')
    * def dataD = data ('orangeHRM','dashboard')
    * def dashBoard = locator ('orangeHRM','dashboard')
    * def recruitPage = locator('orangeHRM','recruitmentpage')
    * def addVacancy = data('orangeHRM','addvacancy')

  Scenario:
    # Navigate orangeHRM
    * driver appData.url
    # Input username and password
    * call orangeHRM.login
    # User is logged in and has access to the Recruitment module
    # 1. Navigate to the Recruitment module, go to Vacancies tab
    * click(recruitPage.recruitmentSidebar)
    * waitFor(recruitPage.recruitmentText)
    * click(recruitPage.vacanciesMenu)

    # 2. Select a job vacancy,
    * click(recruitPage.jobSelect)
    * delay(3000)

    # 3. click "Delete Selected"
    * click(recruitPage.deleteButton)
    # On pop up  Are you sure?, click yes, delete button
    * click(recruitPage.yesButton)
    * delay(3000)
    * match exists(recruitPage.deletedSuccessfullyText) == true



























