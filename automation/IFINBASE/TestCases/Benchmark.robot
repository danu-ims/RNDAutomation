*** Settings ***
Resource    resources/Base/BaseKeywords.robot


*** Keywords ***
Navigate To Benchmark
    Open Sidebar Menu    Setting
    Open Sidebar Menu    Benchmark

Add New Benchmark
    Click Add
    Input Field    Code    AUTCODE017
    Input Field    Description    AUTDESC017
    Click Submit

Add New Benchmark Detail
    Click Add
    Input Field    EffectiveDate    02/02/2024
    Input Field    Rate    1
    Click Submit
    Click Back

Edit Benchmark
    #Open To Edit Data
    Input Field    Description    AUTDESDESCC017EDITED
    Click Submit
    Click Change Status     Non Active

Edit Benchmark Detail
    Open To Edit Data Eff Date
    Click Back












