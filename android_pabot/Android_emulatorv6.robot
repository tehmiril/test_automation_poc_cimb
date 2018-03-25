*** Settings ***
Library           AppiumLibrary
Library           String
Library           Collections
Resource          Test_data_calculator.txt
Resource          Custom_calc_keywords.txt
Resource		  Test_data_for_pabot.txt
Resource	      device_details_Android.txt

*** Test Cases ***
Test basic calc app
    [Documentation]    Basic function
    [Setup]    Open Calc app
    Log    "STEP 1, enter values"
    Calc_operation_1_digit_each    ${sign1}    ${digit1}    ${digit2}    ${expectedResult}
    Log    "STEP 2, view result"
    Get Result
    Log    "STEP 3, let's verify"
    Verify Result
    [Teardown]    Close Application
