LIBNAME SASTEST "/home/u63652680/my_sas_data";

/* 3-1. 직접 테이블 생성법 */
DATA TEST;
	/* NAME 변수를 읽을 때 최대 30바이트까지 읽도록 지정 */
	/* UTF-8에서 한글 한 글자는 3바이트 차지, 숫자와 영어 한 글자는 1바이트 차지 */
	INPUT NAME: $30. AGE SEX $;
	CARDS;
OK 1 남
YOU 2 여
가나다마바사 3 남
;
RUN;

/* 3-2. 외부 데이터를 불러와서 테이블 생성하기 */
DATA TEST;
	INFILE '/home/u63652680/my_sas_data/test.txt' DLM=',' ENCODING="utf-8";
	INPUT NAME: $12. AGE SEX $;
RUN;

/* 3-3. 테이블을 불러와서 새 테이블 생성하기 */
/* 만들어진 테이블을 가공하기 */
DATA TEST;
SET SASHELP.CLASS;
RUN;