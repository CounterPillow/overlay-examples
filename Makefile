INCLUDE_DIR ?= linux/include
DTS = $(shell find -name '*.dts')
DTBS = $(addprefix build/,$(addsuffix .dtbo,$(basename $(DTS))))
DTC ?= dtc
DTCFLAGS ?= -@
CPPFLAGS ?= -E -nostdinc -I$(INCLUDE_DIR) -undef -D__DTS__ -x assembler-with-cpp

all: build/quartz64a build/quartz64b build/rockpro64 build/rock64 $(DTBS)

build:
	mkdir -p build

build/quartz64a: build
	mkdir -p build/quartz64a

build/quartz64b: build
	mkdir -p build/quartz64b

build/rockpro64: build
	mkdir -p build/rockpro64

build/rock64: build
	mkdir -p build/rock64

build/%.dtsp: %.dts
	cpp $(CPPFLAGS) $^ -o $@

build/%.dtbo: build/%.dtsp
	$(DTC) -O dtb -o $@ $(DTCFLAGS) $^

clean:
	rm -vfr build

.PHONY: clean all
