MAKE := make

all: stm32f1-builds stm32f4-builds

unicore-mx/lib/libucmx_stm32f1.a:
	$(MAKE) -C unicore-mx lib/stm32/f1

unicore-mx/lib/libucmx_stm32f4.a:
	$(MAKE) -C unicore-mx lib/stm32/f4

stm32f4-builds: unicore-mx/lib/libucmx_stm32f4.a
	$(MAKE) -f Makefile.stm32f4 PLATFORM=blackpill LOADER=noloader

stm32f1-builds: unicore-mx/lib/libucmx_stm32f1.a
	$(MAKE) -f Makefile.stm32f1 PLATFORM=bluepill LOADER=noloader
	$(MAKE) -f Makefile.stm32f1 PLATFORM=baite LOADER=noloader
	$(MAKE) -f Makefile.stm32f1 PLATFORM=olimexstm32h103 LOADER=noloader
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2 LOADER=noloader
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2white LOADER=noloader
	$(MAKE) -f Makefile.stm32f1 PLATFORM=bluepill LOADER=loader2k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=baite LOADER=loader2k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=olimexstm32h103 LOADER=loader2k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2 LOADER=loader2k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2white LOADER=loader2k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=bluepill LOADER=loader4k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=baite LOADER=loader4k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=olimexstm32h103 LOADER=loader4k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2 LOADER=loader4k
	$(MAKE) -f Makefile.stm32f1 PLATFORM=stlinkv2white LOADER=loader4k

clean:
	$(MAKE) -C unicore-mx clean
	$(MAKE) -f Makefile.stm32f1 clean
	$(MAKE) -f Makefile.stm32f4 clean

.PHONY: all clean stm32f1-builds stm32f4-builds
