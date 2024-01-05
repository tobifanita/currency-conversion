import requests

from pytest_bdd import scenarios, given, when, then

CURRENCYCONVERSION_API = 'https://api.currencyconversion.com/'

scenarios('../features/createCurrency.feature')

@given('The service aims to create following currency conversion: "<source>" "<target>" "<effectiveDate>" "<exchange>"')
def ccc_params(source,target,effectiveDate,exchange):
    params = {'source': source,'target':target,'effectiveDate':effectiveDate,'exchange':exchange}
    return params

@when('The service calls the api to create the currency conversion')
def ccc_response(ccc_params):
    response = requests.get(CURRENCYCONVERSION_API,params=ccc_params)
    return response

@then('The response to the creation of the converted currency should be "{response:d}" "<message>"')
def ccc_response_contents(ccc_response,response,message):
    assert ccc_response.status_code == response
    assert ccc_response.text.lower() == message.lower()