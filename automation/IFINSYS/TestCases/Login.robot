*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Login To IFINSYS
    Open Browser & Login    Yaqi      Yaqi
    Open Card               Config