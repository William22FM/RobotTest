*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Variables ***
${Password}       id = txtPassword
${Username}       id = txtUsername
${BtnLogin}       id = btnLogin
${btnEdit}        id = btnEditCustom
${btnSave}        id = btnEditCustom

*** Test Cases ***
TC-NavigateToURL
    [Documentation]    Test ini akan mengarahkan user ke URL https://opensource-demo.orangehrmlive.com/
    open browser    https://opensource-demo.orangehrmlive.com/    chrome
    Input Text    ${Username}    Admin
    Input Text    ${Password}    admin123
    Click Button    ${BtnLogin}

TC-Search Directory
    Input Text    $(Username)    Admin
    Input Text    $(Password)    admin123
    Click Button    $(BtnLogin)
    Element Should Contain    //*[@id="resultTable"]/tbody/tr[2]/td[2]/ul/li[1]/b    Lisa Andrews

TC-EmergencyContac
    [Documentation]    This Test case to navigate My profile and add Emergency Contact
    Click Link    //*[@id="menu_pim_viewMyDetails"]
    Click Link    //*[@id="sidenav"]/li[1]/a
    Click Button    ${btnEdit}
    click element    //*[@id="frmEmpCustomFields"]/ol/li/select/option[4]
    Sleep    2s
    Click Button    ${btnSave}
