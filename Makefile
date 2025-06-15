.DEFAULT: country.dsk

country.dsk: COUNTRY.BIN
	@echo "Compiling disk..."
	rm -f -v $@
	decb dskini -3 $@
	decb copy -r $< $@,$<
	@echo "Done"

COUNTRY.BIN: country_road.asm
	@echo "Assembling..."
	asm6809 -C -o COUNTRY.BIN $<
	@echo "Done"

.PHONY: clean xroar

clean:
	rm -f -v country.dsk COUNTRY.BIN

xroar:
	xroar -machine coco2b -load-fd0 country.dsk -run COUNTRY.BIN
