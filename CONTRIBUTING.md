# Contribution Guidelines

Please read the following document carefully, as it contains important
information pertaining to the process of making contributions to this
repository.


## Legalese

By contributing to this repository, you agree to license your contributions to
the public under the MIT license, as found in `LICENSE.txt`.


## Style Guidelines


### Markdown Documents

Markdown documents should be statically wrapped at 80 columns, though if it
helps readability, one may exceed this limit in select places.

Use `#` to mark headings.


### Device Tree Source Files (*.dts)

Device tree source files should be kept below 120 columns.

They must be indented in the kernel style, meaning tabs of size 8.

Each file must begin with the SPDX license identifier, a blank line and a short
description of what it does.

Comments should be added to the file as seen fit; the files are meant to be an
educational tool first and foremost. Banalities may not need to be elaborated
on, but the bar of banality depends on the experience somebody has with device
trees, which may be zero if this is the first device tree file they've opened.

The words "specify", "define" and "declare" should be avoided, and instead the
word "describes" should be considered. We are not telling the hardware what to
do, we are describing *what it already is* and letting the drivers act on it.

In this order of importance, comments should be: accurate, applicable,
approachable, abundant, and alliterative. Any and all asides are accessory.

Properties should be sorted as follows:
 - `compatible` comes first
 - `reg` second
 - `pinctrl-names` above `pinctrl-`
 - properties beginning with `#` above status, alphabetical, last if status
   is omitted
 - `status` last
 - alphabetical

Child nodes should have an empty line before them, unless they are the first
of their level.

### Makefiles

Go nuts, I don't care.
