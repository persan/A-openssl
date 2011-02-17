
generate:
	${MAKE} -C .. ${@}

# Default target
compile:

################################################################

test:
	./bin/protobuff-tests-testharnesses-test_all
################################################################
all:
	${MAKE} -C compile
	${MAKE} -C tests


################################################################
compile:
	gprbuild -d -Popenssl-tests.gpr openssl-tests-testharnesses-test_all.adb -p -k

