#include <boost/python.hpp>
#include "TextDetection.h"

struct iplimage_t {
    PyObject_HEAD
    IplImage *a;
    PyObject *data;
    size_t offset;
};

IplImage* object2IplImage(boost::python::object o) {
    iplimage_t *cva = (iplimage_t*)o.ptr();
    return (IplImage*)(cva->a);
}

boost::python::object iplImage2Object(IplImage* image) {
    iplimage_t *cva = (iplimage_t*) malloc(sizeof(iplimage_t));
    cva->a = image;

    boost::python::object *obj = new boost::python::object();
    return *obj;
}

boost::python::object text_detection(boost::python::object input, bool dark_on_light) {
    return iplImage2Object(simpleTextDetection(object2IplImage(input), dark_on_light));
}

BOOST_PYTHON_MODULE(textdetection) {
    def("detect_text", text_detection);
}
