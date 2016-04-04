CXX=g++
CXX_FLAGS=-O2
LD_FLAGS=-static ${CC_FLAGS}

runners: runner_static runner_java
	cp runner_static runner-static/runner
	cp runner_java runner-java/runner

docker:	runners
	docker build -t judge-runner-static runner-static
	docker build -t judge-runner-java runner-java

runner_static: runner_static.o
	${CXX} -o runner_static ${LD_FLAGS} runner_static.o
runner_static.o: runner.cpp
	${CXX} -c -o runner_static.o ${CC_FLAGS} runner.cpp -DRUNNER_STATIC

runner_java: runner_java.o
	${CXX} -o runner_java ${LD_FLAGS} runner_java.o
runner_java.o: runner.cpp
	${CXX} -c -o runner_java.o ${CC_FLAGS} runner.cpp -DRUNNER_JAVA

