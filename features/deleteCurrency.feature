Feature: As an app, I want to delete a currency conversion, because I don't need to use it

    Scenario: Service deletes a currency conversion
        Given  The service aims to delete following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service calls the api to delete the currency conversion
        Then The response to the delete the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target       | effectiveDate | exchange | response | message                        |
            | Dollar | Mexican Peso | 01/02/2024    | 17,02    | 200      | concurrency conversion deleted |

    Scenario: Service can not delete a currency conversion
        Given  The service aims to delete following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service calls the api to delete the currency conversion
        Then The response to the delete the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message                                |
            | Dollar | Yang   | 01/02/2024    | 0,91     | 200      | concurrency conversion can not deleted |