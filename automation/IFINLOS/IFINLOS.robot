*** Settings ***'
#=============================================================
#Import Test Case Seperti Dibawah ini
# Resource    automation/IFINLOS/TestCases/GeneralCode.robot

#Import Disini


#=============================================================


*** Test Cases ***
IFINDOC
    [Setup]                 Set Selenium Speed    0.2 seconds
    Open Browser & Login    Danu                  Danu
    Open Card               Loan Origination

    #region process
    #==========================




    #==========================
    #region process

    Logout