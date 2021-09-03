SHELL := /bin/bash
arklibgo := ~/ProjectsGo/arkAlias.sh
version = ~/ProjectsGo/arkAlias.sh getlastversion
.PHONY: check

.SILENT: build getlasttag buildzip buildwin


build:
	$(info +Компиляция Linux)
	@echo $$($(version))
	go build -ldflags "-s -w -X 'main.versionProg=$$($(version))'" -o ./bin/main/terminalGUI cmd/main/main.go
buildzip:
	$(info +Компиляция с жатием)
	go build -ldflags "-s -w" -o ./bin/main/terminalGUI cmd/main/main.go
buildwin:
	$(info +Компиляция windows)
	CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc GOOS=windows GOARCH=amd64 go build -o ./bin/main/terminalGUI.exe -tags static -ldflags "-s -w -X 'main.versionProg=$$($(version))' -H=windowsgui" cmd/main/main.go

buildandroid:
	$(info +Компиляция windows)
#	GOOS=android GOARCH=arm CGO_ENABLED=1 CC=x86_64-w64-mingw32-gcc go build -o ./bin/main/imgtxtcolor.apk -tags static -ldflags "-s -w" cmd/main/main.go
	GOOS=android CGO_ENABLED=1  CC=g++ go build -o ./bin/main/terminalGUI.apk cmd/main/main.go
#ANDROID_NDK_HOME=/home/arkadii/Android/Sdk/ndk/22.1.7171670/


#	GOOS=windows GOARCH=amd64 go build -o ./bin/main/wincanvas.exe cmd/app/main/main.go

# run: build

# 	$(info +Запуск)
# 	./bin/main/main -qwert -89  copy -r r234 -w ./e help8 help -help -mm  reverse  addPath -p -44.89 -p -788 -p 879 

# run: build buildwin
# 	$(info +Запуск)
# 	./bin/main/terminalGUI

getlasttag:
	git describe --tags
