@echo off
::Apache License 2.0
::ePubPack.bat
::epubフォルダをepubファイルへ変換するためのバッチです
::このバッチファイルに変換したいepubフォルダをドロップしてください
::当バッチが動作するには、zip.exeが必要ですので先に
::https://github.com/LuaDist/zip/tags
::のサイトからzip.exeをダウンロードし、epubフォルダが存在する階層へ配置しておく必要があります。

::単純起動した場合はエラー
if "%1" == "" (
	echo エラー： epubフォルダを当バッチへドロップしてください
	goto last
)

set arg_folder=%~n1%

if not exist "%arg_folder%\mimetype" (
	echo エラー： epubフォルダーを引数に渡してください
	goto last
)

if not exist ".\%arg_folder%.epub" (
	cd .\%arg_folder%
	..\zip -0 -X ..\%arg_folder%.epub mimetype
	..\zip -r ..\%arg_folder%.epub * -x mimetype
	echo.
	echo output %arg_folder%.epub
) else (
	echo エラー： %arg_folder%.epubファイルが既に存在します
	echo エラー： 処理は中断されました
)

:last
echo.
pause
