# AUTOMATION TESTING - ROBOT FRAMEWORK 
### Prerequisites
    - Robotframework
    - Java 
    - VS Code

### Clone this repository
    https://github.com/ayuanriyani/Test_SentinelTech.git

### Before run the test , please select to location test 
    example :   cd /Automationn-Web
    
## How to run test :
```
Staging --> robot -v ENV:STAGING -v BROWSER:CHROME -i [tags-name] [path]
Dev --> robot -v ENV:DEV -v BROWSER:CHROME -i [tags-name] [path]
e.g : robot -v ENV:STAGING -v BROWSER:CHROME -i Regression  automation-web/TestSuite/registrasi_student.robot

hedless mode:
Staging --> robot -v ENV:STAGING -v BROWSER:CHROME_HEADLESS -i [tags-name] [path]
Dev --> robot -v ENV:DEV -v BROWSER:CHROME_HEADLESS -i [tags-name] [path]
e.g : robot -v ENV:STAGING -v BROWSER:CHROME_HEADLESS -i Regression  automation-web/TestSuite/registrasi_student.robot


### Please See Recommandation for installed

    https://robotframework.org/

*For any requests or changes please open issues or create pull requests :)*

```
