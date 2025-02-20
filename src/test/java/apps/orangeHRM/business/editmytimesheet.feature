@ignore
Feature:

  @AddTimeSheet
  Scenario: Add time sheet
    * print 'DEFAULT: Edit my time sheet'
    * clear(addTimesheet.projectTextbox)
    * delay(3000)
    * input(addTimesheet.projectTextbox, editTimesheet.editTimesheet.project)
    * delay(4000)
    * mouse().move(addTimesheet.projectSelect).click()
    * mouse().move(addTimesheet.activityTextbox).click()
    * scroll(addTimesheet.activitySelect)
    * mouse().move(addTimesheet.activitySelect).click()
    * delay(5000)
    # Add time entries for each day
#    * mouse().move(addTimesheet.monDay).click()
#    * def addTimeEntries  = locateAll(addTimesheet.dayTime)
#    * input(addTimeEntries,addTime.addTime.daytime)







