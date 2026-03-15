/*
 * Chapter 06: Combining Datasets (Vertical & Horizontal)
 * 목적: 데이터셋 수직 결합(SET) 및 수평 결합(MERGE) 방법 학습
 	- 수직 결합 시 변수 길이/속성 충돌 해결 (LENGTH 지정 및 자료형 일치)
 	- 수평 결합 시 기준 변수(BY) 활용 및 사전 정렬(PROC SORT)의 중요성 이해
 * 출처: https://wikidocs.net/book/2678
 */
LIBNAME SASTEST "/home/u63652680/my_sas_data";

/* 6-1 테이블 아래로 붙이기 (SET) */
/* 위에 SASHELP.CLASS 데이터를, 아래에 CLASS2의 데이터를 붙인다 */
DATA CLASS2;
LENGTH NAME $20.;
INPUT NAME $ SEX $ AGE HEIGHT WEIGHT;
CARDS;
최철기 M 12 150 50
주양 F 11 130 40
;
RUN;

DATA TEST;
LENGTH NAME $20.;
SET
SASHELP.CLASS
CLASS2;
RUN;

/* 칼럼명이 일치하지 않는 경우 */
/* 칼럼이 새로 생성되며 기존 테이블에 없는 데이터는 빈 칸으로 처리된다 */
DATA CLASS2;
LENGTH NAME $20. ADDR $20.;
INPUT NAME $ AGE HEIGHT WEIGHT ADDR $;
CARDS;
최철기 12 150 50 남대문
주양 11 130 40 서초
;
RUN;

DATA TEST;
LENGTH NAME $20.;
SET
SASHELP.CLASS
CLASS2;
RUN;

/* 칼럼의 길이가 다른 경우 */
/* 두 테이블의 동일 이름 칼럼 간 데이터 길이가 다른 경우 */
/* 앞의 데이터 셋의 LENGTH를 따르기 때문에 뒤의 $30.는 짤림. 해결을 위해 LENGTH를 작성 */
PROC CONTENTS DATA = SASHELP.CLASS;
RUN;

DATA CLASS2;
INPUT NAME :$30. SEX $ AGE HEIGHT WEIGHT;
CARDS;
드레이먼드그린 1 17 207 90
드라트라커즌스 2 21 210 100
;
RUN;

PROC CONTENTS DATA = CLASS2;
RUN;

DATA TEST;
SET
SASHELP.CLASS
CLASS2;
RUN;

DATA TEST;
LENGTH NAME $30.;
SET
SASHELP.CLASS
CLASS2
;
RUN;

/* NAME의 LENGTH가 더 긴 데이터 셋을 앞에 작성해도 해결할 수 있다. */
DATA TEST;
SET
CLASS2
SASHELP.CLASS
;
RUN;

/* 칼럼의 속성이 다른 경우 */
DATA CLASS2;
INPUT NAME :$30. SEX AGE HEIGHT WEIGHT;
CARDS;
드레이먼드그린 1 17 207 90
드마트라커즌스 2 21 210 100
;
RUN;

/*  ERROR: 변수 Sex이(가) 모두 문자와 숫자로 정의되었습니다. */
DATA TEST;
SET
SASHELP.CLASS
CLASS2
;
RUN;

/* 두 변수의 속성이 같아야 제대로 두 데이터를 병합할 수 있다 */
DATA CLASS2;
INPUT NAME :$30. SEX $ AGE HEIGHT WEIGHT;
CARDS;
드레이먼드그린 1 17 207 90
드마트라커즌스 2 21 210 100
;
RUN;

DATA TEST;
SET
SASHELP.CLASS
CLASS2
;
RUN;

/* 6-2  테이블 옆으로 붙이기 (MERGE) */
DATA CLASS3;
LENGTH NAME $30.;
INPUT NAME $ ADDR $ LINE;
CARDS;
John 서울 5
Jordan 부산 6
;
RUN;

DATA TEST;
MERGE
SASHELP.CLASS
CLASS3
;
RUN;

/* 특정 값을 기준으로 붙이기 */
/* SORT로 정렬시킨 뒤 MERGE 해야함에 주의 */
DATA CLASS4;
INPUT NAME $ ADDR $ LINE;
CARDS;
John 부산 산3
Barbara 뉴욕 4
;
RUN;

PROC SORT DATA = SASHELP.CLASS OUT=CLASS;
BY NAME;
RUN;

PROC SORT DATA = CLASS4;
BY NAME;
RUN;

DATA TEST;
MERGE
CLASS
CLASS4;
BY NAME;
RUN;