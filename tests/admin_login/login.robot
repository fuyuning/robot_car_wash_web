*** Settings ***
Resource  ../resource.robot
*** Test Cases ***
Login Fail
    try to login  ad  ad123
    sleep  2
    location should be  https://car-wash-admin-d.parkone.cn/login
    [Teardown]    Close Browser

Login Success
    try to login  admin  admin123
    sleep  2
    location should be  https://car-wash-admin-d.parkone.cn/main/home
    [Teardown]    Close Browser



*** Keywords ***
