*** Settings ***
Test Setup        Open Android CIMB app
Resource          test_data_Android.txt    #Test Template    Positive_rekpon_transfer_to_other_rekpon    #Test Teardown    Close Application
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections
Library           Screenshot
Resource          Object_repo_CIMB_Android.txt

*** Test Cases ***
test
    Login_app    ${user_id}
    Logout_app
