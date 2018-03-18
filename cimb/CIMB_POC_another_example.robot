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
    ${cc_dest}    ${cc_payment_balance}
    [Teardown]    Run Keyword If Test Failed    Check_which_page_for_error

RekPon_OK
    [Template]    Positive_rekpon_transfer_to_other_rekpon2
    ${rekpon_dest}    ${rekpon_transfer_balance}
    ${rekpon_dest2}    ${rekpon_transfer_balance}

test_Android_NOK
    Positive_rekpon_transfer_to_other_rekpon2    0813151515    ${rekpon_transfer_balance}

test_Android_OK
    Positive_rekpon_transfer_to_other_rekpon2    ${rekpon_dest2}    ${rekpon_transfer_balance}

test_Android_NOK2
    Positive_rekpon_transfer_to_other_rekpon2    0814324354    ${rekpon_transfer_balance}

Test_excel
    ${sheets}    Set Variable    Test_Scenario
    Open Excel    Automation Manual Test Script and Test Data v.1.xls
    ${total_sheets}    Get Number Of Sheets
    #${sheets}    Get Sheet Names
    #${row_brp}    Get Row Count    ${sheets}
    #${col_brp}    Get Column Count    ${sheets}
    #${all_values}    Get Sheet Values    ${xl_sheetname}    False
    #copy_xl_to_list    ${sheets}
    ${FILE_CONTENT}=    Get File    test_suite_template.txt
    ${full_content_string}    Convert To String    ${FILE_CONTENT}
    #Log    File Content: ${full_content_string}
    ${test_suite_name}=    Read Cell Data By Name    ${sheets}    A2
    ${test_case_name}=    Read Cell Data By Name    ${sheets}    B2
    ${full_content_string2}=    Replace String    ${full_content_string}    <userID>    testaut01
    ${full_content_string3}=    Replace String    ${full_content_string2}    <test_case_name>    ${test_case_name}
    #Log    File Content New: ${full_content_string2}
    #Create File    test.robot    ${full_content_string3}
    Read_RF_Keywords_Data    ${sheets}
