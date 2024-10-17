*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINBASE
    Open Browser & Login    Danu    Danu
    Open Card               Base

Navigate To General Code
    Open Sidebar Menu    Setting
    Open Sidebar Menu    General Code

Add New General Code
    Click Add
    Input Field     Code           AUTCODE018
    Input Field      Description    AUTDESC018
    Click Submit

Add New General Code Detail
    Click Add
    Input Field      Code           AUTCODEDESC018
    Input Field      Description    AUTDESDESCC018
    Input Field      OrderKey       1
    Click Submit
    Click Back

Edit General Code
    Input Field             Description     AUTDESDESCC018EDITED
    Click Submit
    Click Change Status    Non Editable

Edit General Code Detail
    Open To Edit Data
    Input Field             Description    AUTDESDESCC018EDITED
    Click Submit
    Click Change Status    Non Active
    Click Back
    Click Back

