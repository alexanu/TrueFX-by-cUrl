@echo off
setlocal EnableDelayedExpansion
set CURL=.\curl\curl.exe
set DESTINATION=.\TrueFX-ZIP
:: Uncomment for quicker testing. --range tells curl a (smaller) bytes range to download
:: set RANGE=--range 0-255

if not exist %CURL% (
  echo cUrl executable not found, exiting.
  exit /b
)

if not exist %DESTINATION% mkdir %DESTINATION%

set MONTHS[01]=JANUARY
set MONTHS[02]=FEBRUARY
set MONTHS[03]=MARCH
set MONTHS[04]=APRIL
set MONTHS[05]=MAY
set MONTHS[06]=JUNE
set MONTHS[07]=JULY
set MONTHS[08]=AUGUST
set MONTHS[09]=SEPTEMBER
set MONTHS[10]=OCTOBER
set MONTHS[11]=NOVEMBER
set MONTHS[12]=DECEMBER

:: When coding this in 2016,
::  earliest available files were from May 2009;
::  available pairs were AUDJPY,AUDNZD,AUDUSD,CADJPY,CHFJPY,EURCHF,EURGBP,EURJPY,EURUSD,GBPJPY,GBPUSD,NZDUSD,USDCAD,USDCHF,USDJPY
for %%y in (2017,2016,2015,2014,2013,2012,2011,2010,2009) do (
  for %%m in (12,11,10,09,08,07,06,05,04,03,02,01) do (
    for %%p in (AUDJPY,AUDNZD,AUDUSD,CADJPY,CHFJPY,EURCHF,EURGBP,EURJPY,EURUSD,GBPJPY,GBPUSD,NZDUSD,USDCAD,USDCHF,USDJPY) do (
      call :mkfname FNAME %%y %%m %%p
      if not exist "%DESTINATION%\!FNAME!" (
        call :mkurl URL %%y %%m %%p !FNAME!
        echo !URL!
        %CURL% %RANGE% --insecure --progress-bar --fail --output "%DESTINATION%\!FNAME!" !URL!
      ) else (
        echo !FNAME! exists at destination, skipping
      )
    )
  )
)

:mkfname
:: Expects: result, year, month, pair
set %1=%4-%2-%3.zip
exit /b

:mkurl
:: Expects: result, year, month, pair, filename
:: There was a change in URL format in April 2017
::   https://www.truefx.com/dev/data//2017/MARCH-2017/USDJPY-2017-03.zip
::   https://www.truefx.com/dev/data//2017/2017-04/USDJPY-2017-04.zip
::   (link structure borrowed from https://pepperstone.com/en/client-resources/historical-tick-data)
if %2 leq 2016 goto :chrmonth
if %2 geq 2018 goto :nummonth
if %3 leq 03 goto :chrmonth
:nummonth
set %1="https://www.truefx.com/dev/data//%2/%2-%3/%5"
goto :endmkurl
:chrmonth
set %1="https://www.truefx.com/dev/data//%2/!MONTHS[%3]!-%2/%5"
:endmkurl
exit /b

:eof
