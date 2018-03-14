*** Settings ***
Test Setup        Run Keywords    Open Android CIMB app
...               AND    Login_app    ${userID}
Test Teardown     Logout_app    #Close Application
Resource          test_data_Android.txt    #Test Template    Positive_bill_payment_cc    #Positive_rekpon_transfer_to_other_rekpon2
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections
Resource          Object_repo_CIMB_Android.txt
Resource          bill_payment_keywords.txt

*** Test Cases ***
Positive_bill_payment_cc
    ${cc_dest}    ${cc_payment_balance}

RekPon_OK
    [Template]    Positive_rekpon_transfer_to_other_rekpon2
    ${rekpon_dest}    ${rekpon_transfer_balance}
    ${rekpon_dest2}    ${rekpon_transfer_balance}

scenario_X
    Login_app
    transfer_OK
    Logout_app
