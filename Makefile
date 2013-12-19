CPPFLAGS	= -E -P -nostdinc -IInclude -undef -x assembler-with-cpp
CPP		= clang
DTC		= dtc
DEVICETREES	= RealView.devicetree Nokia_RX51.devicetree

all: $(DEVICETREES)

RealView.devicetree: ARM/RealView-PB-A8/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

Nokia_RX51.devicetree: TexasInstruments/OMAP3/Nokia_RX51/devicetree.dtsi
	$(CPP) $(CPPFLAGS) $< -o $@.p
	$(DTC) -O dtb -o $@ $@.p
	rm -f $@.p

clean:
	rm -f $(DEVICETREES)

