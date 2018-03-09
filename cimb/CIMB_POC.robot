*** Settings ***
Test Setup        Open Android CIMB app
Test Template     Login_app    #Test Teardown    Close Application
Resource          test_data_Android.txt
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections

*** Test Cases ***    User_ID
success_login_logout
                      ${userID}
