*** Settings ***
Library           Selenium2Library
Library           base_libarary.common.CommonLibrary

*** Variables ***
${SERVER_DOMAIN}  https://car-wash-server-d.parkone.cn
${SERVER}         car-wash-admin-d.parkone.cn
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}      https://${SERVER}/
*** Keywords ***
Try To Login
    [Arguments]  ${username}  ${password}
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    wait until keyword succeeds  0min   2sec   Title Should Be    虾洗运营后台
    Input Text    name=userName   ${username}
    Input Text    name=password   ${password}
    ${img_src}  get element attribute  css=.pin-img>img  src
    ${button}  set variable  css=form>button
    ${vk}  set variable  ${img_src[62:]}
    ${res}  get verify code  ${vk}
    Input Text    pin    ${res}
    Click Button    ${button}

