@echo off
::Apache License 2.0
::ePubUnpack.bat
::epub�t�@�C�����J�����g�t�H���_�[�֓W�J(�㏑��)���邽�߂̃o�b�`�ł�
::���̃o�b�`�t�@�C���ɓW�J������epub�t�@�C�����h���b�v���Ă�������

::�P���N�������ꍇ�̓G���[
if "%1" == "" (
	echo �G���[�F epub�t�@�C���𓖃o�b�`�փh���b�v���Ă�������
	goto last
)

::�g���q��.epub�̏ꍇ�͓W�J����
if "%~x1%" == ".epub" (
	::epub�t�@�C�����e���|�����[�t�H���_�[�փR�s�[
	copy /y %1 C:\Windows\Temp
	
	::�g���q��epub��zip�֕ύX
	ren C:\Windows\Temp\%~nx1 %~n1.zip

	::�J�����g�t�H���_�[��epub�W�J�t�H���_�[��z�u
	call powershell -command "Expand-Archive -force C:\Windows\Temp\%~n1.zip %~n1"
	
	::�e���|�����[�t�H���_�[�ɃR�s�[�����t�@�C���̑|��
	del C:\Windows\Temp\%~n1.zip
) else (
	echo �G���[�F epub�t�@�C���ł͂���܂���
)

:last
echo.
pause
