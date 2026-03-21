/*
 * Chapter 07: DO Loops and Output
 * 목적: DO 명령어를 활용한 복합 실행, 반복 처리 및 OUTPUT 문을 이용한 데이터 출력 제어 방법 학습
 * 출처: https://wikidocs.net/book/2678
 */
LIBNAME SASTEST "/home/u63652680/my_sas_data";

/* 7-1 기본 DO 명령어 */
/* DO 명령어를 활용하여 여러 가지 명령어를 한번에 시행되도록 할 수 있다 */
/* 예를들어, New라는 명령어를 하나만 만드는 것이 아닌,
 New New1... 등 여러 Column을 하나의 명령어로 작성할 수 있다 */
/* DO 명령어를 쓰지 않고 IF THEN명령어를 사용하는 경우, IF THEN 명령어를 받는 문장은 단 하나이다. */
DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN DO;
NEW='열둘';
NEW2='열두살';
END;
RUN;

/* DO 명령어를 사용하지 않는 경우 예제 */
/* IF THEN이 NEW COLUMN 생성까지만 적용되고, NEW2는 IF 명령어를 받지 못하고, 모든 행에 대해 작동하게 된다. */
DATA TEST;
SET SASHELP.CLASS;
IF AGE=12 THEN
NEW = '열둘';
NEW2= '열두살';
RUN;

/* 7-2 반복 DO 명령어 */
DATA TEST_2;
DO I=1 TO 10 BY 1; /* I의 값을 1부터 10까지 1씩 증가시키도록 한다. */
SUMMARY = I+10; /* I의 값에서 10을 더한 값을 'SUMMARY' COLUMN으로 생성한다. */
OUTPUT; /* 결과 값을 행에 추가한다. */
END; /* DO명령어 종료 */
RUN;

/* OUTPUT이 DO~END 명령에 밖에 작성된 경우 I = 11까지 실행하고, 10을 넘었으니 그 상태로 DO명령어 종료,
SUMMARY는 I=10일 때까지 실행되었으나, I=11을 확인하면서 DO명령어가 종료되는 프로세스의 과정을 거쳤기에,
I=11, SUMMARY=20인 상태의 출력 데이터를 확인할 수 있다 */
DATA TEST_2;
DO I=1 TO 10 BY 1;
SUMMARY = I+10;
END;
OUTPUT;
RUN;

DATA TEST_2;
DO I=1 TO 10 BY 1;
SUMMARY = I+10;
OUTPUT;
END;
OUTPUT;
RUN;

/* 7-3 DO UNTIL / WHILE 명령어 */
/* 프로그램이 진행되면서 자체적으로 DO명령어가 종료되기를 바랄 때 */
DATA TEST;
DO UNTIL (AGE>=4.5);
AGE+1;
DOUBLE = AGE*2;
OUTPUT;
END;
RUN;

DATA TEST;
DO WHILE (AGE<=5.5);
AGE+1;
DOUBLE=AGE*2;
OUTPUT;
END;
RUN;