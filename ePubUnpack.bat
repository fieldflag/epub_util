@echo off
::Apache License 2.0
::ePubUnpack.bat
::epubファイルをカレントフォルダーへ展開(上書き)するためのバッチです
::このバッチファイルに展開したいepubファイルをドロップしてください

::単純起動した場合はエラー
if "%1" == "" (
	echo エラー： epubファイルを当バッチへドロップしてください
	goto last
)

::拡張子が.epubの場合は展開する
if "%~x1%" == ".epub" (
	::epubファイルをテンポラリーフォルダーへコピー
	copy /y %1 C:\Windows\Temp
	
	::拡張子のepubをzipへ変更
	ren C:\Windows\Temp\%~nx1 %~n1.zip

	::カレントフォルダーにepub展開フォルダーを配置
	call powershell -command "Expand-Archive -force C:\Windows\Temp\%~n1.zip %~n1"
	
	::テンポラリーフォルダーにコピーしたファイルの掃除
	del C:\Windows\Temp\%~n1.zip
) else (
	echo エラー： epubファイルではありません
)

:last
echo.
pause
