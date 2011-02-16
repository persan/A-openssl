
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
	gprbuild -p -P protobuff-tests.gpr

