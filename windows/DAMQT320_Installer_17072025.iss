; Includes minimal Cygwin, MPI, Qt5, MinGW, Python scripts, icons, and multilanguage support
; Inno Setup script for DAMQT 3.2.0 - with ZIP-based Cygwin installation
; Inno Setup script for DAMQT 3.2.0 with Cygwin MPI support
#define MyAppName "DAMQT320"
#define MyAppVersion "3.2.0"
#define MyAppExeName "DAMQT320.exe"
#define MyAppBatName "DAMQT320.bat"
#define MyShortAppName "DAMQT320"
#define MyLongAppName "DAMQT320"
#define DAMGUI320_DIR "D:\DAMQT\src\DAMGUI320"
#define DAMGUI320_EXEC_DIR "D:\DAMQT\build_mingw64_15072025\src\DAMGUI320"
#define FORTRAN_DIR "D:\DAMQT\build_mingw64_15072025\src"
#define FORTRAN_MPI_DIR "D:\DAMQT\build_cygwin_15072025\src"
#define IMAGES_DIR "D:\DAMQT\src\DAMGUI320\images"
#define INTERFACES_DIR "D:\DAMQT\src\interfaces_320"
#define LICENSE_DIR "D:\DAMQT\license"
#define MANUAL_DIR "D:\DAMQT\doc\manual"
#define MINGW_DLL_DIR "D:\msys64\mingw64\bin"
#define OPENGL32_DIR "C:\Windows\SYSTEM32"
#define OUTPUT_DIR "D:\DAMQT\windows"
#define QT_BIN_DIR "D:\msys64\mingw64\bin"
#define QT_PLATFORMS_DIR "D:\msys64\mingw64\share\qt5\plugins\platforms"
#define INI_DataDirKey "DataDirectory"

[Setup]
AppId={{213E4C51-B461-4E57-8996-89C6D13C4FDD}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
DefaultDirName={userappdata}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile="{#LICENSE_DIR}\COPYING"
OutputDir="{#OUTPUT_DIR}"
Compression=lzma
SolidCompression=yes
OutputBaseFilename=DAMQT320_Setup
SetupIconFile="{#IMAGES_DIR}\damqt.ico"
UninstallDisplayIcon="{app}\damqt.ico"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Dirs]

[Files]
; Main application files
Source: "{#DAMGUI320_EXEC_DIR}\DAMQT320.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#DAMGUI320_DIR}\run_mpi.sh"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#IMAGES_DIR}\damqt.ico"; DestDir: "{app}"; Flags: ignoreversion

; Qt libraries
Source: "{#QT_BIN_DIR}\Qt5Core.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QT_BIN_DIR}\Qt5Gui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QT_BIN_DIR}\Qt5Widgets.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QT_BIN_DIR}\Qt5OpenGL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#QT_BIN_DIR}\Qt5PrintSupport.dll"; DestDir: "{app}"; Flags: ignoreversion

; Qt platform plugin
Source: "{#QT_PLATFORMS_DIR}\qwindows.dll"; DestDir: "{app}\platforms"; Flags: ignoreversion

; MinGW runtime libraries
Source: "{#MINGW_DLL_DIR}\libbz2-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libdouble-conversion.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libfreetype-6.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libgcc_s_seh-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libgfortran-5.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libglib-2.0-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libgraphite2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libharfbuzz-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libbrotlicommon.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libbrotlidec.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libiconv-2.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libicudt76.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libicuin76.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libicuuc76.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libintl-8.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libmd4c.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libpcre-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libpcre16-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libpcre2-16-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libpng16-16.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libpcre2-8-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libquadmath-0.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libstdc++-6.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libwinpthread-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\zlib1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MINGW_DLL_DIR}\libzstd.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#OPENGL32_DIR}\OPENGL32.dll"; DestDir: "{app}"; Flags: ignoreversion

; Fortran executables
Source: "{#FORTRAN_DIR}\DAM320\*.exe"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "{#FORTRAN_DIR}\TDAM320\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FORTRAN_DIR}\interfaces_320\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FORTRAN_DIR}\DAMZernike320\*.exe"; DestDir: "{app}"; Flags: ignoreversion

; MPI Fortran executables
Source: "{#FORTRAN_MPI_DIR}\DAM320_mpi\*.exe"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
Source: "{#FORTRAN_MPI_DIR}\TDAM320_mpi\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#FORTRAN_MPI_DIR}\DAMZernike320_mpi\*.exe"; DestDir: "{app}"; Flags: ignoreversion

; Python scripts
Source: "{#INTERFACES_DIR}\MOLPRO_xml_interface.py"; DestDir: "{app}\py"; Flags: ignoreversion
Source: "{#INTERFACES_DIR}\MOPAC_aux_interface.py"; DestDir: "{app}\py"; Flags: ignoreversion

; Documentation
Source: "{#MANUAL_DIR}\DAMQT_3.2.0_manual.pdf"; DestDir: "{app}\doc"; Flags: ignoreversion

[Components]
Name: "cygwin"; Description: "Install minimal Cygwin64"; Types: full compact custom

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\damqt.ico"
Name: "{group}\Run via BAT"; Filename: "{app}\{#MyAppBatName}"; IconFilename: "{app}\damqt.ico"
Name: "{group}\User Manual"; Filename: "{app}\doc\DAMQT_3.2.0_manual.pdf"; IconFilename: "{app}\damqt.ico"
Name: "{group}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"; IconFilename: "{app}\damqt.ico"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon; IconFilename: "{app}\damqt.ico"

[INI]
Filename: "{app}\{#MyAppName}.ini"; Section: "{#MyAppName}"; Key: "DataDirectory"; String: "{code:GetDataDir}"; Flags: createkeyifdoesntexist

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{code:GetCygwinDir}"; Check: NeedsAddPath('{code:GetCygwinDir}')
Root: HKCU; Subkey: "Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}"; Check: NeedsAddPath('{app}')

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "Launch {#MyAppName}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[Code]
var
  DataDirPage: TInputDirWizardPage;
  SampleDataPage: TInputOptionWizardPage;
  InstallCygwin: Boolean;
  CygwinChecked: Boolean;
  IsOverwriteSelected: Boolean;
  InstallMPI: Boolean;
  CygwinZipPath: String;
  CygwinZipPage: TInputFileWizardPage;
  TempZipPath: String;

function InitializeSetup(): Boolean;
begin
  InstallCygwin := True;
  CygwinChecked := False;
  IsOverwriteSelected := False;
  InstallMPI := False;
  Result := True;
  TempZipPath := ExpandConstant('{tmp}\cygwin_temp.zip');

  // Initialize logging
  SaveStringToFile(ExpandConstant('{tmp}\damqt_install.log'),
    'Installation started: ' + GetDateTimeString('yyyy/mm/dd hh:nn:ss', #0, #0) + #13#10, False);
    Result := True;
end;

procedure Log(Msg: String);
begin
  SaveStringToFile(ExpandConstant('{tmp}\damqt_install.log'),
    GetDateTimeString('hh:nn:ss', #0, #0) + ' - ' + Msg + #13#10, True);
end;

function GetCygwinDir(Default: string): string;
begin
  Result := ExpandConstant('{sd}\cygwin64');
end;

function GetDataDir(Param: String): String;
begin
  Result := DataDirPage.Values[0];
end;

function DataDirExists(): Boolean;
begin
  Result := DirExists(GetDataDir(''));
end;

function GetDefaultDataDirectory(): String;
begin
  Result := ExpandConstant('{localappdata}\{#MyShortAppName}');
end;

function GetIniFilename(): String;
begin
  Result := WizardDirValue() + '\{#MyShortAppName}.ini';
end;

procedure SetDirectoryPermissions(const DirPath: string);
var
  ResultCode: Integer;
begin
  if not Exec('icacls', '"' + DirPath + '" /grant Everyone:(OI)(CI)F /T', '', SW_HIDE, ewWaitUntilTerminated, ResultCode) then
  begin
    Log('Error setting permissions for: ' + DirPath);
    MsgBox('Could not set permissions for Cygwin directories.' + #13#10 +
           'Please manually set permissions for all users on:' + #13#10 +
           DirPath, mbError, MB_OK);
  end;
end;

procedure ExtractCygwin();
var
  ResultCode: Integer;
  CygwinDir: string;
begin
;   CygwinDir := GetCygwinDir('');
CygwinDir := ExpandConstant('{sd}\');
  Log('Extracting Cygwin to: ' + CygwinDir);
  Log('Source ZIP: ' + TempZipPath);

  // Create target directory if needed
  if not DirExists(CygwinDir) then
  begin
    if not ForceDirectories(CygwinDir) then
    begin
      Log('Failed to create directory: ' + CygwinDir);
      MsgBox('Error: Could not create directory: ' + CygwinDir, mbError, MB_OK);
      Exit;
    end;
  end;

  // Verify ZIP temporal file exists
  if not FileExists(TempZipPath) then
  begin
    Log('Error: Archivo temporal no encontrado: ' + TempZipPath);
    MsgBox('Error interno: No se encontró el archivo temporal', mbError, MB_OK);
    Exit;
  end;

  // Extract using PowerShell
  Log('Starting extraction with PowerShell');
  if not Exec(
    'powershell.exe',
    '-NoProfile -ExecutionPolicy Bypass -Command "try {' +
    'Add-Type -AssemblyName System.IO.Compression.FileSystem; ' +
    '[System.IO.Compression.ZipFile]::ExtractToDirectory(''' +
    TempZipPath  + ''', ''' + CygwinDir + '''); ' +
    'exit 0} catch { Write-Error $_.Exception.Message; exit 1}"',
    '',
    SW_HIDE,
    ewWaitUntilTerminated,
    ResultCode
  ) or (ResultCode <> 0) then
  begin
    Log('Error al ejecutar PowerShell. Código: ' + IntToStr(ResultCode));
    MsgBox('Error al extraer Cygwin. Código: ' + IntToStr(ResultCode), mbError, MB_OK);
    Exit;
  end;

  // Verify extraction was successful
  if not DirExists(CygwinDir + '\cygwin64\bin') then
  begin
    Log('Extraction failed - bin directory missing');
    MsgBox(
      'Error: Extraction incomplete.' + #13#10 +
      'bin/ directory not found in: ' + CygwinDir,
      mbError,
      MB_OK
    );
    Exit;
  end;

  // Set up directories and permissions
  try
    ForceDirectories(CygwinDir + '\home\' + GetUserNameString());
    SetDirectoryPermissions(CygwinDir + '\tmp');
    SetDirectoryPermissions(CygwinDir + '\dev\shm');
    Log('Cygwin installed successfully');
    MsgBox('Cygwin installed successfully in:' + #13#10 + CygwinDir, mbInformation, MB_OK);
  except
    Log('Warning: Error setting permissions');
    MsgBox('Warning: Could not set all permissions for Cygwin', mbInformation, MB_OK);
  end;
end;


procedure CurStepChanged(CurStep: TSetupStep);
begin
  // Copiar el archivo ZIP a temporal durante la instalación
  if (CurStep = ssInstall) and InstallMPI and (CygwinZipPath <> '') then
  begin
    Log('Copiando archivo ZIP a ubicación temporal');
    if not FileCopy(CygwinZipPath, TempZipPath, False) then
    begin
      Log('Error al copiar el archivo ZIP');
      MsgBox('Error al preparar la instalación de Cygwin', mbError, MB_OK);
    end
    else
    begin
      Log('Archivo copiado correctamente a: ' + TempZipPath);
    end;
  end;

  // Extraer en post-instalación
  if (CurStep = ssPostInstall) and InstallMPI then
  begin
    if not FileExists(TempZipPath) then
    begin
      Log('Error: Archivo temporal no encontrado para extracción');
      MsgBox('No se encontró el archivo ZIP para extraer Cygwin', mbError, MB_OK);
      Exit;
    end;

    ExtractCygwin();

    // Eliminar el archivo temporal después de usarlo
    if FileExists(TempZipPath) then
      DeleteFile(TempZipPath);
  end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
  if (PageID = wpSelectComponents) and not InstallCygwin then
    Result := True
  else
    Result := False;
end;

function InstallSampleData(): Boolean;
begin
  Result := SampleDataPage.Values[0];
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  CygwinPath: string;
begin
  Result := True;

  // Check overwrite confirmation on license page
  if (CurPageID = wpLicense) and not CygwinChecked then
  begin
    CygwinChecked := True;
    CygwinPath := GetCygwinDir('');
    if DirExists(CygwinPath) then
    begin
      if MsgBox('The folder "c:\cygwin64" already exists. Overwrite existing files?', mbConfirmation, MB_YESNO) = IDYES then
        IsOverwriteSelected := True
      else
      begin
        InstallCygwin := False;
        WizardForm.ComponentsList.Checked[0] := False;
      end;
    end;
  end;

  // Capture ZIP path on leaving ZIP selection page
  if InstallMPI and Assigned(CygwinZipPage) and (CurPageID = CygwinZipPage.ID) then
  begin
    CygwinZipPath := CygwinZipPage.Values[0];
    Log('ZIP selected by user: ' + CygwinZipPath);

    if CygwinZipPath = '' then
    begin
      MsgBox('You must select a valid ZIP file to install Cygwin.', mbError, MB_OK);
      Result := False;
    end
    else if not FileExists(CygwinZipPath) then
    begin
      MsgBox('The selected ZIP file does not exist:' + #13#10 + CygwinZipPath, mbError, MB_OK);
      Result := False;
    end;
  end;
end;


function NeedsAddPath(Param: string): Boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', OrigPath) then
  begin
    Result := True;
    Exit;
  end;
  Result := Pos(';' + Param + ';', ';' + OrigPath + ';') = 0;
end;

procedure DeinitializeUninstall();
var
  Res: Integer;
begin
  if DirExists(GetCygwinDir('')) then
  begin
    Res := MsgBox('Delete Cygwin installation (used for MPI)?', mbConfirmation, MB_YESNO);
    if Res = IDYES then
    begin
      DelTree(GetCygwinDir(''), True, True, True);
    end;
  end;
end;

procedure InitializeWizard();
begin
  // Data directory page
  DataDirPage := CreateInputDirPage(
    wpSelectDir,
    '{#MyLongAppName} - Data Directory',
    '',
    'Select directory for sample data',
    False,
    '{#MyShortAppName}'
  );
  DataDirPage.Add('');
  DataDirPage.Values[0] := GetIniString('{#MyShortAppName}', '{#INI_DataDirKey}', GetDefaultDataDirectory(), GetIniFilename());

  // Sample data installation option
  SampleDataPage := CreateInputOptionPage(DataDirPage.ID,
    'Install Sample Data',
    'Sample data for testing',
    'Install sample data? (Recommended for new users)',
    True, False);
  SampleDataPage.Add('Install');
  SampleDataPage.Add('Do not install');
  SampleDataPage.Values[1] := True;

  // MPI/Cygwin support option
  if MsgBox('Enable MPI support (parallel execution)? Requires cygwin64_min.zip file.', mbConfirmation, MB_YESNO) = IDYES then
  begin
    InstallMPI := True;
    CygwinZipPage := CreateInputFilePage(
      wpSelectComponents,
      'MPI Support - Cygwin Archive',
      'Select cygwin64_min.zip',
      'Please select the cygwin64_min.zip file to enable MPI parallel programs'
    );
    CygwinZipPage.Add('ZIP file:', 'ZIP files|*.zip', '.zip');
  end
  else
  begin
    InstallMPI := False;
  end;
end;

procedure CurPageChanged(CurPageID: Integer);
begin
  if InstallMPI and Assigned(CygwinZipPage) and (CurPageID = CygwinZipPage.ID) then
  begin
    CygwinZipPath := CygwinZipPage.Values[0];
    Log('Archivo ZIP seleccionado: ' + CygwinZipPath);

    if CygwinZipPath = '' then
    begin
      MsgBox('Debe seleccionar un archivo ZIP válido', mbError, MB_OK);
    end
    else if not FileExists(CygwinZipPath) then
    begin
      MsgBox('El archivo no existe en la ubicación especificada:' + #13#10 + CygwinZipPath, mbError, MB_OK);
    end;
  end;
end;

function IsCygwinZipSelected(): Boolean;
begin
  Result := (InstallMPI) and (CygwinZipPath <> '') and (FileExists(CygwinZipPath));
end;

