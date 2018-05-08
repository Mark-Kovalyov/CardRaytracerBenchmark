erlc card.erl

echo "GO:Errorlevel = %ERRORLEVEL%"

if %ERRORLEVEL% == 1 (
 echo "GO:Aborted due to compillation error"
) else ( 
 echo "GO:Commpillation OK!"
 erl -noshell -s card main -s init stop 
)
