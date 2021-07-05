*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
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
    Element Should Contain    css:#layer_cart_product_title    General Rooms
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
    Element Should Contain    css:#layer_cart_product_title    General Rooms
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
