@echo off

set name=%2%

if ""%1"" == ""ls"" goto list
if ""%1"" == ""list"" goto list

if ""%1"" == ""on"" goto start
if ""%1"" == ""start"" goto start

if ""%1"" == ""off"" goto stop
if ""%1"" == ""stop"" goto stop

if ""%1"" == ""reset"" goto restart
if ""%1"" == ""restart"" goto restart

if ""%1"" == """" goto usage

goto usage


:: 列表
:list
	echo.
	echo all vm list
	echo ----------------------------------------------------------
	VBoxManage list vms
	
	echo.
	echo running list
	echo -----------------------------------------------------------
	VBoxManage list runningvms

	goto end
:: 启动
:start
	echo.
	echo start %name% ......
	VBoxManage startvm %name%
	
	goto list
	
:: 停止
:stop
	echo.
	echo stop %name% ......
	VBoxManage controlvm  %name% poweroff

	goto list
	
:: 重启
:restart
	echo.
	echo restart %name% ......
	VBoxManage controlvm  %name% reset
	
	goto list
	
:: 使用帮助
:usage
	echo.
	echo   usage:
	echo         vm on/off/reset/ls         [vm_name]
	echo         vm start/stop/restart/list [vm_name]

	goto end

:end