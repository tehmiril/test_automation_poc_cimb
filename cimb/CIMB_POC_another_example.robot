*** Settings ***
Test Setup        Run Keywords    Open Android CIMB app
...               AND    Login_app    ${userID}
Test Teardown     Logout_app    #Close Application
Test Template     Positive_rekpon_transfer_to_other_rekpon2
Resource          test_data_Android.txt
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections
Library           Screenshot
Resource          Object_repo_CIMB_Android.txt

*** Test Cases ***    dest_number       transfer_balance
Example_transfer_to_other_RekPon
                      ${rekpon_dest}    ${rekpon_transfer_balance}
