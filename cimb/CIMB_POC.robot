*** Settings ***
Test Setup        Open Android CIMB app
Test Template     Positive_rekpon_transfer_to_other_rekpon
Resource          test_data_Android.txt    #Test Teardown    Close Application
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections
Library           Screenshot
Resource          Object_repo_CIMB_Android.txt

*** Test Cases ***    User_id      dest_number       transfer_balance
Example_transfer_to_other_RekPon
                      ${userID}    ${rekpon_dest}    ${rekpon_transfer_balance}
