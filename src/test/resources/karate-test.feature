Feature: Test de API súper simple

  @getcharacters
  Scenario: Get characters
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method GET
    Then status 200
    And print response

  
