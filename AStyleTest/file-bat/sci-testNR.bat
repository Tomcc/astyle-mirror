@echo off

set testdata=..\..\TestData\scite

:: set astyle=..\..\AStyle\build\cb-borland\bin\AStyle
:: set astyle=..\..\AStyle\build\cb-dmars\bin\AStyle
:: set astyle=..\..\AStyle\build\cb-mingw\bin\AStyle
:: set astyle=..\..\AStyle\build\vs2003\bin\AStyle
:: set astyle=..\..\AStyle\build\vs2005\bin\AStyle
set astyle=..\..\AStyle\build\vs2008\bin\AStyled

set options= -vRQ
REM indent-blocks (B), add-brackets (j), break-blocks=all (F), align-pointer=type (k1)
:: set options= -CSKBNLwM50m10yejoOcFpPHUxEk1 -vRQ
REM indent-brackets (G), add-one-line-brackets (J), break-blocks (f), align-pointer=middle (k2)
:: set options= -CSKGNLwM50m10yeJoOcfpPHUxEk2 -vRQ


call  libCompile.bat  %astyle%
echo Formatting SciTE %options%

for /d %%v in (scintilla\gtk
               scintilla\include
			   scintilla\macosx
               scintilla\src
               scintilla\win32
			   scite\gtk
               scite\src
               scite\win32)  do (		   
%astyle%  %options%  "%testdata%\%%v\*.cxx"  "%testdata%\%%v\*.h"
)

echo -
pause
