@echo off
setlocal enabledelayedexpansion

REM Defina o caminho para o executável 7-Zip
set "sevenZip=C:\Program Files\7-Zip\7z.exe"

REM Verifique se foram fornecidos argumentos
if "%~1"=="" (
    echo Uso: %0 arquivo_ou_pasta_1 [arquivo_ou_pasta_2 ...]
    exit /b 1
)

REM Inicialize a mensagem de conclusão
set "conclusion_message="

REM Percorra todos os argumentos
for %%A in (%*) do (
    REM Verifique se o arquivo ou pasta fornecido existe
    if not exist "%%~A" (
        echo O arquivo ou pasta %%~A nao foi encontrado.
        exit /b 1
    )

    REM Nome do arquivo ou pasta de entrada sem extensão
    if exist "%%~A\" (
        set "baseName=%%~nA"
    ) else (
        set "baseName=%%~nA"
    )

    REM Compactar o arquivo ou pasta em partes de 1980MB
    "%sevenZip%" a -t7z -mx=9 -m0=lzma2 -md=64m -ms=64g -mmt=8 -mfb=64 -mmtf -v1980m "!baseName!.7z" "%%~A"

    REM Verificar se a operação foi bem-sucedida
    if !errorlevel! equ 0 (
        set "conclusion_message=!conclusion_message!Tarefa finlizada: %%~A^

    ) else (
        set "conclusion_message=!conclusion_message!Erro durante a divisao do arquivo: %%~A^

    )
)

REM Exibir mensagem de conclusão
echo.
echo A.L.E.R.T.A:
echo !conclusion_message!

pause
endlocal