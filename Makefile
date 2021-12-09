INCLUDE_DIR ?= linux/include
DTS = $(shell find -name '*.dts')
DTBS = $(addprefix build/,$(addsuffix .dtbo,$(basename $(DTS))))
DTC ?= dtc
DTCFLAGS ?= -@
CPPFLAGS ?= -nostdinc -traditional-cpp -I$(INCLUDE_DIR)

all: build/rockpro64 $(DTBS)

build:
	mkdir build

build/rockpro64: build
	mkdir build/rockpro64

build/%.dtsp: %.dts
	cpp $(CPPFLAGS) $^ -o $@

build/%.dtbo: build/%.dtsp
	$(DTC) -O dtb -o $@ $(DTCFLAGS) $^

clean:
	rm -vfr build

.PHONY: clean all
