#include <nanobind/nanobind.h>

#include "add.h"

namespace nb = nanobind;

NB_MODULE(_core, m)
{
    m.def("add", [](int i, int j)
          { return add(i, j); }, "A function that adds two numbers");
}
