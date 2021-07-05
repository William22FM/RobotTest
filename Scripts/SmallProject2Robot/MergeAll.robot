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
    Input Text    email_create    asi@p.com
    click button    //*[@id="SubmitCreate"]
    sleep    7s
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
    Input Text    email_create    asi@p.com
    click button    //*[@id="SubmitCreate"]
    sleep    7s
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
    click element    email
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

TC-SearchHotelAceh
    [Tags]    SearchHotel    lll
    open Browser    http://103.226.139.66:8080/en/    chrome
    Maximize Browser Window
    Input Text    css:input#hotel_location    Aceh
    click element    css:button#id_hotel_button
    sleep    5s
    click element    css:[data-id-hotel]
    click element    css:input#check_in_time
    click element    //*[@id="ui-datepicker-div"]//*[text()=28]
    click element    css:input#check_out_time
    click element    //*[@id="ui-datepicker-div"]//*[text()=29]
    sleep    5s
    click element    css:button#search_room_submit > span
    sleep    10s
    Element Should Contain    css:div#left_column p    Search Rooms

TC-BookingGeneral
    [Tags]    BookingHotel
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(1) .ajax_add_to_cart_button span
    Element Should Contain    css:#layer_cart_product_title    General Rooms
    click element    [title='Belanja Lagi'] span

TC-BookingDelux
    [Tags]    BookingHotel
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(2) .ajax_add_to_cart_button span
    Element Should Contain    css:#layer_cart_product_title    Delux Rooms
    click element    [title='Belanja Lagi'] span

TC-BookingExecutive
    [Tags]    BookingHotel
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(3) .ajax_add_to_cart_button span
    Element Should Contain    css:#layer_cart_product_title    Executive Rooms
    click element    [title='Belanja Lagi'] span

TC-BookingLuxury
    [Tags]    BookingHotel
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(4) .ajax_add_to_cart_button span
    Element Should Contain    css:#layer_cart_product_title    luxury Rooms
    click element    [title='Tutup window']

TC-SeeOrder
    [Tags]    Cart
    click element    css:[title='View my booking cart']

TC-Remove,Booked1
    [Tags]    Cart
    click element    css:.order-detail-content [class='col-sm-2 room-type-img-block'] [href='http\:\/\/103\.226\.139\.66\:8080\/id\/quick-order\?id_product\=1\&deleteFromOrderLine\=1\&date_from\=2021-07-14\+00\%3A00\%3A00\&date_to\=2021-07-31\+00\%3A00\%3A00']
    sleep    8s
    click element    css:.order-detail-content [class='col-sm-2 room-type-img-block'] [href='http\:\/\/103\.226\.139\.66\:8080\/id\/quick-order\?id_product\=2\&deleteFromOrderLine\=1\&date_from\=2021-07-14\+00\%3A00\%3A00\&date_to\=2021-07-31\+00\%3A00\%3A00']
    sleep    8s
    click element    css:.order-detail-content [class='col-sm-2 room-type-img-block'] [href='http\:\/\/103\.226\.139\.66\:8080\/id\/quick-order\?id_product\=3\&deleteFromOrderLine\=1\&date_from\=2021-07-14\+00\%3A00\%3A00\&date_to\=2021-07-31\+00\%3A00\%3A00']
    sleep    8s

TC-CheckOut
    [Tags]    Cart
    click element    css:[title='Proceed to checkout'] span
    sleep    5s
    click element    css:[title='Proceed to Payment'] span
    click element    css:input#cgv
    sleep    5s
    click element    css:a[title='Pay by bank wire']
    click element    css:#cart_navigation span
    Element Should Contain    css:.page-heading    Order confirmation

TC-PaymentBankWire
    [Tags]    Payment
    open browser    http://103.226.139.66:8080/en/login?back=my-account    chrome
    Maximize Browser Window
    Input Text    email    as@e.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin
    sleep    2s
    goto    http://103.226.139.66:8080/en/
    Input Text    css:input#hotel_location    Aceh
    click element    css:button#id_hotel_button
    sleep    5s
    click element    css:[data-id-hotel]
    click element    css:input#check_in_time
    click element    css:.ui-icon.ui-icon-circle-triangle-e
    click element    css:tr:nth-of-type(3) > td:nth-of-type(3) > .ui-state-default
    click element    css:input#check_out_time
    click element    css:tr:nth-of-type(4) > td:nth-of-type(4) > .ui-state-default
    sleep    5s
    click element    css:button#search_room_submit > span
    sleep    10s
    Element Should Contain    css:div#left_column p    Search Rooms
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(1) .ajax_add_to_cart_button span
    sleep    5s
    Element Should Contain    css:#layer_cart_product_title    Delux Rooms
    click element    css:[title='Continue shopping'] span
    click element    css:[title='View my booking cart']
    sleep    5s
    click element    css:.card-body a[title='Proceed to checkout']
    sleep    5s
    click element    css:[title='Proceed to Payment'] span
    sleep    5s
    click element    css:input#cgv
    sleep    10s
    click element    css:[title='Pay by bank wire']
    sleep    5s
    click element    css:#cart_navigation span
    Element Should Contain    css:.page-heading    ORDER CONFIRMATION
    close browser

TC-PaymentCheck
    [Tags]    Payment
    open browser    http://103.226.139.66:8080/en/login?back=my-account    chrome
    Maximize Browser Window
    Input Text    email    as@e.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin
    sleep    2s
    goto    http://103.226.139.66:8080/en/
    Input Text    css:input#hotel_location    Aceh
    click element    css:button#id_hotel_button
    sleep    5s
    click element    css:[data-id-hotel]
    click element    css:input#check_in_time
    click element    css:.ui-icon.ui-icon-circle-triangle-e
    click element    css:tr:nth-of-type(3) > td:nth-of-type(3) > .ui-state-default
    click element    css:input#check_out_time
    click element    css:tr:nth-of-type(4) > td:nth-of-type(4) > .ui-state-default
    sleep    5s
    click element    css:button#search_room_submit > span
    sleep    10s
    Element Should Contain    css:div#left_column p    Search Rooms
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(1) .ajax_add_to_cart_button span
    sleep    5s
    Element Should Contain    css:#layer_cart_product_title    Delux Rooms
    click element    css:[title='Continue shopping'] span
    click element    css:[title='View my booking cart']
    sleep    5s
    click element    css:.card-body a[title='Proceed to checkout']
    sleep    5s
    click element    css:[title='Proceed to Payment'] span
    sleep    5s
    click element    css:input#cgv
    sleep    10s
    click element    css:[title='Pay by check.']
    sleep    5s
    click element    css:#cart_navigation span
    Element Should Contain    css:.page-heading    ORDER CONFIRMATION
    close browser

TC-PaymentPaypal
    [Tags]    Payment
    open browser    http://103.226.139.66:8080/en/login?back=my-account    chrome
    Maximize Browser Window
    Input Text    email    as@e.com
    click element    passwd
    Input Text    passwd    123654
    sleep    2s
    click button    SubmitLogin
    sleep    2s
    goto    http://103.226.139.66:8080/en/
    Input Text    css:input#hotel_location    Aceh
    click element    css:button#id_hotel_button
    sleep    5s
    click element    css:[data-id-hotel]
    click element    css:input#check_in_time
    click element    css:.ui-icon.ui-icon-circle-triangle-e
    click element    css:tr:nth-of-type(3) > td:nth-of-type(3) > .ui-state-default
    click element    css:input#check_out_time
    click element    css:tr:nth-of-type(4) > td:nth-of-type(4) > .ui-state-default
    sleep    5s
    click element    css:button#search_room_submit > span
    sleep    10s
    Element Should Contain    css:div#left_column p    Search Rooms
    click element    css:#category_data_cont [class='col-sm-12 room_cont']:nth-of-type(1) .ajax_add_to_cart_button span
    sleep    5s
    Element Should Contain    css:#layer_cart_product_title    Delux Rooms
    click element    css:[title='Continue shopping'] span
    click element    css:[title='View my booking cart']
    sleep    5s
    click element    css:.card-body a[title='Proceed to checkout']
    sleep    5s
    click element    css:[title='Proceed to Payment'] span
    sleep    5s
    click element    css:input#cgv
    sleep    10s
    click element    css:[title='Pay with PayPal']
    sleep    5s
    Element Should Contain    css:#center_column h2    Error occurred:
    close browser

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
