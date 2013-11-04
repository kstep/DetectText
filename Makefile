CPPFLAGS=-I$$(pwd) $$(pkg-config --cflags --libs python2) -DBOOST_PYTHON_STATIC_LIB -lboost_python -lopencv_core -lopencv_highgui -lopencv_imgproc

DetectText: TextDetection.cpp FeaturesMain.cpp
	g++ -o DetectText TextDetection.cpp FeaturesMain.cpp $(CPPFLAGS)

TextDetection.o: TextDetection.cpp
	g++ -c -fPIC TextDetection.cpp -o TextDetection.o $(CPPFLAGS)

PyTextDetection.o: PyTextDetection.cpp
	g++ -c -fPIC PyTextDetection.cpp -o PyTextDetection.o $(CPPFLAGS)

libPyTextDetection.so: TextDetection.o PyTextDetection.o
	g++ -shared -Wl,-soname,pytextdetection.so -o pytextdetection.so TextDetection.o PyTextDetection.o $(CPPFLAGS)

lib: libPyTextDetection.so

build: DetectText

clean:
	rm -f DetectText *.o *.so *.pyc

.PHONY: build lib clean
