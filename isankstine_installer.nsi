;--------------------------------
; isankstine_installer.nsi
;--------------------------------

!include "MUI2.nsh"             ; Modern UI

Name "ISANKSTINE"
OutFile "ISANKSTINE_Installer.exe"
RequestExecutionLevel admin     ; Ask for Administrator rights

; 1) Default installation folder (user can change if they want)
InstallDir "$PROGRAMFILES\ISANKSTINE"
!define MUI_ABORTWARNING
!define MUI_DIRECTORYPAGE      ; Show folder-selection page

; 2) Installer pages
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

Section "Install Files" SecInstall
  ; Set the output folder to whatever the user chose (or default)
  SetOutPath "$INSTDIR"

  ; Copy map.exe (which must live in the same folder as this .nsi)
  File "map.exe"

  ; Copy tekstas.txt (also must live in the same folder as this .nsi)
  File "tekstas.txt"

  ; Write Uninstall.exe into the install folder
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

Section "Uninstall" SecUninstall
  ; Delete those files and remove the folder
  Delete "$INSTDIR\map.exe"
  Delete "$INSTDIR\tekstas.txt"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
SectionEnd
