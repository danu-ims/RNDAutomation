*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Navigate To Menu
    Open Sidebar Menu    System Security
    Open Sidebar Menu    Group Role

Add Menu
    Open To Edit Data With Checkbox
    Open Wizard                        Menu Role    
    Click DDL 
    Click Lookup With Search           ModuleID     IFINLOS    

