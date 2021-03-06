*** Settings ***
Library  SeleniumLibrary
Resource  ../variables/GlobalVariables.robot

*** Variables ***
${PaymentCode}
${Amout}
${MobileNo}
*** Keywords ***
Begining the test
    Open Browser  about:blank  chrome
    Maximize Browser Window

Ending the test
    Close Browser

Navigate to
    Go To  ${URL}

Login to 123 Admin Portal
    Input Text  xpath=//*[@id="identifierId"]
    Click Element  xpath=(//div[@class='d2laFc'])[2]

Verify page is loaded
    Page Should Contain Element  xpath=/html/body/div[1]/div  123 Demo Shop

Verify Landing page content
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[1]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[3]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[5]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[7]/img

Add Items
    Click Button  xpath://input[@id= 'ContentPlaceHolder2_btnPaint4']
    SLEEP  3s
    Click Button  xpath://input[@id= 'ContentPlaceHolder2_btnPaint3']

Verify Price
    ${total_value}=   Get Text  xpath=//span[@id='ContentPlaceHolder2_rptProductList_txtTotal']
    Log To Console  ${total_value}

Check Out
    Click Button  xpath://input[@value= 'Check Out']

Verify "Customer Detail" page is loaded
    Page Should Contain Element  xpath=/html/body/div[3]/div

Select the Country
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlCountry']    THAILAND
    Sleep  10s

Merchant ID
    Clear Element Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']  merchant@shopping.com
    Click Element  xpath://input[@name='ctl00$ContentPlaceHolder2$txtSecretKey']
    Sleep  8s
Name
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtName']  nitin

Email
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtEmail']  nitin.bor@2c2pexternal.com

Mobile No.
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMobile']  7798304854

AgentCode
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlAgentCode']    BANGKOKPAY

Generate XML
    Sleep  3s
    Scroll Element Into View  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']
    Click Button  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']
    SLEEP  2s

Post To 1-2-3
    Click Button  xpath://input[@value='Post to 1-2-3']


Verify Payment Page
    SLEEP  3s
    capture page screenshot
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[1]/span[1]  Payment Code (Ref.1)
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[2]/span[1]  Amount ( THB )
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/div[2]/span[1]  Mobile No. (Ref.2)
    ${Cde} =  Get Text  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[1]/span[2]
    SET GLOBAL VARIABLE  ${PaymentCode}  ${Cde}
    log to console  ${PaymentCode} and ${Cde}
    ${Amout} =  Get Text  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[2]/span[2]
    log to console  ${Amout}
    ${MobileNo} =  Get Text  xpath=/html/body/div[1]/div[3]/div[1]/div/div[2]/span[2]
    log to console   ${MobileNo}

Open the Agent Page
    Click Link  xpath=/html/body/div[2]/ul/li[5]/a

Verify Agent Page is loaded
    Page Should Contain  Agent

Agent page should match requirements
    Page Should Contain  123 Demo Shop
    Page Should Contain Element  ${Ref1}
    Page Should Contain Element  ${Request XML}

Fill the Ref1 code
    Input Text  ${Ref1}    ${PaymentCode}
    log to console  ${PaymentCode}

Fill the Ref2 code
    Input Text  ${Ref2}  ${MobileNo}

Fill the Amount
    Input Text  ${AmountPath}   ${Amout}

Select AgentCode
    Select From List by Label  xpath=//*[@id="ddlAgentCode"]   KTB

Validate the info
    Click Element  ${Validate}
    Sleep  4s


Confirm the info
    Click Element  ${Confirm}
    capture page screenshot





Open the Inquiry Page
    Click Link  xpath=/html/body/div[2]/ul/li[3]/a

Inquiry page should match requirements
    Page Should Contain Element  xpath=//*[@id="ContentPlaceHolder2_txtUrl"]
    Page Should Contain Element  xpath=//*[@id="ContentPlaceHolder2_txtReq"]
    Page Should Contain Element  xpath=//*[@id="ContentPlaceHolder2_txtRes"]

Enter Invoice No
    Input Text  xpath=//*[@id="ContentPlaceHolder2_txtInvoice"]   4545454

Enter Payment Ref Code
    Input Text  xpath=//*[@id="ContentPlaceHolder2_txtRef1"]  35546534545

Enter Amount
    Input Text  xpath=//*[@id="ContentPlaceHolder2_txtAmount"]  1500