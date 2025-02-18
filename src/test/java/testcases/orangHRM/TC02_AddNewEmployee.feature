Feature: demo login

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data ('orangeHRM','webData')
    * def dataD = data ('orangeHRM','dashboard')
    * def dashBoard = locator ('orangeHRM','dashboard')
    * def pimPage = locator ('orangeHRM','pimpage')
    * def addEmployee = locator('orangeHRM','pimpage')
    * def userEmp = data('orangeHRM','addemployee')
#    * def filePath = locator('orangeHRM','image')
    * def filePath = java.lang.System.getProperty('user.dir') + '/files/avatardemo.png'



  Scenario:
    # Navigate orangeHRM
    * driver appData.url
    # Input username and password
    * call orangeHRM.login
    #Verify user is redirected to the OrangeHRM dashboard
    *  waitFor(dashBoard.dashboardText)

    # 1. Click on the "PIM" tab
    * click(dashBoard.pimSidebar)

    # 2. Click on "Add Employee"
    * click(pimPage.addEmployeeMenu)

    # 3. Enter a valid First Name and Last Name (e.g., John/Doe)
    # 5. Select the "Browse" button for the "Profile Picture" field
    * call orangeHRM.addnewemployee
    * delay(5000000)
#
#    # 6. Select a valid image file (e.g., .jpg, .png)
#    * waitFor("//input[@type='file']")
#    * input("//input[@type='file']", filePath)
#    * waitFor("2")
#    * click("//button[@type='submit']")


    # 7. Click "Open"
    # 8. Click "Save" button





