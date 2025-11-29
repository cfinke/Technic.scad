EXAMPLES := $(wildcard examples/technic_*.scad)
IMAGES := $(patsubst examples/%.scad,images/%.png,$(EXAMPLES))
MARKDOWN := README.md

openscad := "/Applications/OpenSCAD-2021.01.app/Contents/MacOS/OpenSCAD"
docgen := utils/doxydown/doxydown.pl
resolution := 4096,4096
viewport_translation := 0,0,0
viewport_rotation := 50,0,40
viewport_distance := 0
viewport_projection := o
color := Nature

all: doc

doc: readme $(IMAGES) Makefile
	@echo "Documentation generated"

images/%.png : examples/%.scad
	@echo "Rendering $@"
	@$(openscad) -o "$@" --camera=$(viewport_translation),$(viewport_rotation),$(viewport_distance) --colorscheme=$(color) --projection=$(viewport_projection) --viewall --autocenter --imgsize=$(resolution) -q "$^"

readme:
	@echo "Generating Readme"
	@$(docgen) -g -e c -l c < Technic.scad >$(MARKDOWN)

clean:
	@rm images/technic_*.png
