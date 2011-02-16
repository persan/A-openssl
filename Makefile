
include Makefile.configuration


# Default target
compile:

generate:

	rm -rf src/gen .gen

	mkdir -p .gen src/gen
#	cd /usr/include; find openssl/ -name  "*.h" |  sed "s-^-#include <-" | sed "s-\$$->-" >${CURDIR}/.gen/gen.cpp
	cd .gen; /opt/GNAT/6.5.0w-20110122-45/bin/g++ -c ../gen.cpp -fdump-ada-spec
	./rename.py
	${MAKE} -C tests compile

################################################################

pack:
	rm -rf  ${PROJECT}-${VERSION}*
	svn export . ${PROJECT}-${VERSION}
	tar -czf  ${PROJECT}-${VERSION}-${DATE}.tgz ${PROJECT}-${VERSION}}
	${RM} ${PROJECT}-${VERSION}

################################################################
clean:
	${MAKE} -C tools $@
	rm -rf .obj


################################################################
all:
	${MAKE} -C compile
	${MAKE} -C tests
	${MAKE} -C install


################################################################
compile:
	gprbuild -p -P openssl.gpr
	gprbuild -p -P helpers/helpers.gpr
	${MAKE} -C tests $@

################################################################
install:
	${MKDIR} -p ${INCLUDEDIR}

	cp  src/*.ad? ${INCLUDEDIR}
	${CHMOD} a-w ${INCLUDEDIR}/*.ad?

	${MKDIR} -p ${LIBDIR}

	${MKDIR} -p ${LIBDIR}/gnat
	${CP} protobuff_.gpr ${LIBDIR}/gnat/protobuff.gpr

	${MAKE} -C tools $@

################################################################
configure:

test:

	${MAKE} -C tests $@
	${MAKE} -C regresion $@



release:
	 svn stat        .        >.obj/svn-stat.txt
	 svn --xml info  .       >.obj/svn-info.txt
	 svn ls ${SVNRoot}/tags >.obj/releases.txt
	./helpers/checkrelease --dirtylist=.obj/svn-stat.txt --svnversions=.obj/releases.txt
	./helpers/checkrelease --releasenote=release_notes.txt

Makefile.configuration:
	echo "PREFIX=$(dir $(shell which gnatls))..">$@
	echo OBJECT_DIR=.obj >>$@
	echo PROJECT=ProtoBuff  >>$@
	echo export LIBDIR=${PREFIX}/lib/ProtoBuff  >>$@
	echo export INCLUDEDIR=${PREFIX}/include/ProtoBuff  >>$@
