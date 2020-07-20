program cHash;

{$APPTYPE CONSOLE}
{$R *.res}
{$WEAKLINKRTTI ON}
{$RTTI EXPLICIT METHODS([]) PROPERTIES([]) FIELDS([])}

uses
  System.SysUtils, System.Hash, System.Types, System.Classes,
  System.IOUtils;

procedure ShowHelp();
begin
  Writeln(' Usage:');
  Writeln('  cHash folderlocation filename');
  Writeln('  If Filename not specified then it take filename as directory name.');
  Writeln('   -a(1 to 8)');
  Writeln('    1: MD5');
  Writeln('    2: SHA1');
  Writeln('    3: SHA224');
  Writeln('    4: SHA256');
  Writeln('    5: SHA384');
  Writeln('    6: SHA512');
  Writeln('    7: SHA512_224');
  Writeln('    8: SHA512_256');
end;

var
  HashMD5: THashMD5;
  HashSHA1: THashSHA1;
  HashSHA2: THashSHA2;
  Files: TStringDynArray;
  I, Counter: Integer;
  StrFile: TStringList;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Writeln('cHash 0.1 created by Jiva newstone');
    if ParamStr(1) = ('-h') then
      ShowHelp;
    if ParamStr(1) = ('-a1') then
    begin
      Writeln('Running in MD5 Mode !');
      HashMD5.Create;
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('MD5Hash: ' + HashMD5.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashMD5.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) + '.MD5');
        Writeln('');
        Writeln('Sucessfully Save As ".MD5" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;
    if ParamStr(1) = ('-a2') then
    begin
      Writeln('Running in SHA1 Mode !');
      HashSHA1.Create;
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA1Hash: ' + HashSHA1.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA1.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
		StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) + '.SHA1');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA1" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a3') then
    begin
      Writeln('Running in SHA224 Mode !');
      HashSHA2.Create(SHA224);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA224Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
		StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA224');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA224" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a4') then
    begin
      Writeln('Running in SHA256 Mode !');
      HashSHA2.Create(SHA256);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA256Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA256');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA256" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a5') then
    begin
      Writeln('Running in SHA384 Mode !');
      HashSHA2.Create(SHA384);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA384Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
		StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA384');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA384" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a6') then
    begin
      Writeln('Running in SHA512 Mode !');
      HashSHA2.Create(SHA512);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA512Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA512');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA512" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a7') then
    begin
      Writeln('Running in SHA512_224 Mode !');
      HashSHA2.Create(SHA512_224);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA512_224Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA512_224');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA512_224" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

    if ParamStr(1) = ('-a8') then
    begin
      Writeln('Running in SHA512_256 Mode !');
      HashSHA2.Create(SHA512_256);
      StrFile := TStringList.Create;
      Files := TDirectory.GetFiles(ExtractFilePath(ParamStr(2)), '*.*',
        TSearchOption.soAllDirectories);
      for I := Low(Files) to High(Files) do
      begin
        Writeln('');
        Writeln('Checking.. ' + ExtractFileName(Files[I]));
        Writeln('SHA512_256Hash: ' + HashSHA2.GetHashStringFromFile(Files[I]));
        StrFile.Add(HashSHA2.GetHashStringFromFile(Files[I]) + ' *' + Files[I]);
      end;
      if ParamStr(3) = '' then
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ExcludeTrailingPathDelimiter(ParamStr(2)) +
          '.SHA512_256');
        Writeln('');
        Writeln('Sucessfully Save As ".SHA512_256" in the current directory');
      end
      else
      begin
        for Counter := 0 to StrFile.Count - 1 do
        begin
          StrFile[Counter] := StringReplace(StrFile[Counter], ParamStr(2), '',
            [rfReplaceAll]);
        end;
        StrFile.Add(';Created by cHash');
        StrFile.SaveToFile(ParamStr(3));
        Writeln('');
        Writeln('Sucessfully saved Hash strings in ' +
          ExtractFileName(ParamStr(3)));
      end;
      StrFile.Free;
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
