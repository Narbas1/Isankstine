;--------------------------------
; isankstine_installer.nsi
;--------------------------------

!include "MUI2.nsh"             ; Use Modern UI

Name "ISANKSTINE"
OutFile "ISANKSTINE_Installer.exe"
RequestExecutionLevel admin     ; Installer requires Administrator rights

;--------------------------------
; 1) Default installation folder
InstallDir "$PROGRAMFILES\ISANKSTINE"
!define MUI_ABORTWARNING
!define MUI_DIRECTORYPAGE      ; Show “Browse for Folder” page

;--------------------------------
; 2) Installer pages
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
; 3) Section: copy files into $INSTDIR
Section "Install Files" SecInstall
  ; Set installation path to whatever user chose (or default)
  SetOutPath "$INSTDIR"

  ; Copy map.exe from build\map.exe
  ; ──────────────────────────────────────
  ; If your map.exe lives directly under build\, use this:
  File "build\map.exe"
  ; If it lives under e.g. build\Debug\, change to:
  ; File "build\Debug\map.exe"
  ; Or if it’s under build\bin\, change to:
  ; File "build\bin\map.exe"

  ; Copy tekstas.txt from project root
  ; ────────────────────────────────────
  File "tekstas.txt"

  ; Write an uninstaller into the same folder
  WriteUninstaller "$INSTDIR\Uninstall.exe"
SectionEnd

;--------------------------------
; 4) Section: Uninstall – remove everything
Section "Uninstall" SecUninstall
  Delete "$INSTDIR\map.exe"
  Delete "$INSTDIR\tekstas.txt"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir "$INSTDIR"
SectionEnd
