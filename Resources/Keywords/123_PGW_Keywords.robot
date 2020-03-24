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

Navigate to Demoshop URL
    Go To  ${URL}

Navigate to 123 Admin URL
    Go To  ${Admin_URL}

Verify page is loaded
    Page Should Contain Element  xpath=/html/body/div[1]/div  123 Demo Shop

Verify 123 Admin page is loaded
    Page Should Contain Element  xpath=//label[text()='123 Admin Report']

Verify Landing page content
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[1]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[3]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[5]/img
    Page Should Contain Image  xpath=//*[@id="form1"]/div[3]/table[1]/tbody/tr[1]/td[7]/img

Verify 123 Admin Landing page content
    Page Should Contain Image  xpath://img[@src='/AdminService/Content/images/icon_txn_blue.png']
    Page Should Contain Image  xpath://img[@src='/AdminService/Content/images/icon_mer_blue.png']

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

Select the Country TH
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlCountry']    THAILAND

Select the Country MY
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlCountry']    MALAYSIA

Merchant ID TH
    Clear Element Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']  merchant_th@shopping.com
    Click Element  xpath://input[@name='ctl00$ContentPlaceHolder2$txtSecretKey']
    Sleep  2s

Merchant ID TH
    Clear Element Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']  merchant_th@shopping.com
    Click Element  xpath://input[@name='ctl00$ContentPlaceHolder2$txtSecretKey']
    Sleep  2s

Merchant ID MY
    Clear Element Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']
    Input Text  xpath://input[@id='ContentPlaceHolder2_txtMerchantID']  458458000000000
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

AgentCode FPX
    Select From List by Label  xpath://select[@id='ContentPlaceHolder2_ddlAgentCode']    FPX_SBIA

Generate XML
    Scroll Element Into View  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']
    Click Button  xpath://input[@name='ctl00$ContentPlaceHolder2$btnXml']

Post To 1-2-3
    Click Button  xpath://input[@value='Post to 1-2-3']

Next
    Click Button  xpath://input[@id='nextButton']


Verify Payment Page
    SLEEP  3s
    capture page screenshot
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[1]/span[1]  Payment Code (Ref.1)
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/ul/li[2]/span[1]  Amount ( THB )
    Page Should Contain Element  xpath=/html/body/div[1]/div[3]/div[1]/div/div[2]/span[1]  Mobile No. (Ref.2)

#capture page screenshot

Final Amount
    ${amount_value}=   Get Text  xpath=//span[@class='amount']
    Log To Console  ${amount_value}
    ${remove_quama}=  Evaluate    '${amount_value}'.replace(',','')
    ${Final_amount_value}=   Fetch From Left  ${remove_quama}  .
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

Usename
    Input Text  xpath://input[@id='userId']  1234

Password
    Input Text  xpath://input[@id='password']  1234

SignIn
    Sleep  2s
    Click Button  xpath://button[@type='submit']

Confirm details
    Click Button  xpath://button[text()='Confirm']

Submit
    Click Button  xpath://input[@name='Submit2']

# Admin Keywords

Click Login with google
      Click Element  xpath://img[@src='/AdminService/Content/images/login-google.png']
      Sleep  2s

Enter SignIn Credentials
      Input Text  xpath://input[@id='identifierId']  wagh.may@2c2pexternal.com
      Click Element  xpath://span[text()='Next']
      Sleep  2s
      Input Text  xpath://input[@class='whsOnd zHQkBf' and @name='password']  tejal@1234
      Click Element  xpath://span[@class='RveJvd snByac' and text()='Next']
      Sleep  2s

Click on Merchant Tab
    Click Element  xpath://img[@src='/AdminService/Content/images/icon_mer_blue.png']

Advance Search for Merchant
    Click Element  xpath://a[@class='link' and text()='Advance search']

Filter by Merchant Id
     Input Text  xpath://input[@id='MerchantID']  ${Default_MID}
     Sleep  2s

