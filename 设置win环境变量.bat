::�رջ���
@echo off
::û�����ù�JDK��Ҫ����JDK·��������ֱ�ӻس�����  
 call set path="%Path%"
 set /p input="������java��jdk·��(����Ѿ����ù�ֱ�ӻس�����):"
 if defined input ( 
	echo ����JAVA_HOME
	setx "JAVA_HOME" "%input%" -m
	echo ����CLASSPATH
	setx "CLASSPATH" ".;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\lib\dt.jar" -m
)
  
 set /p input1="������tomcat�ļ�������·��(����Ѿ����ù�ֱ�ӻس�����)"
 if defined input1 ( 
   echo ����CATALINA_HOME
   setx "CATALINA_HOME" "%input1%" -m
   echo ����CATALINA_BASE
   setx "CATALINA_BASE" "%input1%" -m
   echo ����TOMCAT_HOME
   setx "TOMCAT_HOME" "%input1%" -m
)
 
 set /p input2="������ant�ļ�������·��(ֱ�ӻس�����������)"
 if defined input ( 
	echo ����ANT_HOME
	setx "ANT_HOME" ""%input2%"" -m
 )
echo ����Path
:: �ѵ�path�е�����
set path_=%Path:"=%
set path_1=;%%JAVA_HOME%%\bin
set path_2=;%%JAVA_HOME%%\jre\bin
set path_3=;%%CATALINA_HOME%%\bin
set path_4=;%%ANT_HOME%%\bin


echo %path_% | findstr /c:"path_1" || set path_=%path_%%path_1%
echo %path_% | findstr /c:"path_2" || set path_=%path_%%path_2%
echo %path_% | findstr /c:"path_3" || set path_=%path_%%path_3%
echo %path_% | findstr /c:"path_4" || set path_=%path_%%path_4%
setx "Path" "%path_%" -m

echo �������
pause
 