# rm -r -F ./main && gcc ./main.c -o ./main -> PowerShell
rm -rf ./main && clang ./main.c -o ./main

echo "Compiled C code ✅";

./main
