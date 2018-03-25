*** Settings ***
Suite Setup       Run Keywords    Open Android CIMB app
...               AND    Login_app    ${userID}
Suite Teardown    Logout_app
Test Teardown     Run Keyword If Test Failed    Check_which_page_for_error
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
Library           OperatingSystem
Library           ExcelLibrary
Resource          xl_keywords.txt

*** Test Cases ***
Positive_bill_payment_cc
    Sleep    5s
