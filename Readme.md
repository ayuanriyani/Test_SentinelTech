## Document Standardization
- Linter : https://robocop.readthedocs.io/en/stable/rules_list.html#documentation 
- Pull Request Guideline : https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1380384830/Pull+Request+Guideline
- Code Review Guideline : https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1537835043/Code+Review
- Robot Framework API : https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1381761104/Robot+Framework+-+API+Test
- Robot Framework UI : https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1428619296/Robot+Framework+-+UI+Test
- Test Case Structure : https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1518239767/Test+Case+Structure

## Set up
1. Make sure you have already install python & pip, if you want install it : 
   -  macOS : ``` brew install python@3.11 ```
   -  windows / linux : 
         ``` 
            sudo apt update
            sudo apt install python3.11
         ```
2. install posgresql
    - macOS : ``` brew install postgresql ```
    - windows / linux : ```  sudo apt-get install libpq-dev ```
3. install all package using ``` pip install -r ./Docker/requirements.txt ```
4. visit https://lionparcel.atlassian.net/wiki/spaces/PRIN/pages/1428619296/Robot+Framework+-+UI+Test

## StepDefinition
PageObject → contains detailed description of the steps, selector and keywords of TestSuites

in the PageObject folder contains the files. files are grouped according based on page.

format file name : {page-name}_page.robot
ex: account_page.robot

## TestSuites
TestSuites → contains TestsCase Scenario

in the TestSuite folder contains the files. files are grouped according to end to end flow.

format file name : {flow}_tests.robot
ex: test_login_test.robot

Scenario using Gherkin Language (GIVEN WHEN THEN) 

## Each scenario must contain: 
- Title scenario → according to testcase
- [Documentation] → explain the scenario
- [Tags] → for tagging to run script or describe the squad handle, type of scenario, and environment 
   -  Tipe test      (penanda ini case positif atau negatif)
   -  Nama squad     (untuk penanda kepemilikan dan utk mengukur coverage dan success rate per squad)
   -  Service-name   (request dr SRE utk running di pipeline terpisah2 agar tidak terlalu berat, jadi runnning pipeline berdasarkan service saat deployment)
   -  Feature        (filter run test by feature)
``` 
   e.g:  [Tipe-test] [feature]  [Subfeature] [Tag]
          Positive    Login      User    Regression     
```

## How to run test :
```
Staging --> robot -v ENV:STAGING -v BROWSER:CHROME -i [tags-name] [path]
Dev --> robot -v ENV:DEV -v BROWSER:CHROME -i [tags-name] [path]
e.g : robot -v ENV:STAGING -v BROWSER:CHROME -i Booking  automation-web/Genesis/TestSuite/login_test.robot

hedless mode:
Staging --> robot -v ENV:STAGING -v BROWSER:CHROME_HEADLESS -i [tags-name] [path]
Dev --> robot -v ENV:DEV -v BROWSER:CHROME_HEADLESS -i [tags-name] [path]
e.g : robot -v ENV:STAGING -v BROWSER:CHROME_HEADLESS -i Login  automation-web/Genesis/TestSuite/login_test.robot
```