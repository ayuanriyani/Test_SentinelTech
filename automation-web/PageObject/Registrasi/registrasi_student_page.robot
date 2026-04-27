*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TITLE_FORM}                //h1[contains(text(),"Practice Form")]
${NAME}                      //input[@id="firstName"]
${LAST_NAME}                 //input[@id="lastName"]
${EMAIL}                     //input[@id="userEmail"]
${LIST_GENDER_RADIO}         //div[contains(@id,"genterWrapper")]/div[2]
${MOBILE_NUMBER}             //input[@id="userNumber"]
${SELECT_TAHUN_DOB}          //div//select[@class="react-datepicker__year-select"]
${PILIH_DOB }                //input[@id="dateOfBirthInput"]
${PILIH_SUBJECT}             //input[@class="subjects-auto-complete__input"]
${LIST_HOBBIES_CHECKBOX}     //input[@type="checkbox"]/parent::div
${UPLOAD_PICTURE}            //input[@id="uploadPicture"]
${FILE_FOTO}                 /automation-web/FileTest/bukti_transaksi_1.png
${ALAMAT}                    //textarea[@id="currentAddress"]
${PILIH_STATE}               //div/input[@id="react-select-3-input"]
${LIST_STATE_CITY}           //div[@role="listbox"]
${PILIH_CITY}                //div/input[@id="react-select-4-input"]
${BTN_SUBMIT}                //button[@id="submit"] 
${TITLE_SUCCESS_CREATE}      //div[@id="example-modal-sizes-title-lg"] 
${BTN_CLOSE_AFTER_sUCCESS}   //button[@id="closeLargeModal"]            


*** Keywords ***
registrasi_student_page.Input Nama Student
    [Documentation]    nama student
    [Arguments]    ${value_name}
    Wait Until Element Is Visible    ${NAME}    30s
    Input Text    ${NAME}    ${value_name}

registrasi_student_page.Input Last Nama Student
    [Documentation]    Last nama student
    [Arguments]    ${value_last_name}
    Wait Until Element Is Visible    ${LAST_NAME}
    Input Text    ${LAST_NAME}    ${value_last_name}

registrasi_student_page.Input email
    [Documentation]    Last nama student
    [Arguments]    ${value_email}
    Wait Until Element Is Visible    ${EMAIL}
    Input Text    ${EMAIL}    ${value_email}

registrasi_student_page.Pilih Gender
    [Documentation]    Pilih Gender (Male/Female/Other)
    [Arguments]    ${pilih_gender}
    ${Verify}   Run Keyword And Return Status    Wait Until Element Is Visible    ${LIST_GENDER_RADIO}
    IF    '${Verify}' == 'Male'
        Click Element    ${LIST_GENDER_RADIO}//input[@value="Male"]
    ELSE IF    '${Verify}' == 'Female'
        Click Element    ${LIST_GENDER_RADIO}//input[@value="Female"]
    ELSE
        Click Element    ${LIST_GENDER_RADIO}//input[@value="Other"] 
    END

registrasi_student_page.Input Mobile Phone Number 
    [Documentation]    Input Phone number
    [Arguments]    ${phone_number}=087883000000
    Wait Until Element Is Visible    ${MOBILE_NUMBER}
    Input Text    ${MOBILE_NUMBER}    ${phone_number}

registrasi_student_page.Pilih Calendar DOB
    [Documentation]    Pilih Calendar DOB (Month 0=januari)
    [Arguments]    ${tahun}    ${bulan}    ${hari}
    ${SELECT_YEAR}    Set Variable    //div//select[@class="react-datepicker__year-select"]/option[@value="${tahun}"]
    ${SELECT_MONTH}    Set Variable    //div//select[@class="react-datepicker__month-select"]/option[@value="${bulan}"]
    ${SELECT_DAY}    Set Variable    //div[contains(@class,"react-datepicker__day") and text()="${hari}" and not(contains(@class,"react-datepicker__day--outside-month"))]
    
    Click Element    ${PILIH_DOB }
    Wait Until Element Is Visible    ${SELECT_YEAR} 
    Wait Until Element Is Visible    ${SELECT_MONTH}
    Wait Until Element Is Visible    ${SELECT_DAY}

    Click Element    ${SELECT_YEAR}    
    Click Element    ${SELECT_MONTH}
    Click Element    ${SELECT_DAY}

registrasi_student_page.Pilih Subjects 
    [Documentation]    Pilih subjects
    [Arguments]    ${subject_name}
    Input Text    ${PILIH_SUBJECT}   ${subject_name} 
    ${autocomplete}    Set Variable    //div[contains(@class,"subjects-auto-complete__menu-list")]//div[text()="${subject_name}"]
    Click Element    ${autocomplete}

registrasi_student_page.Pilih Hobbies
    [Documentation]    Pilih Hobbies
    [Arguments]    ${pilih_hobbies}
    Wait Until Element Is Visible    ${LIST_HOBBIES_CHECKBOX}
    ${HOBBIES_IS_sELECTED}    Set Variable    ${LIST_HOBBIES_CHECKBOX}//label[contains(text(),"${pilih_hobbies}")]
    Click Element         ${HOBBIES_IS_sELECTED}

registrasi_student_page.Pilih Picture
    [Documentation]    Pilih Picture
    Log    ${EXECDIR}
    Choose File    ${UPLOAD_PICTURE}    ${EXECDIR}${FILE_FOTO}

registrasi_student_page.Input Current Address
    [Documentation]    iNPUT Alamat
    [Arguments]    ${value_alamat}=Jalan Testing No. 20
    Wait Until Element Is Visible    ${ALAMAT}
    Input Text    ${ALAMAT}    ${value_alamat}

registrasi_student_page.Pilih State and City
    [Documentation]    Select State and City
    [Arguments]    ${select_state}    ${select_city}
    Click Element       ${PILIH_STATE}
    Wait Until Element Is Visible    ${LIST_STATE_CITY}
    ${STATE_IS_SELECTED}    Set Variable    ${LIST_STATE_CITY}//div[contains(text(),"${select_state}")]
    Click Element    ${STATE_IS_SELECTED}


    Click Element       ${PILIH_CITY}
    Wait Until Element Is Visible    ${LIST_STATE_CITY}
    ${CITY_IS_SELECTED}    Set Variable    ${LIST_STATE_CITY}//div[contains(text(),"${select_city}")]
    Click Element    ${CITY_IS_SELECTED}

registrasi_student_page.Click Button Submit
    [Documentation]    Button Submit
    Wait Until Element Is Enabled    ${BTN_SUBMIT}
    Click Element     ${BTN_SUBMIT}

registrasi_student_page.Validate Successfully to create registration form
    [Documentation]    Validate text
    ${result}    Get Text    ${TITLE_SUCCESS_CREATE}
    Should Contain    ${result}    Thanks for submitting the form
    Wait Until Element Is Visible    ${BTN_CLOSE_AFTER_sUCCESS}