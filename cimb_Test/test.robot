*** Settings ***
Test Setup        Run Keywords    Open Android CIMB app
...               AND    Login_app    testaut01
Test Teardown     Run Keywords		Logout_app    
...				  AND	Close Application
Library           AppiumLibrary
Resource          rekpon_keywords.txt
Resource          generic_keywords.txt
Resource          SMS_keywords_Android.txt
Resource          test_data_SMS_Android.txt
Library           String
Library           Collections
Resource          Object_repo_CIMB_Android.txt
Resource          bill_payment_keywords.txt

*** Test Cases ***
Transfer
	<RF_keywords>
    [Teardown]    Run Keyword If Test Failed    Check_which_page_for_error