*** Settings ***
Documentation     This Robot Framework file demonstrates various variable types, logging, and test case validation with setup and teardown.
Library           BuiltIn
Test Setup        Test Initialization
Test Teardown     Test Cleanup
Test Tags         main

*** Variables ***
${SINGLE_VARIABLE}       Single string variable
@{LIST_VARIABLE}         item1    item2    item3
&{DICT_VARIABLE}         key1=value1    key2=value2
${INTEGER_VARIABLE}      42
${FLOAT_VARIABLE}        3.1415
${BOOLEAN_VARIABLE}      ${True}

*** Keywords ***
Test Initialization
    [Documentation]     Initializes test setup
    Log      Initializing test setup...

Test Cleanup
    [Documentation]     Cleans up after test
    Log      Cleaning up test environment...

Log All Variables
    [Documentation]     Logs all variable types
    Log      Single Variable: ${SINGLE_VARIABLE}
    Log      List Variable: ${LIST_VARIABLE}
    Log      Dictionary Variable: ${DICT_VARIABLE}
    Log      Integer Variable: ${INTEGER_VARIABLE}
    Log      Float Variable: ${FLOAT_VARIABLE}
    Log      Boolean Variable: ${BOOLEAN_VARIABLE}

Validate Variables
    [Documentation]     Verifies the expected values of variables
    Should Be Equal     ${SINGLE_VARIABLE}     Single string variable
    Should Be Equal     ${INTEGER_VARIABLE}    42
    Should Be Equal As Numbers    ${FLOAT_VARIABLE}      3.1415
    Should Be Equal     ${BOOLEAN_VARIABLE}     ${True}
    Length Should Be    ${LIST_VARIABLE}       3
    Should Contain      ${DICT_VARIABLE}    key1
    Should Not Contain  ${DICT_VARIABLE}    value3

Print All Arguments
    [Arguments]        ${KEY1}    ${KEY2}    ${KEY3}=Value3
    Log     ${KEY1}
    Log     ${KEY2}
    Log     ${KEY3}

*** Test Cases ***
Log Variables Test
    [Documentation]     Tests logging of all variables
    Log All Variables

Variable Validation Test
    [Documentation]     Tests the validation of variables
    Validate Variables

Print Arguments Test
    [Documentation]     Tests logging of all arguments
    Print All Arguments        Value1     Value2