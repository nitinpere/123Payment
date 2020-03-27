*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Keywords/GlobalKeywords.robot
#robot -d Results TestCases/Nitin.Borse/A_Offline_Txn_TestCases.robot
Suite Setup  Begining the test
Suite Teardown  Ending the test

*** Test Cases ***
Login To The Demoshop
    [Documentation]  This is test 1
    [Tags]  Test1
    Navigate to
    Verify page is loaded

Navigate to Inquiry Page
    [Documentation]  This is test 2
    [Tags]  Test2
    Open the Inquiry Page
    Inquiry page should match requirements

Should able to fill all inquiry details
    [Documentation]  This is test 3
    [Tags]  Test3
    Enter Invoice No
    Enter Payment Ref Code
    Enter Amount