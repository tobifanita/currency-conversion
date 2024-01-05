Feature: As an app, I want to retrieve a currency conversion, because I need to use it

    Scenario: Service retrieve a currency conversion
        Given  The service aims to get the following currency conversion:
            | source   | target   | effective start date |
            | <source> | <target> | <effectiveDate>      |
        When The service calls the api to retrieve the currency conversion
        Then The response should be
            | response   | exchange rate |
            | <response> | <exchange>    |
        Examples:
            | source | target         | effectiveDate | exchange | response |
            | Dollar | Euro           | 01/02/2024    | 0,91     | 200      |
            | Dollar | Euro           | 12/02/2024    | 0,91     | 200      |
            | Dollar | Euro           | 01/05/2024    | 0,92     | 200      |
            | Yen    | Colombian Peso | 01/05/2024    | 27,11    | 200      |

    Scenario: Service cannot retrieve a currency conversion
        Given  The service aims to get the following currency conversion:
            | source   | target   | effective start date |
            | <source> | <target> | <effectiveDate>      |
        When The service calls the api to retrieve the currency conversion
        Then The response should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target         | effectiveDate | response | message                  |
            | Yen    | Argentine Peso | 01/05/2024    | 400      | Cannot find a conversion |