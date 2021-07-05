*** Settings ***
Library           Selenium2Library
Library           chromedriver.exe

*** Test Cases ***
TC-SeeOrder
    [Tags]    Cart
    click element     css:[title='View my booking cart']

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
    sleep     5s
    click element    css:[title='Proceed to Payment'] span
    click element    css:input#cgv
    sleep     5s
    click element    css:a[title='Pay by bank wire']
    click element    css:#cart_navigation span
    Element Should Contain    css:.page-heading    Order confirmation
