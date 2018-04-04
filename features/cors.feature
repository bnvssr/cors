  Feature: CORS
  
  Background: account details
  Given transaction data
     | debtorAccountNumber | instructedAmount | instructedCurrency | creditorAccountNumber | creditorName | executionDate |
     | NL64ABNA05286324    | 200.00           | EUR                | NL64ABNA0528632445    | Test user1   | 2018-04-02    |
 
  @correct
  Scenario Outline: Initiate a SCT payment from a client with a cross-domain origin.
#  Given the api is available
  When the user creates a payment order with <description> and <header> from a different domain
  Then a valid response code is returned with code <http_code>

  Examples:
     | TC   | description              | header                     | http_code                                            |
     | TC01 | cross domain http header | Origin: http://foo.example | 400: Access-Control-Allow-Origin: http://foo.example |
     | TC02 | cross domain http header | Origin: http://foo.example | 400: Access-Control-Allow-Credentials: true          |
     | TC03 | cross domain http header | Origin: http://foo.example | 400: Access-Control-Expose-Headers: FooExample       |

  @incorrect
  Scenario Outline: Initiate a SCT payment from a client with incorrect cross-domain origin
#  Given the api is available
  When the user creates a payment order with <description> and <header> from a different domain
  Then an invalid response code is returned with code <http_code>

  Examples:
     | TC   | description              | header                     | http_code                                      |
     | TC01 | cross domain http header | Origin: http://foo.example | 201 : Origin http://foo.example is not allowed |
