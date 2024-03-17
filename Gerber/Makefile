
# Revisions
REVISION_Pmod_Debug := A
REVISION_Pmod_HUB75 := A
REVISION_Pmod_LED := A
REVISION_Pmod_MatrixLED := B
REVISION_Pmod_MultiSegment_SinglePort := A
REVISION_TangNano_PmodBase := B
REVISION_TangNano20K_PmodBase := B
REVISION_TangPrimer_PmodExtender := B
REVISION_Pmod_Adapter_Ethernet := A
REVISION_Pmod_DisplayPort := A

# Targets
TARGETS := $(sort $(subst /,,$(wildcard */)))

.PHONY: all
all: $(addprefix pack-,$(TARGETS))

.PHONY: repack
repack: $(addprefix repack-,$(TARGETS))

define gen-targets

rename-$(1):
	@if [ -e $(1)/$(1)-F_Cu.gtl         ]; then echo "moved $(1)/$(1)-F_Cu.gtl        "; mv -f $(1)/$(1)-F_Cu.gtl $(1)/$(1).gtl; fi
	@if [ -e $(1)/$(1)-B_Cu.gbl         ]; then echo "moved $(1)/$(1)-B_Cu.gbl        "; mv -f $(1)/$(1)-B_Cu.gbl $(1)/$(1).gbl; fi
	@if [ -e $(1)/$(1)-F_Mask.gts       ]; then echo "moved $(1)/$(1)-F_Mask.gts      "; mv -f $(1)/$(1)-F_Mask.gts $(1)/$(1).gts; fi
	@if [ -e $(1)/$(1)-B_Mask.gbs       ]; then echo "moved $(1)/$(1)-B_Mask.gbs      "; mv -f $(1)/$(1)-B_Mask.gbs $(1)/$(1).gbs; fi
	@if [ -e $(1)/$(1)-F_Silkscreen.gto ]; then echo "moved $(1)/$(1)-F_Silkscreen.gto"; mv -f $(1)/$(1)-F_Silkscreen.gto $(1)/$(1).gto; fi
	@if [ -e $(1)/$(1)-B_Silkscreen.gbo ]; then echo "moved $(1)/$(1)-B_Silkscreen.gbo"; mv -f $(1)/$(1)-B_Silkscreen.gbo $(1)/$(1).gbo; fi
	@if [ -e $(1)/$(1)-Edge_Cuts.gm1    ]; then echo "moved $(1)/$(1)-Edge_Cuts.gm1   "; mv -f $(1)/$(1)-Edge_Cuts.gm1 $(1)/$(1).gm1; fi
	@if [ -e $(1)/$(1)-F_Paste.gtp      ]; then echo "moved $(1)/$(1)-F_Paste.gtp     "; mv -f $(1)/$(1)-F_Paste.gtp $(1)/$(1).gtp; fi
	@if [ -e $(1)/$(1)-B_Paste.gbp      ]; then echo "moved $(1)/$(1)-B_Paste.gbp     "; mv -f $(1)/$(1)-B_Paste.gbp $(1)/$(1).gbp; fi
	@if [ -e $(1)/$(1)-PTH.drl          ]; then echo "moved $(1)/$(1)-PTH.drl         "; mv -f $(1)/$(1)-PTH.drl  $(1)/$(1)-PTH.txt; fi
	@if [ -e $(1)/$(1)-NPTH.drl         ]; then echo "moved $(1)/$(1)-NPTH.drl        "; mv -f $(1)/$(1)-NPTH.drl $(1)/$(1)-NPTH.txt; fi

GERBER_FILES_$(1) = $(1)/$(1).gtl $(1)/$(1).gbl $(1)/$(1).gts $(1)/$(1).gbs $(1)/$(1).gto $(1)/$(1).gbo $(1)/$(1).gm1 $(1)/$(1).gtp $(1)/$(1).gbp $(1)/$(1)-PTH.txt $(1)/$(1)-NPTH.txt
GERBER_ZIP_PATH_$(1) = $(1)/$(1)_rev$(REVISION_$(1)).zip

$$(GERBER_FILES_$(1)): rename-$(1)

$$(GERBER_ZIP_PATH_$(1)): $$(GERBER_FILES_$(1))
	@echo packing $$@
	@zip -u $$@ $$^

.PHONY: pack-$(1)
pack-$(1): $$(GERBER_ZIP_PATH_$(1))
.PHONY: remove-$(1)
remove-$(1):
	-@$(RM) $$(GERBER_ZIP_PATH_$(1))
.PHONY: repack-$(1)
repack-$(1): remove-$(1) pack-$(1)
endef

$(foreach target,$(TARGETS),$(eval $(call gen-targets,$(target))))

.PHONY: list-targets
list-targets:
	@echo $(TARGETS)