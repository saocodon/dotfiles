@echo off
g++ -std=c++17 main.cpp -I%~dp0\SDL2\include -L%~dp0\SDL2\lib -Wall -lmingw32 -lSDL2main -lSDL2 -lSDL2_image -o main.exe
