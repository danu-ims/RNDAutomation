*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Library    SeleniumLibrary
Library    OperatingSystem
Library    RPA.Tables
Library    String

*** Keywords ***
Read Excel Data and Process

   
    
    Open Workbook    files/excel/GeneralCode.xlsx
    ${table_data}=    Read Worksheet As Table    ${SHEET_NAME}    header=True
    Log Many    ${table_data}  # Log entire table content
    FOR    ${row}    IN    @{table_data}
        Log    Code: ${row['Code']}, Description: ${row['Description']}, IsEditable: ${row['IsEditable']}
    END
    Close Workbook



    # Create Webdriver                 Firefox
    # Open Browser                     ${BASEURL}
    # Maximize Browser Window
    # Wait Until Element Is Visible    id:UserName


    # Open Workbook    files/excel/GeneralCode.xlsx
    # ${rows} =        Read Worksheet                  header=False    start=${3}
    # FOR              ${item}                         IN              @{rows}
    # Input Text       id:UserName                     ${item['B']}
    # Log              ${item['B'][1]}
    # Log              ${item['C']}
    # Log              ${item['D']}

    # END
    # Close Workbook
