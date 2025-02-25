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
    * waitFor(pimPage.pimText)

    # 2. Click on "Add Employee"
    * click(pimPage.addEmployeeMenu)
    * waitFor(pimPage.addEmployeeText)

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

    # Verify file on dialog is selected
    * def dialogOpen = robot.windowOptional('Open').locate('//combobox{File name:}').value
    * match dialogOpen != null


    # 7. Click "Open"
    * robot {highligh: true}
    * robot.root.locate("//window{Open}")
    * robot.input(Key.ENTER)
    * delay(3000)


    * value(pimPage.employeeIDTextbox,"")
    * delay(3000)
    * input(pimPage.employeeIDTextbox, "005411")

    # 8. Click "Save" button
    * click(pimPage.saveButton)
    * delay(4000)

    * waitFor(pimPage.successText)
    * match exists(pimPage.successText) == true

    * def employeeText = 'Employee has been saved'
    * def successText = pimPage.successText.textContent
    * match successText == employeeText








