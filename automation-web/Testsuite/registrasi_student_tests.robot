*** Settings ***
Library            SeleniumLibrary
Resource           ../Resources/resources.robot
Resource           ../PageObject/Registrasi/registrasi_student_page.robot
Suite Setup        Apply Environment Configuration
Test Teardown      Close Browser

*** Variables ***
${PATH}        automation-practice-form


*** Test Cases ***
User Student can be successfully created in registration Form
    [Documentation]    TC-001    Full practice form happy path.
    [Tags]    Registrasi    Regression    Positive
    GIVEN User Go To Automation Form
    AND registrasi_student_page.Input Nama Student    Ayu
    AND registrasi_student_page.Input Last Nama Student    Anriyani
    AND registrasi_student_page.Input email    anriyani@gmail.com
    AND registrasi_student_page.Pilih Gender    Female
    AND registrasi_student_page.Input Mobile Phone Number
    AND registrasi_student_page.Pilih Calendar DOB    1993    7    9
    AND registrasi_student_page.Pilih Subjects    Computer Science
    AND registrasi_student_page.Pilih Hobbies    Music
    AND registrasi_student_page.Pilih Picture
    AND registrasi_student_page.Input Current Address
    WHEN registrasi_student_page.Pilih State and City    NCR    Delhi
    AND registrasi_student_page.Click Button Submit
    THEN registrasi_student_page.Validate Successfully to create registration form

User can submit practice form with required fields only
    [Documentation]    TC-002    required fields + state/city, no optional sections.
    [Tags]    Registrasi    Positive    Smoke
    GIVEN User Go To Automation Form
    AND registrasi_student_page.Input Nama Student    Min
    AND registrasi_student_page.Input Last Nama Student    Required
    AND registrasi_student_page.Input email    min.required@example.com
    AND registrasi_student_page.Pilih Gender    Male
    AND registrasi_student_page.Input Mobile Phone Number    9123456789
    WHEN registrasi_student_page.Pilih State and City    NCR    Delhi
    AND registrasi_student_page.Click Button Submit
    THEN registrasi_student_page.Validate Successfully to create registration form

User cannot submit practice form without First Name
    [Documentation]    TC-003    User cannot submit practice form when First Name is empty.
    [Tags]    Registrasi    Negative
    GIVEN User Go To Automation Form
    AND registrasi_student_page.Input Last Nama Student    NoFirst
    AND registrasi_student_page.Input email    nofirst@example.com
    AND registrasi_student_page.Pilih Gender    Other
    AND registrasi_student_page.Input Mobile Phone Number    9988776655
    WHEN registrasi_student_page.Pilih State and City    NCR    Delhi
    AND registrasi_student_page.Click Button Submit
    THEN registrasi_student_page.Validate Success Modal Is Not Visible    5s


*** Keywords ***
User Go To Automation Form
    Open Browser    ${BASE_URL}/${PATH}    ${BROWSER}
    Set Window Size    1920    1200
    Wait Until Element Is Visible    id:userForm    20s

