@echo off
setlocal EnableDelayedExpansion
set CURL=.\curl\curl.exe
set DESTINATION=.\FXCM-gz
:: Uncomment for quicker testing. --range tells curl a (smaller) bytes range to download
:: set RANGE=--range 0-255

if not exist %CURL% (
  echo cUrl executable not found, exiting.
  exit /b
)

if not exist %DESTINATION% mkdir %DESTINATION%

for %%y in (2015,2016,2017) do (
  for %%w in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52) do (
    for %%p in (AUDJPY,AUDNZD,AUDUSD,CADJPY,CHFJPY,EURCHF,EURGBP,EURJPY,EURUSD,GBPJPY,GBPUSD,NZDUSD,USDCAD,USDCHF,USDJPY) do (
      call :mkfname FNAME %%y %%w %%p
      if not exist "%DESTINATION%\!FNAME!" (
        call :mkurl URL %%y %%w %%p !FNAME!
        echo !URL!
        %CURL% %RANGE% --progress-bar --fail --output "%DESTINATION%\!FNAME!" !URL!
      ) else (
        echo !FNAME! exists at destination, skipping
      )
    )
  )
)

goto :eof
:: functions below

:mkfname
:: Expects: result, year, week, pair
set %1=%4-%2-%3.csv.gz
exit /b

:mkurl
:: Expects: result, year, week, pair, filename
:: https://tickdata.fxcorporate.com/{instrument}/{year}/{int of week of year}.csv.gz
:: e.g. https://tickdata.fxcorporate.com/EURUSD/2015/1.csv.gz
:: (described in https://github.com/FXCMAPI/FXCMTickData)
set %1="http://tickdata.fxcorporate.com/%4/%2/%3.csv.gz"
exit /b

:eof
