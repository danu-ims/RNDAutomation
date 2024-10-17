*** Settings ***
Library      SeleniumLibrary
Library      RPA.Excel.Files
Library      OperatingSystem
Library      RPA.Tables
# Library    String
Library      Collections        # Needed for dictionary operations



*** Variables ***
${BASEURL}    http://147.139.191.88:9100/
#${BASEURL}     http://localhost:5045/
# ${IFINCMS}    http://localhost:5050/login
