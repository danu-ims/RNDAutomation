*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Variables ***
# ${TableXpath}      //table[contains(@class, 'rz-grid-table')]
# ${FirstRowData}    ${TableXpath}//tr[1]//td[2]//a


*** Keywords ***
Navigate To Branch
    Open Sidebar Menu    Company Information
    Open Sidebar Menu    Branch
    Add New Branch
    # Open To Edit Data
    # ${link}=          Get Element Attribute    ${FirstRowData}    href
    # Run Keyword If    '${link}' == ''          Fail               No link found for element.
    # Go To             ${link}

    # Open Wizard   Document


Add New Branch
    Open Workbook          files/excel/Branch.xlsx
    ${rows} =              Read Worksheet             header=True    start=2
    ${current_parent} =    Set Variable               ${EMPTY}

    FOR              ${item}         IN                     @{rows}
    ${code} =        Set Variable    ${item['Code']}
    ${Type} =        Set Variable    ${item['Type']}
    ${Syariah} =     Set Variable    ${item['Syariah']}
    ${IsActive} =    Set Variable    ${item['IsActive']}
    ${Name} =        Set Variable    ${item['Name']}
    ${PhoneNo} =     Set Variable    ${item['PhoneNo']}
    ${Region} =      Set Variable    ${item['Region']}
    ${Province} =    Set Variable    ${item['Province']}
    ${City} =        Set Variable    ${item['City']}
    ${ZipCode} =     Set Variable    ${item['ZipCode']}
    ${RT} =          Set Variable    ${item['RT']}
    ${RW} =          Set Variable    ${item['RW']}
    ${Address} =     Set Variable    ${item['Address']}

    ${CodeParameter} =    Set Variable    ${item['CodeParameter']}
    ${Description} =      Set Variable    ${item['Description']}
    ${Value} =            Set Variable    ${item['Value']}

    ${DocumentType} =     Set Variable    ${item['DocumentType']}
    ${DocumentNo} =       Set Variable    ${item['DocumentNo']}
    ${EffectiveDate} =    Set Variable    ${item['EffectiveDate']}
    ${ExpiredDate} =      Set Variable    ${item['ExpiredDate']}

    # Check for new parent entry
    IF                               "${code}" != "${EMPTY}" and "${code}" != "${current_parent}" and "${code}" != "None"
    Run Keyword If                   "${current_parent}" != "${EMPTY}"                                                       Click Back
    Click Add
    Wait Until Element Is Visible    id:ifin-form-txt-code                                                                   timeout=2
    Input Field                      Code                                                                                    ${code}
    Click DDL                        ifin-form-ddl-branchtype                                                                ${Type}
    Click Switch                     IsSyariah
    
    Click Switch                     IsActive
    Input Field                      Name                                                                                    ${Name}
    Input Field                      PhoneNo                                                                                 ${PhoneNo}
    Click Lookup With Search         SysRegionBranchID                                                                       ${Region}
    Click Lookup With Search         SysProvinceID                                                                           ${Province}
    Click Lookup With Search         SysCityID                                                                               ${City}
    Click Lookup With Search         SysZipCodeID                                                                            ${ZipCode}
    Input Field                      Rt                                                                                      ${RT}
    Input Field                      Rw                                                                                      ${RW}
    Input Field                      Address                                                                                 ${Address}
    Click Submit
    ${current_parent} =              Set Variable                                                                            ${code}
    END

        # Check for sub entry
    IF                               "${CodeParameter}" != "${EMPTY}" and "${CodeParameter}" != "None"
    Open Wizard                      Parameter
    Click Add
    Wait Until Element Is Visible    id:ifin-form-txt-code                                                timeout=2
    Input Field                      Code                                                                 ${CodeParameter}
    Input Field                      Description                                                          ${Description}
    Input Field                      Value                                                                ${Value}
    Click Submit
    Open Wizard                      Parameter
    END

        # Check for sub entry 2
    IF                               "${DocumentType}" != "${EMPTY}" and "${DocumentType}" != "None"
    Open Wizard                      Document
    Click Add
    Click Lookup With Search         DocTypeID                                                          ${DocumentType}
    Input Field                      DocNo                                                              ${DocumentNo}
    Wait Until Element Is Visible    //input[@id='EffDate']/following-sibling::button
    Click Element                    //input[@id='EffDate']/following-sibling::button
    Wait Until Element Is Visible    //span[text()='15']
    Click Element                    //span[text()='15']
    Wait Until Element Is Visible    //input[@id='ExpDate']/following-sibling::button
    Click Element                    //input[@id='ExpDate']/following-sibling::button
    Wait Until Element Is Visible    //span[text()='17']
    Click Element                    //span[text()='17']
    # ${ReformatEffectiveDate}    Convert Date                                                       ${EffectiveDate}            result_format=%d/%m/%Y
    # ${ReformatExpiredDate}      Convert Date                                                       ${ExpiredDate}              result_format=%d/%m/%Y
    # Input Field                 EffDate                                                            ${ReformatEffectiveDate}
    # Input Field                 ExpDate                                                            ${ReformatExpiredDate}
    Click Submit
    END

    Click Back
    END
    Close Workbook
