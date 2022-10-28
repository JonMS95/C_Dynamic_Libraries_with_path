src_main 	= Source_files/main.c
src_prt		= Source_files/functionPrototype.h
src_mult 	= Source_files/mult.c
src_div		= Source_files/div.c

obj_main	= Object_files/main.o
obj_mult	= Object_files/mult.o
obj_div		= Object_files/div.o

so_mult		= Dynamic_libraries/libmult.so
so_div		= Dynamic_libraries/libdiv.so

exe_mult	= Executable_files/mult
exe_div		= Executable_files/div

all: clean main.o mult.o div.o mult.so div.so mult div set_path

main.o: $(src_main) $(src_prt)
	gcc -c $(src_main) -o $(obj_main)

mult.o: $(src_mult)
	gcc -c -fPIC $(src_mult) -o $(obj_mult)

div.o: $(src_div)
	gcc -c -fPIC $(src_div) -o $(obj_div)

mult: $(obj_main)
	gcc $(obj_main) -LDynamic_libraries -lmult -o $(exe_mult)

div: $(obj_main)
	gcc $(obj_main) -LDynamic_libraries -ldiv -o $(exe_div)

mult.so: $(obj_mult)
	gcc -shared $(obj_mult) -o $(so_mult)

div.so: $(obj_div)
	gcc -shared $(obj_div) -o $(so_div)

set_path:
	@echo "************************************************************************************************************************"
	@echo "Don't forget to set the path: LD_LIBRARY_PATH=/home/jon/Desktop/scripts/C_Dynamic_Libraries_with_path/Dynamic_libraries/"
	@echo "************************************************************************************************************************"

clean:
	rm -rf Object_files/* Executable_files/* Dynamic_libraries/*