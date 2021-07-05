*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-SearchHotelAceh
    [Tags]    SearchHotel
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

TC-SearchHotelDid'nInputHotelLocation
    [Tags]    Skip    SearchHotel
    go to    http://103.226.139.66:8080/en/
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

TC-SearchRatingAscendingDescending
    [Tags]    Skip    SearchHotel
    click button    css:button#gst_rating
    sleep    5s
    click button    link:Rating Ascending
    sleep    5s
    click button    css:button#gst_rating
    sleep    5s
    click button    link:Rating Descending

TC-SearchLowHightPrice
    [Tags]    Skip    SearchHotel
    click button    css:button#price_ftr
    sleep    5s
    click button    //*[@id="center_column"]/div/div/div[1]/div[3]/div/ul/li[1]/a
    sleep    5s
    click button    css:button#price_ftr
    sleep    5s
    click button    //*[@id="center_column"]/div/div/div[1]/div[3]/div/ul/li[2]/a
    sleep    5s
    close browser
