Feature: API Testing

  Background:
    * url 'https://apitesting9.free.beeceptor.com/api/'

  # Hàm gọi lại TC_API_001 để lấy postId
  @Setup
  Scenario: Get Post ID from TC_API_001
    * def result = call read('classpath:testcases/api/TC_API_001_Add a New Post.feature')
    * def postId = result.postId


  @Test2
  Scenario: Add a Comment to the New Post
    # Gọi lại Test Case 1 để lấy postId nếu chưa có
    * def result = call read('classpath:testcases/api/TC_API_001_Add a New Post.feature')
    * def postId = result.postId

    Given path 'posts'
    And request { postId: '#(postId)', name: "Sample Comment", email: "user@example.com", body: "This is a test comment on the sample post." }
    When method POST
    Then status 200
    And match response == { postId: '#(postId)', name: "Sample Comment", email: "user@example.com", body: "This is a test comment on the sample post.", id: '#string' }
    * print "Comment added to post ID:", postId

