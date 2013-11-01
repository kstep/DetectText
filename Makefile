
DetectText: TextDetection.cpp FeaturesMain.cpp
	g++ -o DetectText TextDetection.cpp FeaturesMain.cpp -lopencv_core -lopencv_highgui -lopencv_imgproc -I$$(pwd) $$(pkg-config --cflags --libs python2) -DBOOST_PYTHON_STATIC_LIB -lboost_python

TextDetection.o: TextDetection.cpp
	g++ -c -fPIC TextDetection.cpp -o TextDetection.o -lopencv_core -lopencv_highgui -lopencv_imgproc -I$$(pwd) $$(pkg-config --cflags --libs python2) -DBOOST_PYTHON_STATIC_LIB -lboost_python

python.o: python.cpp
	g++ -c -fPIC python.cpp -o python.o -lopencv_core -lopencv_highgui -lopencv_imgproc -I$$(pwd) $$(pkg-config --cflags --libs python2) -DBOOST_PYTHON_STATIC_LIB -lboost_python

libTextDetection.so: TextDetection.o python.o
	g++ -shared -Wl,-soname,textdetection.so -o textdetection.so -lopencv_core -lopencv_highgui -lopencv_imgproc $$(pkg-config --cflags --libs python2) TextDetection.o python.o -DBOOST_PYTHON_STATIC_LIB -lboost_python

build: DetectText

lib: libTextDetection.so

clean:
	rm -f DetectText *.o *.so

.PHONY: build lib clean
