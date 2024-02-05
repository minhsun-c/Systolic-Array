PRODUCTWIDTH=64
gcc -c src/gen.c -o obj/gen.o
ar -rcs gen.a obj/gen.o
gcc -o build/gen main.c gen.a
cd build
./gen >gen.out $PRODUCTWIDTH
echo "END"
