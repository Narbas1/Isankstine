;--------------------------------
; isankstine_installer.nsi
;--------------------------------

!include "MUI2.nsh"             ; Modern UI

Name "ISANKSTINE"
OutFile "ISANKSTINE_Installer.exe"
RequestExecutionLevel admin     ; Ask for Administrator rights

; 1) Default installation directory
InstallDir "$PROGRAMFILES\ISANKSTINE"
!define MUI_ABORTWARNING
!define MUI_DIRECTORYPAGE      ; Let user pick or confirm install folder

; 2) Installer pages
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
; 3) “Install Files” section
Section "Install Files" SecInstall
  SetOutPath "$INSTDIR"

  ; Copy both executables from build\
  File "build\map.exe"
  File "build\tekstas.txt"

  ; Write the uninstaller into the same folder
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

;--------------------------------
; 4) “Uninstall” section
Section "Uninstall" SecUninstall
  Delete "$INSTDIR\map.exe"
  Delete "$INSTDIR\tekstas.txt"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
SectionEnd
