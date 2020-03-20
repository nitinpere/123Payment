*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Keywords/123_TH_Demoshop_Keywords.robot

Suite Setup  Begining the test
Suite Teardown  Ending the test

*** Test Cases ***
Login To The Demoshop
    [Documentation]  This is test 1
    [Tags]  Test1
    Navigate to
    Verify page is loaded

"Landing" page should match requirements
    [Documentation]  This is test 2
    [Tags]  Test2
    Verify Landing page content

Verify price after adding the items
    [Documentation]  This is test 3
    [Tags]  Test3
    Add Items
    Verify Price
    Check Out

To verify page is loaded
    [Documentation]  This is test 4
    [Tags]  Test4
    Verify "Customer Detail" page is loaded

To verify able to fill the customer details
    [Documentation]  This is test 5
    [Tags]  Test5
    Select the Country
    Merchant ID
    Mobile No.
    Email
    Name
    AgentCode
    Generate XML
    Post To 1-2-3

Get Details on PaymentSlip
    Final Amount
    Verify Payment Ref code

capture page screenshot
    [Documentation]  This is test 6
    [Tags]  Test6

Back to Demoshop
    [Documentation]  This is test 7
    [Tags]  Test7
    Return To Merchant

Enter the Agent details
    [Documentation]  This is test 8
    [Tags]  Test8
    ClickAgentTab
    Enter Agent Payment.ref.code
    Enter Amount
    Select Agent
    Validate
    Confirm

capture page screenshot
    [Documentation]  This is test 9
    [Tags]  Test9




