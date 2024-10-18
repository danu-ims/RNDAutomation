*** Settings ***
Resource    automation/IFINSYS/TestCases/Branch.robot
Resource    automation/IFINSYS/TestCases/GeneralCode.robot
Resource    automation/IFINSYS/TestCases/Login.robot
Resource    automation/IFINSYS/TestCases/Menu.robot
Resource    resources/Base/ReadDataExcel.robot

*** Test Cases ***
Login IFINSYS

    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu
    Open Card               Config
Branch
    Navigate To Branch
# General Code
#    Navigate To General Code
#    Logout

# Data Excel
#    Open Workbook    files/excel/GeneralCode.xlsx
#    ${rows} =        Read Worksheet                  header=False    start=${3}
#    FOR              ${item}                         IN              @{rows}
#    Log              ${item['B']}
#    Log              ${item['C']}

#    ${RowB}=    Set Variable    ${item['B']}
#    ${RowC}=    Set Variable    ${item['C']}

#    Input Text    id:ifin-form-txt-code           ${RowB}
#    Input Text    id:ifin-form-txt-description    ${RowC}

#    IF     "${RowB}" == "" and "${RowC}" == ""
#    Log    ${item['D']}
#    Log    ${item['E']}
#    Log    ${item['F']}

#    Click Add
#    Input Text      id:ifin-form-txt-code           ${item['D']}
#    Input Text      id:ifin-form-txt-description    ${item['E']}
#    Input Text      id:OrderKey                     ${item['F']}
#    Click Submit
#    Click Back

#    END
#    END
#    Close Workbook




# Menu
    # Navigate To Menu
    # Add Menu

#General Code
    #Navigate To General Code
    #Add New General Code
    # Add New General Code Detail
    # Edit General Code
    # Edit General Code Detail

#Excel
    #@{field_ids}=    Create List    username-field    email-field    password-field

    # Call the Read Excel Data and Process keyword
    # Read Excel Data and Process
    # ...                            file_path=files/excel/GeneralCode.xlsx
    # ...                            sheet_name=Sheet1
    # ...                            start_row=2
    # ...                            columns_to_read=B, C, D
    # ...                            action_keyword=Input Data To Website
    # ...                            action_args=${field_ids}