@echo off
::Apache License 2.0
::ePubPack.bat
::epub�t�H���_��epub�t�@�C���֕ϊ����邽�߂̃o�b�`�ł�
::���̃o�b�`�t�@�C���ɕϊ�������epub�t�H���_���h���b�v���Ă�������
::���o�b�`�����삷��ɂ́Azip.exe���K�v�ł��̂Ő��
::https://github.com/LuaDist/zip/tags
::�̃T�C�g����zip.exe���_�E�����[�h���Aepub�t�H���_�����݂���K�w�֔z�u���Ă����K�v������܂��B

::�P���N�������ꍇ�̓G���[
if "%1" == "" (
	echo �G���[�F epub�t�H���_�𓖃o�b�`�փh���b�v���Ă�������
	goto last
)

set arg_folder=%~n1%

if not exist "%arg_folder%\mimetype" (
	echo �G���[�F epub�t�H���_�[�������ɓn���Ă�������
	goto last
)

if not exist ".\%arg_folder%.epub" (
	cd .\%arg_folder%
	..\zip -0 -X ..\%arg_folder%.epub mimetype
	..\zip -r ..\%arg_folder%.epub * -x mimetype
	echo.
	echo output %arg_folder%.epub
) else (
	echo �G���[�F %arg_folder%.epub�t�@�C�������ɑ��݂��܂�
	echo �G���[�F �����͒��f����܂���
)

:last
echo.
pause
