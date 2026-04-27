*** Settings ***
Library            SeleniumLibrary
Resource           ../Resources/resources.robot
Resource           ../PageObject/Registrasi/registrasi_student_page.robot
Test Teardown      Close Browser

*** Variables ***
${PATH}        automation-practice-form


*** Test Cases ***
User Student can be successfully created in registration Form
    [Documentation]    TC-001    User successully created in registration form
    [Tags]    Registrasi    Regression    Positive
    GIVEN User Go To Automation Form
    AND registrasi_student_page.Input Nama Student  Ayu  
    AND registrasi_student_page.Input Last Nama Student    Anriyani    
    AND registrasi_student_page.Input email    anriyani@gmail.com
    AND registrasi_student_page.Pilih Gender    Female
    AND registrasi_student_page.Input Mobile Phone Number
    AND registrasi_student_page.Pilih Calendar DOB    1993    8    9
    AND registrasi_student_page.Pilih Subjects    Computer Science
    AND registrasi_student_page.Pilih Hobbies    Music
    AND registrasi_student_page.Pilih Picture
    AND registrasi_student_page.Input Current Address  
    WHEN registrasi_student_page.Pilih State and City   NCR    Delhi
    AND registrasi_student_page.Click Button Submit
    THEN registrasi_student_page.Validate Successfully to create registration form


*** Keywords ***
User Go To Automation Form
    Open Browser    ${BASE_URL}/${PATH}    ${BROWSER}
    Maximize Browser Window