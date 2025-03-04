Feature: API Testing

  Background:
    * url 'https://apitesting9.free.beeceptor.com/api/'


  @Test1
  Scenario: Add a New Post
    Given path 'posts'
    And request { userId: 1, title: "Sample Post Title", body: "This is the body of the sample post." }
    When method POST
    Then status 200
    And match response == { userId: 1, title: "Sample Post Title", body: "This is the body of the sample post.", id: '#string' }
    And def postId = response.id
    And def sharedData = { postId: '#(postId)' }

