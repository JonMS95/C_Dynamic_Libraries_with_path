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

shell_dirs	= Shell_files/directories.sh
shell_test	= Shell_files/test.sh

# all: directories clean main.o mult.o div.o mult.so div.so mult div rm_obj msg test
all: directories clean main.o mult.so div.so mult div rm_obj msg test

directories:
	@./$(shell_dirs)

main.o: $(src_main)
	gcc -c $(src_main) -o $(obj_main)

# mult.o: $(src_mult)
# 	gcc -c -fPIC $(src_mult) -o $(obj_mult)

# div.o: $(src_div)
# 	gcc -c -fPIC $(src_div) -o $(obj_div)

mult: $(obj_main)
	gcc $(obj_main) -LDynamic_libraries -lmult -o $(exe_mult)

div: $(obj_main)
	gcc $(obj_main) -LDynamic_libraries -ldiv -o $(exe_div)

# mult.so: $(obj_mult)
# 	gcc -shared $(obj_mult) -o $(so_mult)

# div.so: $(obj_div)
# 	gcc -shared $(obj_div) -o $(so_div)

mult.so: $(src_mult)
	gcc -g -fPIC -shared $(src_mult) -o $(so_mult)

div.so: $(src_div)
	gcc -g -fPIC -shared $(src_div) -o $(so_div)

msg:
	@echo "**************************************************************************************************"
	@echo "Don't forget to set the path:"
	@echo "export LD_LIBRARY_PATH=~/Desktop/scripts/C/C_Dynamic_Libraries_with_path/Dynamic_libraries"
	@echo "**************************************************************************************************"

rm_obj:
	rm -rf Object_files

clean:
	rm -rf Executable_files/* Dynamic_libraries/*

test:
	@./$(shell_test)