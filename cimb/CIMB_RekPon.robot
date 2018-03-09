*** Settings ***
Resource          test_data_rekpon.txt
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords.txt

*** Test Cases ***
RekPon_Validate_Balance_Success
