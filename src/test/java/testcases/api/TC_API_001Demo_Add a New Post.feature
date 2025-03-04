Feature: API Testing

  Background:
    * url 'https://apitesting9.free.beeceptor.com/api/'
    # Lưu postId cho các test sau
    * def result = call read('classpath:testcases/api/TC_API_001_Add a New Post.feature')
    * def postId = result.postId

  @Test1
  Scenario: Add a New Post
    Given path 'posts'
    And request { userId: 1, title: "Sample Post Title", body: "This is the body of the sample post."}
    When method POST
    Then status 200
    And match response == { userId: 1, title: "Sample Post Title", body: "This is the body of the sample post.",id: '#string'}
    And def postId = response.id
    * print postId

    @Test2
    Scenario: Add a Comment to the New Post

      Given path 'posts'
      And request { postId: '#(postId)', name: "Sample Comment", email: "user@example.com", body: "This is a test comment on the sample post."}
      When method POST
      Then status 200
      And match response == { postId: '#(postId)', name: "Sample Comment", email: "user@example.com", body: "This is a test comment on the sample post.", id: '#string'}
      * print "Comment added to post ID:", postId

  @Test3
  Scenario: Update the New Post’s Title and Body

    Given path 'posts',postId
    And request {title: "Updated Post Title", body: "This is the updated body of the sample post."}
    When method PUT
    Then status 200
    And match response == {title: "Updated Post Title", body: "This is the updated body of the sample post.", id: '#string' }
