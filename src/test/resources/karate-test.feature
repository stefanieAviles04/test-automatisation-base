Feature: Test de API súper simple

  @getcharacters
  Scenario: Get characters
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    When method GET
    Then status 200
    And print response

  @createcharacter
  Scenario: Create character success
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request {"name": "Black Widow Chapter","alterego": "Natasha Romanoff","description": "Brave women","powers": ["Guns", "Fight"]}
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And def personajeId = response.id
    And print 'ID character created:', personajeId

