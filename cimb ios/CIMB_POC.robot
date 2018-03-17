*** Settings ***
Resource          test_data_iOS.txt    #Test Setup    Open Android CIMB app    #Test Template    Positive_rekpon_transfer_to_other_rekpon    #Test Teardown    Close Application
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Library           String
Library           Collections
Library           Screenshot
Resource          Object_repo_CIMB_iOS.txt
Resource          test_data_SMS_Android.txt
Library           AppiumLibrary
Resource          bill_payment_keywords.txt
Library           ExcelLibrary
Resource          xl_keywords.txt

*** Test Cases ***
test_ios
    Open IOS CIMB app
    Login_app    ${userID}
    Positive_bill_payment_cc    ${cc_dest}    ${cc_payment_balance}
    Logout_app

test_ios2
    Open IOS CIMB app
    Login_app    ${userID}
    Positive_rekpon_transfer_to_other_rekpon2    ${rekpon_dest}    ${rekpon_transfer_balance}
    Logout_app

Test_excel
    Open Excel    /Users/accenture-mac02/Documents/Robot/test_automation_poc_cimb/Automation Manual Test Script and Test Data v.1.xls
    ${total_sheets}    Get Number Of Sheets
    ${sheets}    Get Sheet Names
    ${row_brp}    Get Row Count    ${xl_sheetname}
    ${col_brp}    Get Column Count    ${xl_sheetname}
    #${all_values}    Get Sheet Values    ${xl_sheetname}    False
    copy_xl_to_list    ${xl_sheetname}
