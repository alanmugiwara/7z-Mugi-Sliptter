@echo off

:: Loop percorre todos os arquivos de qualquer extensão no diretório raiz.
FOR %%i IN (*.*) DO (
    IF NOT "%%~xi"==".bat" (
    echo Compactando: %%i
    "C:\Program Files\7-Zip\7z.exe" a -t7z -mx9 -m0=lzma2 "%%~ni.7z" "%%i")

    :: Verifica se houve erro na compactação e exibe uma mensagem "echo"
    if errorlevel 1 (
        echo Erro na compactação de %%i!
    )
)

:: Exibe a mensagem de conclusão.
echo Compressao Concluida!\n

:: Pausa para deixar a mensagem de conclusão travada no prompt.
pause

:: ------------
:: Comentários
:: ------------
:: Loop para percorrer todos os arquivos de qualquer extensão no diretório raiz.
:: FOR %%i IN (*.*) DO - Para cada arquivo, será realizada a compactação.
:: IF NOT "%%~xi"==".bat" - Evita que o próprio script senha compmrimido

:: Parâmetro 1 - "C:\Program Files\7-Zip\7z.exe" - Caminho para o executável do 7-Zip
:: Parâmetro 2 - "a" [Appen] Adiciona conteúdo ao arquivo comprimido final.
:: Parâmetro 3 - "-t7z" - Define o formato de saída como 7z.
:: Parâmetro 4 - "-mx9" - Define o nível máximo de compressão (9 é o mais lento e mais compacto).
:: Parâmetro 5 - "-m0=LZMA2" - Define o algoritmo de compressão.
:: Parâmetro 6 - "%%~ni.7z" - Nome do arquivo de saída (nome do arquivo original sem extensão + .7z).
:: Parâmetro 7 - "%%i" - Nome do arquivo de entrada.

:: O script verifica se houve erro na compactação de algum arquivo utilizando `if errorlevel 1`.
:: Caso haja erro, a mensagem "Erro na compactação de %%i!" será exibida para o arquivo em questão.

:: Ao final, a mensagem "Compressao Concluida!" será exibida e o script será pausado no fim da tarefa.

