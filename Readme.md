# Automation Testing — Robot Framework (DemoQA Practice Form)

## Prerequisites

- Python 3.x
- Robot Framework (`pip install robotframework robotframework-seleniumlibrary`)
- Browser driver for Chrome (e.g. managed by Selenium Manager / Selenium 4+)
- Java (if required by your Selenium setup)

## Clone

`https://github.com/ayuanriyani/Test_SentinelTech.git`

## Struktur folder

Struktur berikut mencerminkan isi kerja di workspace (bukan artefak lokal seperti `log.html` / `output.xml` hasil menjalankan Robot).

**Catatan Git:** di `.gitignore` ada pola `*.png` dan `*.pdf`, jadi `automation-web/FileTest/bukti_transaksi_1.png` dan `Automation Test.pdf` bisa **tidak ikut** saat clone jika tidak pernah di-commit. Siapkan file tersebut secara lokal untuk tes upload, atau sesuaikan ignore jika memang harus disertakan di repo.

```text
SentinelTech-AT/
├── .gitignore
├── Automation Test.pdf
├── PythonLibrary.py
├── Readme.md
├── run_tests.sh
└── automation-web/
    ├── FileTest/
    │   └── bukti_transaksi_1.png
    ├── PageObject/
    │   └── Registrasi/
    │       └── registrasi_student_page.robot
    ├── Resources/
    │   └── resources.robot
    └── Testsuite/
        └── registrasi_student_tests.robot
```

| Lokasi | Keterangan singkat |
|--------|---------------------|
| `automation-web/Testsuite/` | Suite tes Robot (skenario & alur). |
| `automation-web/PageObject/` | Page Object: lokator & keyword per halaman/modul. |
| `automation-web/Resources/` | Variabel lingkungan (`BASE_URL`, `BROWSER`, `ENV`) dan konfigurasi bersama. |
| `automation-web/FileTest/` | Aset uji (mis. gambar untuk upload form). |
| `run_tests.sh` | Skrip **POSIX shell** untuk **Pabot** + `args.txt` (bukan `robot` langsung). Butuh `pabot` terpisah (`pip install robotframework-pabot`). Contoh dari root repo (Git Bash / WSL / Linux): `./run_tests.sh automation-web/Testsuite/registrasi_student_tests.robot` — skrip ini memakai default `BROWSER` headless di `args.txt`; untuk menyamakan dengan perintah `robot` di bawah, override dengan `-v BROWSER:Chrome` sesuai parser skrip. |
| `PythonLibrary.py` | Library Python umum; **suite DemoQA saat ini tidak meng-import** file ini. |

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


## Reports

Robot writes `log.html`, `report.html`, and `output.xml` in the working directory unless you pass `--outputdir`.

![Sample report](https://github.com/user-attachments/assets/933c42dc-f32a-4a22-afb5-9b5e0cf49964)

## More on Robot Framework

[https://robotframework.org/](https://robotframework.org/)

For changes, open an issue or a pull request.
