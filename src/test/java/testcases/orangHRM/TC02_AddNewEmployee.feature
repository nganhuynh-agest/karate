Feature: demo login

  Background:
    * startConfig("chrome_local")
    * def loginpage = locator('orangeHRM','loginpage')
    * def userData = data('orangeHRM','users')
    * def appData = data ('orangeHRM','webData')
    * def dataD = data ('orangeHRM','dashboard')
    * def dashBoard = locator ('orangeHRM','dashboard')
    * def pimPage = locator('orangeHRM','pimpage')
    * def addEmployee = locator('orangeHRM','pimpage')
    * def userEmp = data('orangeHRM','addemployee')

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
    * delay(3000)

    # Verify file upload dialog opens
    * robot {highligh: true}
    * robot.root.locate("//window{Open}")
    * match robot.windowExists('Open') == true

    # 6. Select a valid image file (e.g., .jpg, .png)
    * robot {highligh: true}
    * robot.root.locate("//window{Open}")
    * robot.input('C:\\Users\\ngan.huynh\\Desktop\\avatardemo.png')

    # 7. Click "Open"
    # 8. Click "Save" button
    * robot {highligh: true}
    * robot.root.locate("//window{Open}")
    * robot.input(Key.ENTER)
    * delay(3000)






