*** Settings ***
Resource    resources/Base/BaseVariables.robot

*** Variables ***
${TABLE_LOCATOR}        //table[contains(@class, 'rz-grid-table')]    # Adjust as needed
${CODE_LINK_LOCATOR}    //td[2]//rz-chkbox-box                        # Assuming the link is in the second column

*** Variables ***
${TableXpath}                  //table[contains(@class, 'rz-grid-table')]
${FirstRowData}                ${TableXpath}//tr[1]//td[2]//a
${FirstRowDataWithCheckbox}    ${TableXpath}//tr[1]//td[3]//a
${FirstRowDataCheckbox}        ${TableXpath}//tr[1]//td[1]//a
${FirstRowDataEfDate}          ${TableXpath}//tr[1]//td[4]//a

#Element Button Add
${ElementButton1}    xpath=//button[contains(., "Add")]
${ElementButton2}    xpath=//button[.//span[contains(text(), "Add")]]

*** Keywords ***
Click Add
    ${Status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${ElementButton1}    timeout=5s

    IF                               ${Status}
    Click Element                    ${ElementButton1}
    ELSE
    Wait Until Element Is Visible    ${ElementButton2}    timeout=5s
    Click Element                    ${ElementButton2}
    END

# Click Add
#    Wait Until Element Is Visible    //button[.//span[contains(text(), "Add")]]
#    Click Element                    //button[.//span[contains(text(), "Add")]]

Click Submit
    Wait Until Element Is Visible    //button[@type="submit"]
    Click Element                    //button[@type="submit"]

# Click Back
#    Wait Until Element Is Visible    //button[.//span[contains(text(), "Back")]]
#    Click Element                    //button[.//span[contains(text(), "Back")]]
Click Back
    Wait Until Element Is Visible    //button[@title='Back']
    Click Element                    //button[@title='Back']

Click Active Status
    Wait Until Element Is Visible    id:ifin-btn-active
    Click Element                    id:ifin-btn-active

Click Editable Status
    Wait Until Element Is Visible    id:ifin-btn-editable
    Click Element                    id:ifin-btn-editable

Click Change Status
    [Arguments]                      ${Status}
    Wait Until Element Is Visible    //button[.//span[contains(text(), "${Status}")]]
    Click Element                    //button[.//span[contains(text(), "${Status}")]]

Click Checkbox
    Execute JavaScript    var checkbox = document.querySelector("input[type='checkbox'][aria-label='Select all items']"); if (checkbox) { checkbox.checked = true; checkbox.setAttribute('value', 'true'); checkbox.setAttribute('aria-checked', 'true'); } else { console.log('Checkbox not found'); }
    Click Element         xpath=//div[contains(@class, 'rz-chkbox')]

Click Lookup With Search
    [Arguments]                      ${LookupName}                                                                                                  ${Search}
    Wait Until Element Is Visible    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]                      
    Click Element                    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Wait Until Element Is Visible    xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//input[@id='ifin-searchbar']
    Input Text                       xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//input[@id='ifin-searchbar']       ${Search}
    Wait Until Element Is Visible    xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//tr[1]//button[@title='Select']
    Click Element                    xpath=//div[@class='rz-card rz-variant-filled ifinancing360-modal-content']//tr[1]//button[@title='Select']

Click Lookup
    [Arguments]                      ${LookupName}
    Wait Until Element Is Visible    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]    
    Click Element                    xpath=//label[@for="${LookupName}" and contains(@class, 'rz-label')]/following::button[1]
    Click Element                    //tr[1]//button[normalize-space()='Select']

# Click DatePicker
#    [Arguments]                      ${LookupName}                   ${Date}
#    Click Element                    id=${LookupName}
#    Wait Until Element Is Visible    class=rz-datepicker-group
#    Click Element                    xpath=//td[text()='${Date}']    

Click DatePicker
    Wait Until Element Is Visible    xpath=//label[contains(text(),'${LABEL_TEXT}')]/following::div[contains(@class,'rz-switch')][1]
    Click Element                    xpath=//label[contains(text(),'${LABEL_TEXT}')]/following::div[contains(@class,'rz-switch')][1]

Click Switch
    [Arguments]           ${InputName}
    Execute JavaScript    document.querySelector('input[name="${InputName}"]').click();

Click DDL
    [Arguments]                      ${DDLID}           ${OptionValue}
    ${PathDropDown} =                Set Variable       //*[@id='${DDLID}']
    ${PathOption} =                  Set Variable       //li[@role='option' and @aria-label='${OptionValue}']
    Wait Until Element Is Visible    ${PathDropDown}    
    Click Element                    ${PathDropDown}
    Wait Until Element Is Visible    ${PathOption}      
    Click Element                    ${PathOption}
# Click DDL
#    [Arguments]                      ${IdDdl}
#    Wait Until Element Is Visible    id:${IdDdl}
#    Click Element                    id:${IdDdl}

#    Click Element    //li[@aria-label="ACCESS"] 


#region input fied
Input Field
    [Arguments]       ${Field}                        ${Value}
    ${result}=        Run Keyword And Ignore Error    Input First Field     ${Field}    ${Value}
    Run Keyword If    '${result}[0]' == 'FAIL'        Input Second Field    ${Field}    ${Value}

Input First Field
    [Arguments]                      ${Field}                                                                        ${Value}
    Wait Until Element Is Visible    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')] 
    Input Text                       //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]     ${Value}

Input Second Field
    [Arguments]                      ${Field}                     ${Value}
    Wait Until Element Is Visible    //input[@name="${Field}"]
    Input Text                       //input[@name="${Field}"]    ${Value}




Input From Excel
    [Arguments]    ${file_path}    ${start_row}    @{fields}

    Open Workbook    ${file_path}
    ${rows}=         Read Worksheet    header=False    start=${start_row}

    FOR                  ${item}                            IN          @{rows}
    Click Add
    FOR                  ${field}                           IN          @{fields}
    Log                  Field: ${field}
    ${column_letter}=    Get From Dictionary                ${field}    column
    Log                  Column Letter: ${column_letter}
    ${field_name}=       Get From Dictionary                ${field}    name
    ${value}=            Get From Dictionary                ${item}     ${column_letter}

    Log               Inputting value: ${value} into field: ${field_name}
    Run Keyword If    "${field_name}" != "IsEditable" and "${field_name}" != "IsActive" and "${field_name}" != "IsSpOverride"    Input Text    ${field_name}    ${value}
    END

    # Run Keyword If    '${field_name}' == 'IsSpOverride' and '${value}' != '1'    Click Element    class=rz-switch-circle

    Click Submit

    Run Keyword If    "${field_name}" == "IsEditable" and ${value} != 1    Click Editable Status
    Run Keyword If    "${field_name}" == "IsActive" and ${value} != 1      Click Active Status

    Click Back
    END

    Close Workbook




    # Handle conditional clicks inside the field loop
    # IF                     '${field_name}' == 'IsActive'
    # IF                     '${value}' == '1'
    # Click Active Status
    # END
    # END

    # IF                       '${field_name}' == 'IsEditable'
    # IF                       '${value}' == '1'
    # Click Editable Status
    # END
    # END






    # [Arguments]         ${file_path}           ${start_row}                @{fields}
    # Open Workbook       ${file_path}
    # ${rows}=            Read Worksheet         header=False                start=${start_row}
    # FOR                 ${item}                IN                          @{rows}
    # Click Add
    # FOR                 ${field}               IN                          @{fields}
    # ${column_index}=    Get From Dictionary    ${field}                    column
    # ${field_name}=      Get From Dictionary    ${field}                    name
    # Input Field         ${field_name}          ${item[${column_index}]}
    # END
    # Click Submit
    # Click Back
    # END
    # Close Workbook




# Input Field
#    [Arguments]       ${Field}                         ${Value}
#    ${is_visible}=    Wait Until Element Is Visible    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]    timeout=5                    
#    Run Keyword If    '${is_visible}' == 'False'       Input Text                                                                     //input[@name="${Field}"]    ${Value}    ELSE    Input Text    //input[@name="${Field}" and contains(@class, 'rz-textbox rz-state-empty')]    ${Value}
#endregion




Open Browser & Login
    [Arguments]    ${UserName}    ${Password}

    Create Webdriver           Firefox
    Open Browser               ${BASEURL}
    Maximize Browser Window

    Wait Until Element Is Visible    name:UserName
    Wait Until Element Is Visible    name:Password

    Input Text        name:UserName               ${UserName}
    Input Password    name:Password               ${Password}
    Click Button      //button[@type="submit"]

Open Card
    [Arguments]                    ${CardName}
    Wait Until Element Contains    //h4[@title="${CardName}"]                 ${CardName}
    Click Element                  //h4[(contains(text(), "${CardName}"))]

Open Sidebar Menu
    [Arguments]                    ${Sidebar}
    Wait Until Element Contains    //span[(contains(text(), "${Sidebar}"))]    ${Sidebar}
    Click Element                  //span[(contains(text(), "${Sidebar}"))]

Open To Edit Data
    ${link}=          Get Element Attribute    ${FirstRowData}    href
    Run Keyword If    '${link}' == ''          Fail               No link found for element.
    Go To             ${link}

Open To Edit Data With Checkbox
    ${link}=          Get Element Attribute    ${FirstRowDataWithCheckbox}    href
    Run Keyword If    '${link}' == ''          Fail                           No link found for element.
    Go To             ${link}


Open To Edit Data Eff Date
    ${link}=          Get Element Attribute    ${FirstRowDataEfDate}    href
    Run Keyword If    '${link}' == ''          Fail                     No link found for element.
    Go To             ${link}

Open Wizard
    [Arguments]                    ${WizardName}
    Wait Until Element Contains    //span[(contains(text(), "${WizardName}"))]    ${WizardName}
    Click Element                  //span[(contains(text(), "${WizardName}"))]

# Open Wizard
#    [Arguments]                    ${WizardName}
#    Wait Until Element Contains    xpath=//a[@role='tab'][span[text()="${WizardName}"]]    ${WizardName}
#    Click Element                  xpath=//a[@role='tab'][span[text()="${WizardName}"]]






Logout
    Click Element    id:ifin-header-profile-photo
    Click Element    //span[(contains(text(), "Logout"))]


