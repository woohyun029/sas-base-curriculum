/*
 * Chapter 05: Data Step Processing
 * 목적: DATA STEP에서의 변수 제어(KEEP/DROP), 산술 연산, 그리고 조건문(IF-THEN/ELSE)을 활용한 데이터 필터링 및 칼럼 가공 기법 학습
 * 출처: https://wikidocs.net/book/2678
 */
LIBNAME SASTEST "/home/u63652680/my_sas_data";

/* 5-1 KEEP과 DROP */
/* DATA문에서 KEEP과 SET문에서 KEEP의 차이 인식하기 */
DATA TEST;
SET SASHELP.CLASS(KEEP=NAME AGE);
RUN;

DATA TEST;
SET SASHELP.CLASS(DROP= NAME AGE);
RUN;

DATA TEST(KEEP=NAME AGE);
SET SASHELP.CLASS;
RUN;
/*
[INFILE과 SET의 차이]
- SET문 : SAS 바깥에 있는 일반적인 텍스트 파일(.txt, .csv, .dat)을 SAS 안으로 처음 들여올 때 사용
- INFILE문 : 미 SAS 라이브러리에 저장되어 있는 SAS 전용 데이터셋(.sas7bdat)을 불러올 때 사용
- INFILE에서는 변수정의 (INPUT) 필요 / SET에서는 불필요
[사용시점]
- INFILE은 데이터를 처음 생성할 때
- SET은 이미 라이브러리에 있는 데이터를 가공/합칠 때
*/

/* 5-2 수식을 활용한 계산 */
DATA TEST;
SET SASHELP.CLASS;
AGE2 = AGE + 1;
RUN;

DATA TEST;
SET SASHELP.CLASS;
AGE+1;
AGE2 = AGE+1;
RUN;

/* 5-3 단순 IF구문 */
DATA TEST;
SET SASHELP.CLASS;
IF AGE=12;
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF NAME='Philip';
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE ^=12;
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 AND NAME='John';
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 OR AGE=13;
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE IN (12,13); /* IN구문은 OR문과 같은 방식으로 작동하지만 간편하게 사용 가능하다 */
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE NOT IN (12,13);
RUN;

/* 5-4 IF구문을 활용한 칼럼 변환 */
DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN HEIGHT +300;
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN DELETE; /* 나이가 12세인 데이터 삭제 */
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN NEW='NEW COLUMN'; /* 나이가 12세인 데이터에 새로운 칼럼 NEW를 만들고 안에 NEW COLUMN라고 입력하기 */
RUN;

DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN NEW='NEW1';
ELSE IF AGE=13 THEN NEW='NEW2';
ELSE NEW='NEW';
RUN;
/* IF문 밑에 다시 IF문을 사용하면 IF문이 새롭게 다시 적용된다 
 따라서 ELSE IF / ELSE로 이어서 작성 해야한다. */