# set the binaries that have to be built
TARGETS := DenseTrack Video

INSTALL_DIR:= /tudelft.net/staff-bulk/ewi/insy/VisionLab/lcabrera/code_dependencies

export LD_LIBRARY_PATH="$INSTALL_DIR/build/lib:$LD_LIBRARY_PATH"

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/tudelft.net/staff-bulk/ewi/insy/VisionLab/lcabrera/code_dependencies/build/lib/pkgconfig

# set the build configuration set 
BUILD := release
#BUILD := debug

# set bin and build dirs
BUILDDIR := .build_$(BUILD)
BINDIR := $(BUILD)

# libraries 
LDLIBS = $(addprefix -l, $(LIBS) $(LIBS_$(notdir $*)))
LIBS := \
	opencv_core opencv_highgui opencv_video opencv_imgproc 
	#\
	#avformat avdevice avutil avcodec swscale

# set some flags and compiler/linker specific commands
CXXFLAGS = -pipe -D __STDC_CONSTANT_MACROS -D STD=std -Wall $(CXXFLAGS_$(BUILD)) -I. -I/opt/include
CXXFLAGS_debug := -ggdb
CXXFLAGS_release := -O3 -DNDEBUG -ggdb
LDFLAGS = -L/opt/lib -L$(INSTALL_DIR)/build/lib -pipe -Wall $(LDFLAGS_$(BUILD))
LDFLAGS_debug := -ggdb
LDFLAGS_release := -O3 -ggdb

include make/generic.mk
