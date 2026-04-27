# Automation Testing — Robot Framework (DemoQA Practice Form)

## Prerequisites

- Python 3.x
- Robot Framework (`pip install robotframework robotframework-seleniumlibrary`)
- Browser driver for Chrome (e.g. managed by Selenium Manager / Selenium 4+)
- Java (if required by your Selenium setup)

## Clone

`https://github.com/ayuanriyani/Test_SentinelTech.git`

## Run from repository root

Change to the project root (folder that contains `automation-web`), then run:

**Staging**

```text
robot -v ENV:STAGING -v BROWSER:Chrome -i Regression automation-web/Testsuite/registrasi_student_tests.robot
```

**Dev** (same DemoQA base URL in this project; `ENV` is wired for future hosts)

```text
robot -v ENV:DEV -v BROWSER:Chrome -i Smoke automation-web/Testsuite/registrasi_student_tests.robot
```

**Headless** (example)

```text
robot -v ENV:STAGING -v BROWSER:headlesschrome -i Regression automation-web/Testsuite/registrasi_student_tests.robot
```

Optional variables:

- `ENV` — `STAGING` or `DEV` (selects `BASE_URL` in `automation-web/Resources/resources.robot`)
- `BROWSER` — e.g. `Chrome`, `headlesschrome` (SeleniumLibrary naming)

## Reports

Robot writes `log.html`, `report.html`, and `output.xml` in the working directory unless you pass `--outputdir`.

![Sample report](https://github.com/user-attachments/assets/933c42dc-f32a-4a22-afb5-9b5e0cf49964)

## More on Robot Framework

[https://robotframework.org/](https://robotframework.org/)

For changes, open an issue or a pull request.
