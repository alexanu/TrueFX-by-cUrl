# TrueFX-by-cUrl
Downloads Forex tick history from TrueFX.com with cUrl. A Windows batch script.
## Prerequisites
You will need [cUrl](https://curl.haxx.se/).
## Getting started
Download and install cUrl.  
Register on [TrueFX.com](http://truefx.com). Try downloading a file with your browser. Sign out.  
Edit the batch file, entering your TrueFX credentials.  
Also enter the path to cUrl executable.  
Optionally, change the destination path.  
Optionally, remove pairs and/or years you don't want to download.  
## How it works
The first call of cUrl signs in to TrueFX.com with "remember me" option and stores logon cookies in a file. Subsequent calls download one file each, looping through years, months and pairs. Finally, the last cUrl call signs out from TrueFX.com.  
## Credits
[cUrl Handbook](https://ec.haxx.se/usingcurl-downloads.html)  
[Windows Batch Scripting wikibook](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
