
ARGS="$@"

function depencies()
{
	array=(
		"ossp-uuid" "neovim" "vim" "coreutils" "lzma" "ncurses-utils" "tree" "cmake"
		"clang" "make" "cmake"
	); apt-get update -y; apt-get upgrade -y

	for install_depencies in "${array[@]}"; do
		apt-get install "$install_depencies" -y
	done
}

case ${ARGS} in
	build) { eval depencies; cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=gcc;cmake --build .; } ;;
	delete) { rm -rf Makefile cmake_install.cmake CMakeCache.txt CMakeFiles Obf; } ;;
	run) { ./Obf; } ;;
	*) cat <<< "Opsi: build, delete and run" ;;
esac￼Enter
