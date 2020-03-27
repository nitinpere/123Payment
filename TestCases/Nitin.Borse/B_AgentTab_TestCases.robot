*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Keywords/GlobalKeywords.robot
#robot -d Results TestCases/Nitin.Borse/B_AgentTab_TestCases.robot
Suite Setup  Begining the test
Suite Teardown  Ending the test

*** Test Cases ***
Login To The Demoshop
    [Documentation]  This is test 1
    [Tags]  Test1
    Navigate to
    Verify page is loaded

Navigate to Agent Page
    [Documentation]  This is test 2
    [Tags]  Test2
    Open the Agent Page
    Verify Agent Page is loaded
    Agent page should match requirements

Should able to fill Agent details
    [Documentation]  This is test 3
    [Tags]  Test3
    Fill the Ref1 code
    Fill the Ref2 code
    Fill the Amount
    Select AgentCode
    Validate the info
    Confirm the info