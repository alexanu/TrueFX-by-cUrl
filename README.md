# TrueFX-by-cUrl
Downloads Forex tick history from TrueFX.com with cUrl. A Windows batch script.
## Prerequisites
You will need [cUrl](https://curl.haxx.se/).
## The Two Variants
_curl-truefx-dwnl.bat_ downloads files by links provided on http://truefx.com/?page=downloads  
_curl-truefx-dwnl-pepper.bat_ downloads same files by links provided on https://pepperstone.com/en/client-resources/historical-tick-data (but http instead of https)
## Getting started
* Download and install cUrl.  
* Decide if you are going to use _curl-truefx-dwnl.bat_ or _curl-truefx-dwnl-pepper.bat_. You only need one of two.    
* If going for _curl-truefx-dwnl.bat_:  
register on [TrueFX.com](http://truefx.com); try downloading a file with your browser; sign out;  
edit _curl-truefx-dwnl.bat_, entering your TrueFX credentials.  
* Also enter the path to cUrl executable.  
* Optionally, change the destination path.  
* Optionally, remove pairs and/or years you don't want to download.  
## How it works
_curl-truefx-dwnl.bat_  
The first call of cUrl signs in to TrueFX.com with "remember me" option and stores logon cookies in a file. Subsequent calls download one file each, looping through years, months and pairs. Finally, the last cUrl call signs out from TrueFX.com.  
_curl-truefx-dwnl-pepper.bat_
Same but without sign in, cookies and sign out.  
## Credits
[cUrl Handbook](https://ec.haxx.se/usingcurl-downloads.html)  
[Windows Batch Scripting wikibook](https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
## License: BSD-3-Clause
Copyright 2017 webradio  
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:  
1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.  
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.  
3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.  
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
