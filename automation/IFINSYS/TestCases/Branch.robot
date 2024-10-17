*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Variables ***
${TableXpath}                  //table[contains(@class, 'rz-grid-table')]
${FirstRowData}                ${TableXpath}//tr[1]//td[2]//a


*** Keywords ***

Navigate To Branch
    Open Sidebar Menu    Company Information
    Open Sidebar Menu    Branch
    Open To Edit Data
    # ${link}=          Get Element Attribute    ${FirstRowData}    href
    # Run Keyword If    '${link}' == ''          Fail               No link found for element.
    # Go To             ${link}

    Open Wizard   Document


# Add New Branch
#     Open Workbook          files/excel/GeneralCode.xlsx
#     ${rows} =              Read Worksheet                  header=True    start=2
#     ${current_parent} =    Set Variable                    ${EMPTY}

#     FOR                     ${item}         IN                                 @{rows}
#     ${code} =               Set Variable    ${item['Code']}
#     ${description} =        Set Variable    ${item['Description']}
#     ${is_editable} =        Set Variable    ${item['IsEditable']}
#     ${sub_code} =           Set Variable    ${item['General Sub Code']}
#     ${sub_description} =    Set Variable    ${item['Sub Code Description']}
#     ${order_key} =          Set Variable    ${item['OrderKey']}

#     # Check for new parent entry
#     IF                               "${code}" != "${EMPTY}" and "${code}" != "${current_parent}" and "${code}" != "None"
#     Run Keyword If                   "${current_parent}" != "${EMPTY}"                                                       Click Back
#     Click Add
#     Wait Until Element Is Visible    id:ifin-form-txt-code                                                                   timeout=2
#     Input Field                      Code                                                                                    ${code}
#     Input Field                      Description                                                                             ${description}
#     Click Submit
#     ${current_parent} =              Set Variable                                                                            ${code}
#     END

#         # Check for sub-code entry
#     IF                               "${sub_code}" != "${EMPTY}" and "${sub_code}" != "None"
#     Click Add
#     Wait Until Element Is Visible    id:ifin-form-txt-code                                      timeout=2
#     Input Field                      Code                                                       ${sub_code}
#     Input Field                      Description                                                ${sub_description}
#     Input Field                      OrderKey                                                   ${order_key}
#     Click Submit
#     END

#         # Go back to the main page after adding each entry
#     Click Back
#     END
#     Close Workbook
