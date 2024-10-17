*** Settings ***
Library    RPA.Excel.Files
Library    OperatingSystem
Library    Collections

*** Keywords ***
Insert Data Into Excel
    [Arguments]    ${original_file}    ${working_file}    ${start_row}    ${columns_to_fill}    @{data}
    Copy File    ${original_file}    ${working_file}
    Open Workbook    ${working_file}
    ${row}=    Set Variable    ${start_row}
    ${chunk_size}=    Convert To Integer    ${columns_to_fill}
    ${data_length}=    Get Length    ${data}
    FOR    ${i}    IN RANGE    0    ${data_length}    ${chunk_size}
        ${end}=    Evaluate    min(${i} + ${chunk_size}, ${data_length})
        @{row_data}=    Get Slice From List    ${data}    ${i}    ${end}
        Set Row Values    ${row}    @{row_data}
        ${row}=    Evaluate    ${row} + 1
    END
    Save Workbook
    Close Workbook
    Remove File    ${original_file}
    Move File    ${working_file}    ${original_file}

Set Row Values
    [Arguments]    ${row}    @{values}
    ${column}=    Set Variable    1
    FOR    ${value}    IN    @{values}
        Set Cell Value    ${row}    ${column}    ${value}
        ${column}=    Evaluate    ${column} + 1
    END