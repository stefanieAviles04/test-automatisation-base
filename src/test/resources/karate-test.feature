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

  @characterlifecycle
  Scenario: Create, update  and delete character
  # Create character
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters'
    And request {"name": "Black Widow TestFlow","alterego": "Natasha Romanoff","description": "Spy","powers": ["Guns", "Martial Arts"]}
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And def personajeId = response.id
    And print 'ID character created:', personajeId

  # Update charater
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + personajeId
    And request {"name": "Black Widow TestFlow","alterego": "Natasha Romanoff","description": "Updated spy","powers": ["Guns", "Martial Arts", "Intelligence"]}
    And header Content-Type = 'application/json'
    When method PUT
    Then status 200
    And match response.description == "Updated spy"

  # Deelete character
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + personajeId
    When method DELETE
    Then status 204

  # Confirm the character doesnt exists
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/testuser/api/characters/' + personajeId
    When method GET
    Then status 404
    And match response == { error: "Character not found" }

