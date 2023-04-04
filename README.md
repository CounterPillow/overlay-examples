# overlay-examples

This repository contains example device tree overlays for single-board computers
running mainline kernels and mainline u-boot.

The goal is to teach how to write device tree overlays, and serve as a point
of reference for real-world hardware one may wish to use device tree overlays
for.

All overlays are meant to work with real hardware, and can be used as-is with
no further modification if one has the necessary hardware configured in the
same way as described by one of the overlays.


## Prerequisites

You will need to have the device tree compiler `dtc` installed. Please consult
your distribution's manual for how to find and install the correct package.

Your u-boot also needs to be mainline, and compiled with
`CONFIG_OF_LIBFDT_OVERLAY` enabled. Furthermore, we will assume mainline device
tree bindings here.


## Building

Build the overlays with `make INCLUDE_DIR=path/to/linux/include`. They will be
placed in the folder `build`. The path to Linux include should be a path to
an extracted Linux source tree's `include/`, as distributions usually don't
package the dt-bindings headers in their headers packages.

Running `make clean` will recursively delete `build`, so don't store anything
other than the built files in it.


## Installing

### On Plebian

Copy the `.dtbo` files you want to use from the build directory to `/boot/dtbo/`
and run `sudo u-boot-update`.

### Elsewhere

Assuming you are booting with a `extlinux/extlinux.conf` on your `/boot`, you
can copy the .dtbo files somewhere into `/boot` (e.g. `/boot/dtbs/overlays`)
and specify them in your `/boot/extlinux/extlinux.conf` as follows:

```
FDTOVERLAYS /dtbs/overlays/first-overlay.dtbo /dtbs/overlays/second-overlay.dtbo
```

## License

It is the principal author's opinion that hardware descriptions are of dubious
copyrightability, due to lacking in individual character. This, however, is not
to be misunderstood as legal advice in any way.

The parts of the hardware description that may exhibit individual character,
such as comments, label names, etc. are licensed under the MIT license.
See LICENSE.txt for details.

It is the principal author's view that one does not need to include the license
text if one references these examples during the writing of device trees.


## Contributing

Please read `CONTRIBUTING.md` before attempting to contribute to this
repository.
