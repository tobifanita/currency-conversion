Feature: As an app, I want to add a currency conversion, So I can make conversions between currency

    Scenario: Service creates a currency conversion
        Given The service aims to create following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service calls the api to create the currency conversion
        Then The response to the creation of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target         | effectiveDate | exchange | response | message                       |
            | Dollar | Euro           | 01/01/2024    | 0,91     | 201      | concurrency conversion create |
            | Dollar | Mexican Peso   | 01/02/2024    | 17,02    | 201      | concurrency conversion create |
            | Dollar | Colombian Peso | 01/03/2024    | 3928,88  | 201      | concurrency conversion create |
            | Dollar | Yen            | 01/01/2024    | 144,92   | 201      | concurrency conversion create |
            | Yen    | Dollar         | 01/01/2024    | 0,0069   | 201      | concurrency conversion create |
            | Dollar | Euro           | 01/04/2024    | 0,92     | 201      | concurrency conversion create |

    Scenario: Service cannot create a currency conversion because wrong date
        Given The service aims to create following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service aim to create following concurrency:
        Then The response to the creation of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message                    |
            | Dollar | Euro   | 01/32/2024    | 0,92     | 400      | Wrong effective start date |
            | Dollar | Euro   | 01/10/2024    | 0,92     | 400      | Wrong effective start date |
            | Dollar | Euro   | 13/20/2023    | 0,92     | 400      | Wrong effective start date |

    Scenario: Service cannot create a currency conversion because wrong exchange rate
        Given The service aims to create following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service aim to create following concurrency:
        Then The response to the creation of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message             |
            | Dollar | Euro   | 13/20/2023    | xxx      | 400      | Wrong exchange rate |

    Scenario: Service cannot create a currency conversion because wmissing data
        Given The service aims to create following currency conversion:
            | source   | target   | effective start date | exchange rate |
            | <source> | <target> | <effectiveDate>      | <exchange>    |
        When The service aim to create following concurrency:
        Then The response to the creation of the converted currency should be
            | response   | message   |
            | <response> | <message> |
        Examples:
            | source | target | effectiveDate | exchange | response | message        |
            |        | Euro   | 01/04/2023    | 0.93     | 400      | Wrong data set |
            | Dollar |        | 01/04/2023    | 0.93     | 400      | Wrong data set |
            | Dollar | Euro   |               | 0.93     | 400      | Wrong data set |
            | Dollar | Euro   | 01/04/2023    |          | 400      | Wrong data set |
