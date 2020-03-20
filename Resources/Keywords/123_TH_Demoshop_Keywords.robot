*** Settings ***
Library  SeleniumLibrary
Resource  ../variables/GlobalVariables.robot

*** Variables ***
${Payment_Ref_code}
${Final_amount_value}

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
    SLEEP  1s
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

Merchant ID
    Clear Element Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']  merchant_th@shopping.com
    Click Element  xpath://input[@name='ctl00$ContentPlaceHolder2$txtSecretKey']
    Sleep  2s
Name
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtName']  WaghMay

Email
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtEmail']  wagh.may@2c2pexternal.com

Mobile No.
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMobile']  8798304357

AgentCode
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlAgentCode']    BANGKOKPAY

Generate XML
    Scroll Element Into View  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']
    Click Button  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']

Post To 1-2-3
    Click Button  xpath://input[@value='Post to 1-2-3']


Verify Payment Page
    SLEEP  3s
    capture page screenshot
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[1]/span[1]  Payment Code (Ref.1)
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[2]/span[1]  Amount ( THB )
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/div[2]/span[1]  Mobile No. (Ref.2)

capture page screenshot

Final Amount
    ${amount_value}=   Get Text  xpath=//span[@class='amount']
    Log To Console  ${amount_value}
    ${remove_quama}=  Evaluate    '${amount_value}'.replace(',','')
    ${Final_amount_value}=   Fetch From Left	  ${remove_quama}     .
    log to console  ${Final_amount_value}
    Sleep  2s

Verify Payment Ref code
    ${Payment_Ref_code}=   Get Text  xpath=//span[@class='code']
    Log To Console  ${Payment_Ref_code}

Return To Merchant
    Click Button  xpath://input[@id='btnGoBack']

ClickAgentTab
     Click Element  xpath://a[@href='Agent.aspx']

Enter Agent Payment.ref.code
    Input Text  xpath://input[@id='txtPaymentCode']  ${Payment_Ref_code}

Enter Amount
    Input Text  xpath://input[@id='txtAmount']  ${Final_amount_value}

Select Agent
    Select From List by Label  xpath://select[@name='ddlAgentCode']  SCB

Validate
    Click Element  xpath://input[@name='btnValidate']

Confirm
    Click Element  xpath://input[@name='btnConfirm']