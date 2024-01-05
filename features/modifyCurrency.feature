Feature: As an app, I want to modify a currency conversion, So I can make update an existing currency

    Scenario: Service modifies a currency conversion
        Given  The service aims to modify following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service calls the api to modify the currency conversion
        Then The response to the modification of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message                         |
            | Dollar | Euro   | 01/02/2024    | 0,91     | 200      | concurrency conversion modified |

    Scenario: Service cannot modify a currency conversion
        Given  The service aims to modify following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service calls the api to modify the currency conversion
        Then The response to the modification of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message                    |
            | Dollar | Euro   |               | 0,91     | 400      | Wrong effective start date |
            | Dollar | Euro   | 13/20/2023    | xxx      | 400      | Wrong exchange rate        |
            | Dollar | Euro   | 01/02/2024    | 0,91     | 400      | Already exist              |