PROC SQL;
CREATE TABLE WORK.query AS
SELECT Make , Model , 'Type'n , Origin , DriveTrain , MSRP , Invoice , EngineSize , Cylinders , Horsepower , MPG_City , MPG_Highway , Weight , Wheelbase , 'Length'n FROM SASHELP.CARS;
RUN;
QUIT;

PROC DATASETS NOLIST NODETAILS;
CONTENTS DATA=WORK.query OUT=WORK.details;
RUN;

PROC ANOVA DATA = WORK.query;
CLASS type;
MODEL Horsepower = type;
RUN;

PROC ANOVA DATA = WORK.query;
CLASS type;
MODEL horsepower = type;
MEANS type / tukey lines;
RUN;

PROC PRINT DATA=WORK.details;
RUN;