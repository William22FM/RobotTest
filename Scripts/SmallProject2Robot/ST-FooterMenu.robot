*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-Policies
    [Tags]    FooterMenu
    open browser    http://qa2.cilsy.id:8080    chrome
    Maximize Browser Window
    click element    css:a[title='Policies']
    sleep    3s
    Element Should Contain    css:.rte h2    Policies

TC-LegalNotice
    [Tags]    FooterMenu
    click element    css:a[title='Legal Notice']
    sleep    3s
    Element Should Contain    css:.rte h2    Legal

TC-TermsandConditionsofUse
    [Tags]    FooterMenu
    click element    css:a[title='Terms and conditions of use']
    sleep    3s
    Element Should Contain    css:.page-heading    TERMS AND CONDITIONS OF USE

TC-AboutUs
    [Tags]    FooterMenu
    click element    css:a[title='About us']
    sleep    3s
    Element Should Contain    css:.bottom-indent    ABOUT US

TC-Payment
    [Tags]    FooterMenu
    click element    css:a[title='Secure payment']
    sleep    3s
    Element Should Contain    css:.rte h2    Secure payment

TC-Language
    [Tags]    FooterMenu
    click element    css:.current
    sleep    3s
    click element    css:[title='Indonesia \(Indonesia\)'] span
    sleep    3s
    Element Should Contain    css:.rte h2    Pembayaran
