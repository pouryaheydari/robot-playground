*** Settings ***
Library                    SeleniumLibrary
Library                    OperatingSystem
Variables                  ./../vars/locators.py
Test Setup                 Open Bowser in Ultimateqa

*** Test Cases ***
Navigate To Sign In
    Open Free Courses
    Click Element                           ${sign_in_btn}
    Location Should Be                      ${sign_in_url}
    Element Should Contain                  ${sign_in_header}            expected=Welcome

*** Keywords ***
Open Bowser in Ultimateqa
    Open Browser                            ${url}       browser=chrome
    Maximize Browser Window
    Wait Until Page Contains Element        ${page_title}
Open Free Courses
    Mouse Over                              ${menu_item}
    Click Element                           ${sub_menu_item}
    Wait Until Page Contains Element        ${categories}
    Element Should Contain                  ${categories}        expected=Courses