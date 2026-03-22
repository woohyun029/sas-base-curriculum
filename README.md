# 📊 SAS Base Curriculum Study

SAS 기초 문법부터 데이터 핸들링, SQL 활용까지의 학습 과정을 기록한 저장소입니다.  
**SAS OnDemand for Academics** 환경에서 실습을 진행하였으며, 각 단계별 핵심 문법을 예제 코드와 함께 정리했습니다.

---

## 📌 주요 학습 내용

*   **Data Step 기초**: 데이터 읽기(`INPUT`, `INFILE`), 라이브러리 지정(`LIBNAME`), 데이터셋 생성.
*   **데이터 핸들링**: 변수 제어(`KEEP`, `DROP`), 조건문(`IF-THEN/ELSE`), 반복문(`DO LOOP`).
*   **데이터 결합**: 수직 결합(`SET`) 및 수평 병합(`MERGE`) 시 발생하는 자료형/길이 충돌 해결.
*   **PROC SQL**: ANSI SQL 문법을 활용한 데이터 조회, 집계 및 가공 처리.

---

## 📂 커리큘럼 및 파일 상세

제공된 파일의 실제 코드 내용을 바탕으로 구성되었습니다.

| 번호 | 파일명 | 핵심 명령어 및 학습 내용 |
| :--: | :--- | :--- |
| **01** | [01_SAS_Overview.sas](./01_SAS_Overview.sas) | `DATA`, `SET`, `LIBNAME` (라이브러리 할당 및 데이터셋 복사 기초) |
| **02** | [02_Data_Step_Input.sas](./02_Data_Step_Input.sas) | `PROC SORT`, `PRINT`, `CONTENTS`, `FREQ` (기초 분석 및 조회용 프로시저) |
| **03** | [03_Data_Attributes.sas](./03_Data_Attributes.sas) | `INPUT`, `CARDS`, `INFILE` (직접 입력 및 외부 텍스트/CSV 파일 로드) |
| **04** | [04_Data_Formats.sas](./04_Data_Formats.sas) | `FORMAT`, `LENGTH` (숫자, 문자, 날짜 데이터의 출력 형식 지정) |
| **05** | [05_Data_Step_Processing.sas](./05_Data_Step_Processing.sas) | `KEEP/DROP`, `IF-THEN/ELSE`, `DELETE` (데이터 필터링 및 산술 연산) |
| **06** | [06_Combining_Datasets.sas](./06_Combining_Datasets.sas) | `SET`, `MERGE`, `BY` (데이터셋 상하 결합 및 기준 변수 기반 좌우 병합) |
| **07** | [07_Loops_and_Output.sas](./07_Loops_and_Output.sas) | `DO-END`, `DO WHILE/UNTIL`, `OUTPUT` (반복문 제어 및 결과 행 출력) |
| **08** | [08_PROC_SQL_Basics.sas](./08_PROC_SQL_Basics.sas) | `SELECT`, `GROUP BY`, `HAVING`, `CALCULATED` (SAS 내 SQL 활용 기법) |

---

## 🛠 실습 환경 및 참고 자료

*   **Language**: SAS (Base SAS)
*   **Tool**: SAS OnDemand for Academics
*   **Reference**: [통계분석의 핵심 SAS (WikiDocs)](https://wikidocs.net/book/2678)

---
