*** Settings ***'
#=============================================================
#Import Test Case Seperti Dibawah ini
# Resource    automation/IFINLOS/TestCases/GeneralCode.robot

#Import Disini


#=============================================================


*** Test Cases ***
IFINCMS
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu
    Open Card               Client Management

    #region process
    #==========================


    

    #==========================
    #region process

    Logout