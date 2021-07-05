*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-AddAddress
    [Tags]    AcountFeature
    open browser    http://103.226.139.66:8080/en/login    chrome
    Maximize Browser Window
    Input Text    email    as@f.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin
    click element    css:.caret
    sleep    2s
    click element    css:[aria-labelledby] [title='View my customer account']
    sleep    2s
    click element    css:a[title='Add my first address'] > span
    input text    css:input#company    Compan
    input text    css:input[name='address1']    address1
    input text    css:input[name='address2']    address2
    input text    css:input#postcode    52365
    input text    css:input#city    Purwasuka
    click element    css:select#id_state
    click element    css:[value='320']
    input text    css:input#phone    2032562541
    input text    css:input#phone_mobile    086542326549
    sleep    2s
    click button    id:submitAddress
    click element    css:li:nth-of-type(1) > .btn.btn-default.button.button-small > span

TC-OrdersHistory
    [Tags]    AcountFeature
    open browser    http://103.226.139.66:8080/en/login    chrome
    Maximize Browser Window
    Input Text    email    as@f.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin
    click element    css:.caret
    sleep    2s
    click element    css:[aria-labelledby] [title='View my customer account']
    sleep    2s
    click element    css:a[title='Orders'] > span
    click element    css:li:nth-of-type(1) > .btn.btn-default.button.button-small > span

TC-CreditSlips
    [Tags]    AcountFeature
    click element    css:a[title='Credit slips'] > span
    click element    css:li:nth-of-type(1) > .btn.btn-default.button.button-small > span

TC-AddressesAreListedisted
    [Tags]    AcountFeature
    click element    css:a[title='Addresses'] > span
    click element    css:li:nth-of-type(1) > .btn.btn-default.button.button-small > span

TC-PersonalInformation
    [Tags]    AcountFeature
    click element    css:a[title='Information'] > span
    click element    css:li:nth-of-type(1) > .btn.btn-default.button.button-small > span
