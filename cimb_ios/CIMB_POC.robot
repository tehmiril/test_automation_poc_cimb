*** Settings ***
Suite Setup       Run Keywords    Open IOS CIMB app
...               AND    Login_app    ${userID}
Suite Teardown    Logout_app
Test Teardown     Run Keyword If Test Failed    Check_which_page_for_error
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
Resource          exception_handling_keywords.txt

*** Test Cases ***
test_rekpon_nok
    Positive_rekpon_transfer_to_other_rekpon2    087675545667    ${rekpon_transfer_balance}

test_cc_nok
    Positive_bill_payment_cc    51163736285    ${cc_payment_balance}

test_rekpon_ok
    Positive_rekpon_transfer_to_other_rekpon2    ${rekpon_dest}    ${rekpon_transfer_balance}

Test_excel
    Open Excel    /Users/accenture-mac02/Documents/Robot/test_automation_poc_cimb/Automation Manual Test Script and Test Data v.1.xls
    ${total_sheets}    Get Number Of Sheets
    ${sheets}    Get Sheet Names
    ${row_brp}    Get Row Count    ${xl_sheetname}
    ${col_brp}    Get Column Count    ${xl_sheetname}
    #${all_values}    Get Sheet Values    ${xl_sheetname}    False
    copy_xl_to_list    ${xl_sheetname}
