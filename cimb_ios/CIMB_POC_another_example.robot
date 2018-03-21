*** Settings ***
Test Setup        Run Keywords    Open Android CIMB app
...               AND    Login_app    ${userID}
Test Teardown     Logout_app    #Close Application
Test Template     Positive_bill_payment_cc    #Positive_rekpon_transfer_to_other_rekpon2
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
Resource          bill_payment_keywords.txt

*** Test Cases ***    dest_number    transfer_balance
Example               ${cc_dest}     ${cc_payment_balance}
