@ignore
Feature: Add New Employee

  @AddNewEmployee
  Scenario: Add new employee
    * print 'DEFAULT: Add new employee to orangeHrm'
    * input(addEmployee.firstnameTextbox, userEmp.addEmployee.firstname)
    * input(addEmployee.lastnameTextbox, userEmp.addEmployee.lastname)
    * delay(1000)
    * mouse().move(".employee-image-wrapper + button").click()





