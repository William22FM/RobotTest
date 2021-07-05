*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-ClickMenu
    [Tags]    SideMenu
    open browser    http://qa2.cilsy.id:8080    chrome
    Maximize Browser Window
    click element    css:.nav_toggle
    sleep    3s
    Element Should Contain    css:#menu_cont .wk-nav-style:nth-of-type(1) li:nth-of-type(1) .navigation-link    Home

TC-ClickInterior
    [Tags]    SideMenu
    click element    css:li:nth-of-type(2) > .navigation-link
    sleep    3s
    Element Should Contain    css:div#hotelInteriorBlock > .col-sm-12.col-xs-12 .home_block_heading    Interior

TC-ClickAmenties
    [Tags]    SideMenu
    click element    css:li:nth-of-type(3) > .navigation-link
    sleep    3s
    Element Should Contain    css:.col-sm-12.col-xs-12.home_amenities_wrapper .home_block_heading    Amenities

TC-ClickRooms
    [Tags]    SideMenu
    click element    css:li:nth-of-type(4) > .navigation-link
    sleep    3s
    Element Should Contain    css:#hotelRoomsBlock .home_block_heading    Our Rooms

TC-ClickTestimonial
    [Tags]    SideMenu
    click element    css:li:nth-of-type(5) > .navigation-link
    sleep    3s
    Element Should Contain    css:#hotelTestimonialBlock .home_block_heading    What Our Guest Say?

TC-ClickLegalNotice
    [Tags]    SideMenu
    click element    css:li:nth-of-type(6) > .navigation-link
    sleep    3s
    Element Should Contain    css:.rte h2    Legal
    sleep    3s

TC-ClickAbout
    [Tags]    SideMenu
    click element    css:.nav_toggle
    click element    css:li:nth-of-type(7) > .navigation-link
    sleep    3s
    Element Should Contain    css:.bottom-indent    ABOUT US

TC-ClickContact
    [Tags]    SideMenu
    click element    css:.nav_toggle
    click element    css:li:nth-of-type(8) > .navigation-link
    sleep    3s
    Element Should Contain    css:[class='contact-header col-sm-offset-2 col-sm-8']    Contact Us
    close browser
