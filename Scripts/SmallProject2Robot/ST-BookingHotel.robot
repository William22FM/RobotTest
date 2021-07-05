*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
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
