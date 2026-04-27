*** Variables ***
${ENV}         STAGING
${BASE_URL}    https://demoqa.com
${BROWSER}     Chrome

*** Keywords ***
Apply Environment Configuration
    [Documentation]    Set BASE_URL from ENV. Both STAGING and DEV use DemoQA for this project; extend URLs here when needed.
    IF    '${ENV}' == 'DEV'
        Set Suite Variable    ${BASE_URL}    https://demoqa.com
    ELSE IF    '${ENV}' == 'STAGING'
        Set Suite Variable    ${BASE_URL}    https://demoqa.com
    ELSE
        Set Suite Variable    ${BASE_URL}    https://demoqa.com
    END
