*** Settings ***
Library  SeleniumLibrary
Resource  ../../Resources/Keywords/123_PGW_Keywords.robot

Suite Setup  Begining the test
#Suite Teardown  Ending the test

*** Test Cases ***
Login To The 123 Admin
    [Documentation]  This is test 1
    [Tags]  Test1
    Navigate to 123 Admin URL

"123 Admin Landing" page should match requirements
    [Documentation]  This is test 2
    [Tags]  Test2
    Verify 123 Admin page is loaded
    Click Login with google

Enter Login Credentials
    [Documentation]  This is test 3
    [Tags]  Test3
    Enter SignIn Credentials
    Verify 123 Admin Landing page content

Go To Merchant
    [Documentation]  This is test 4
    [Tags]  Test4
    Click on Merchant Tab
    Advance Search for Merchant

Filter by Merchant
    [Documentation]  This is test 5
    [Tags]  Test5
    Filter by Merchant Id

