INCLUDE_DIR ?= linux/include
DTS = $(shell find -name '*.dts')
DTBS = $(addprefix build/,$(addsuffix .dtbo,$(basename $(DTS))))
DTC ?= dtc
DTCFLAGS ?= -@
CPPFLAGS ?= -E -nostdinc -I$(INCLUDE_DIR) -undef -D__DTS__ -x assembler-with-cpp

all: build/rockpro64 build/rock64 $(DTBS)

build:
	mkdir build

build/rockpro64: build
	mkdir build/rockpro64

build/rock64: build
	mkdir build/rock64

build/%.dtsp: %.dts
	cpp $(CPPFLAGS) $^ -o $@

build/%.dtbo: build/%.dtsp
	$(DTC) -O dtb -o $@ $(DTCFLAGS) $^

clean:
	rm -vfr build

.PHONY: clean all
