Feature: Authentication

  Scenario: Create session id
    #Step 1 [GET] Request Token
    * def ACCOUNT_INFO = read('account_info.json')
    Given url base_url
    And path request_token_path
    And param api_key = ACCOUNT_INFO.api_key
    When method GET
    Then status 200

    #Step 2 [POST] Validate Token
    * def request_token = response.request_token
    Given path validate_token_path
    And param api_key = ACCOUNT_INFO.api_key
    And request {"username":"#(ACCOUNT_INFO.username)", "password":"#(ACCOUNT_INFO.password)", "request_token": '#(request_token)'}
    When method POST
    Then status 200

    #Step 3 [Post] Create session id
    * def validated_request_token = response.request_token
    Given path create_session_id_path
    And param api_key = ACCOUNT_INFO.api_key
    And request {"request_token": '#(validated_request_token)'}
    When method POST
    Then status 200