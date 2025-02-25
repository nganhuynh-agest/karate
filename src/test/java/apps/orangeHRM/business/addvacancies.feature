@ignore
Feature:

  @addvacancies
  Scenario: Add job vacancy
    * print 'DEFAULT: lCreate a new job vacancy'
    # input vacancy name textbox: Demo Karate
    * mouse().move(recruitPage.vacancyTextbox).click()
    * input(recruitPage.vacancyTextbox, addVacancy.addVacancy.vacancyname)

    # Select job title: Automation Tester1740379081880
    * mouse().move(recruitPage.jobTitleTextbox).click()
    * mouse().move(recruitPage.jobTitleSelect).click()
    * delay(3000)

    # input hiring manager: Kim Nguyen
    * mouse().move(recruitPage.hiringTextbox).click()
    * input(recruitPage.hiringTextbox, addVacancy.addVacancy.hiringmanager)
    * delay(3000)