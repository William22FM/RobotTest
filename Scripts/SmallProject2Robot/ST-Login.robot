*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-RegisterWrongEmailFormat
    [Tags]    Login    TS1    sst
    open browser    http://qa2.cilsy.id:8080    chrome
    Maximize Browser Window
    click element    //*[@id="header"]/div[3]/div/div/div[7]/ul/li/a/span
    Input Text    email_create    as@c
    click button    //*[@id="SubmitCreate"]
    sleep    2s
    Element Should Contain    create_account_error    Invalid email address.    salam

TC-RegisterEmptyEmail
    [Tags]    Login
    click element    //*[@id="header"]/div[3]/div/div/div[7]/ul/li/a/span
    click button    //*[@id="SubmitCreate"]
    sleep    2s
    Element Should Contain    create_account_error    Invalid email address.    salam

TC-RegisterRightEmailandDidn’t FillFullContentRequirements
    [Tags]    Login
    Input Text    email_create    as@f.com
    click button    //*[@id="SubmitCreate"]
    sleep    2s
    click element    css:div:nth-of-type(1) > .top > .radio \ input[name='id_gender']
    Input Text    customer_firstname    Will
    Input Text    customer_lastname    iam
    click element    //*[@id="days"]/option[2]
    click element    //*[@id="months"]/option[6]
    click element    //*[@id="years"]/option[19]
    select checkbox    newsletter
    select checkbox    optin
    click element    submitAccount
    sleep    2s
    Element Should Contain    //*[@id="center_column"]/div/p[1]    There
    sleep    2s

TC-RegisterRightEmailandFillAllContentRequirements
    [Tags]    Login    sst
    Go To    http://103.226.139.66:8080/en/login?back=my-account
    click element    //*[@id="header"]/div[3]/div/div/div[7]/ul/li/a/span
    Input Text    email_create    as@f.com
    click button    //*[@id="SubmitCreate"]
    sleep    2s
    click element    css:div:nth-of-type(1) > .top > .radio \ input[name='id_gender']
    Input Text    customer_firstname    Will
    Input Text    customer_lastname    iam
    Input Text    passwd    123654
    click element    //*[@id="days"]/option[2]
    click element    //*[@id="months"]/option[6]
    click element    //*[@id="years"]/option[19]
    select checkbox    newsletter
    select checkbox    optin
    click element    submitAccount
    sleep    2s

TC-LoginWrongFormatEmail-Message_invalid_email_address
    [Tags]    Login
    go to    http://103.226.139.66:8080/en/login?back=my-account
    Input Text    email    as@e
    Input Text    passwd    12354
    click button    SubmitLogin
    sleep    2s
    Element Should Contain    //*[@id="center_column"]/div[1]    There is 1 error

TC-LoginWrongEmail-Message_authentication_failed
    [Tags]    Login
    Input Text    email    as@z.com
    Input Text    passwd    12354
    click button    SubmitLogin
    sleep    2s
    Element Should Contain    //*[@id="center_column"]/div[1]    There is 1 error

TC-LoginWrongPassword
    [Tags]    Login
    Input Text    email    as@e.com
    Input Text    passwd    987654
    click button    SubmitLogin
    sleep    2s
    Element Should Contain    //*[@id="center_column"]/div[1]    There is 1 error

TC-LoginRight
    [Tags]    Login    TS1
    Input Text    email    as@e.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin

TC-Logout
    [Tags]    Login
    click element    user_info_acc
    sleep    5
    click element    css:.dropdown-menu \ a[title='Log me out']
    close browser
