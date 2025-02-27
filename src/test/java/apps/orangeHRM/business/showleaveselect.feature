@ignore
Feature:

  @addshowleave
  Scenario: Select all optipn on show leave textbox
    * scroll(leavePage.showLeaveSelect)
    * mouse().move(leavePage.showLeaveSelect).click()
    * delay(5000)
    * mouse().move(format(leavePage.optionLeave,"Rejected")).click()
    * mouse().move(leavePage.showLeaveSelect).click()
    * mouse().move(format(leavePage.optionLeave,"Cancelled")).click()
    * mouse().move(leavePage.showLeaveSelect).click()
    * mouse().move(format(leavePage.optionLeave,"Scheduled")).click()
    * mouse().move(leavePage.showLeaveSelect).click()
    * mouse().move(format(leavePage.optionLeave,"Taken")).click()
    * delay(5000)


