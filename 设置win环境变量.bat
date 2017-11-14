::关闭回显
@echo off
::没有配置过JDK，要输入JDK路径，否则直接回车即可  
 call set path="%Path%"
 set /p input="请输入java的jdk路径(如果已经配置过直接回车即可):"
 if defined input ( 
	echo 设置JAVA_HOME
	setx "JAVA_HOME" "%input%" -m
	echo 设置CLASSPATH
	setx "CLASSPATH" ".;%%JAVA_HOME%%\lib\tools.jar;%%JAVA_HOME%%\lib\dt.jar" -m
)
  
 set /p input1="请输入tomcat文件夹完整路径(如果已经配置过直接回车即可)"
 if defined input1 ( 
   echo 设置CATALINA_HOME
   setx "CATALINA_HOME" "%input1%" -m
   echo 设置CATALINA_BASE
   setx "CATALINA_BASE" "%input1%" -m
   echo 设置TOMCAT_HOME
   setx "TOMCAT_HOME" "%input1%" -m
)
 
 set /p input2="请输入ant文件夹完整路径(直接回车可跳过设置)"
 if defined input ( 
	echo 设置ANT_HOME
	setx "ANT_HOME" ""%input2%"" -m
 )
echo 设置Path
:: 脱掉path中的引号
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

echo 设置完成
pause
 