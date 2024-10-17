*** Settings ***
Resource   automation/IFINBASE/TestCases/GeneralCode.robot
Resource   automation/IFINBASE/TestCases/Benchmark.robot
Resource   automation/IFINBASE/TestCases/OJKReference.robot


*** Test Cases ***
Login IFINBASE
    [Setup]    Set Selenium Speed    0.2 seconds
    Login To IFINBASE

General Code
    Navigate To General Code
    Add New General Code
    Add New General Code Detail
    Edit General Code
    Edit General Code Detail

Benchmark
    Navigate To Benchmark
    Add New Benchmark
    Add New Benchmark Detail
    Edit Benchmark
    Edit Benchmark Detail

OJK Reference
    Navigate To OJK Reference

