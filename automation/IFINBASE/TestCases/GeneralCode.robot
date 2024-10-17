*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Add New General Code
    Click Add
    Input Field     Code           AUTCODE018
    Input Field     Description    AUTDESC018
    Click Submit