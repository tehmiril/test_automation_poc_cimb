*** Settings ***
Test Setup        Open Android CIMB app
Test Template     Positive_rekpon_transfer_to_other_rekpon    #Test Teardown    Close Application
Resource          test_data_Android.txt
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections

*** Test Cases ***    User_ID      Dest_Num        Transfer_Amount
RekPon_Transfer_to_RekPon
                      ${userID}    085349251023    10000
