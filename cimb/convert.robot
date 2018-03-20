*** Settings ***
Library           String
Library           Collections
Library           OperatingSystem
Library           ExcelLibrary
Resource          xl_keywords.txt

*** Test Cases ***
Test_excel
    Log    ${CURDIR}
    ${sheets}    Set Variable    Test_Scenario
    Open Excel    Automation Manual Test Script and Test Data v.1.xls
    Read_RF_Keywords_Data    ${sheets}
