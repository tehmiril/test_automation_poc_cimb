*** Settings ***
Library           AppiumLibrary
Resource          Setting_ACN.txt

*** Test Cases ***
just a test
    Open app

*** Keywords ***
Open app
    Open Application    ${appiumServer}    platformName=${platformName}    platformVersion=${androidVersion}    deviceName=${deviceName}    appPackage=${appPackage}    appActivity=${appName}
