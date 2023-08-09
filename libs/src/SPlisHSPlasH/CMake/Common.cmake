set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin" CACHE INTERNAL "Where to place executables and dlls")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG "${CMAKE_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE "${CMAKE_SOURCE_DIR}/bin" CACHE INTERNAL "Where to place executables and dlls in release mode")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO "${CMAKE_SOURCE_DIR}/bin")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL "${CMAKE_SOURCE_DIR}/bin")
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_DEBUG_POSTFIX "_d")
set(CMAKE_RELWITHDEBINFO_POSTFIX "_rd")
set(CMAKE_MINSIZEREL_POSTFIX "_ms")

include(CMakeDependentOption)


OPTION(USE_DOUBLE_PRECISION "Use double precision"	OFF)
if (USE_DOUBLE_PRECISION)
	add_definitions( -DUSE_DOUBLE)	
	message("AVX is only supported for single precision.")
endif (USE_DOUBLE_PRECISION)

cmake_dependent_option(USE_AVX "Use AVX" ON "NOT USE_DOUBLE_PRECISION" OFF)
if (USE_AVX)
	include(avx)
	set_avx_flags()
	if (FOUND_AVX2)
		message(STATUS "Using AVX2")
		add_definitions(-DUSE_AVX)
	endif()
endif()

cmake_dependent_option(USE_PERFORMANCE_OPTIMIZATION "Optimize performance (higher memory consumption)" ON "FOUND_AVX2" OFF)
if (USE_PERFORMANCE_OPTIMIZATION)
	add_definitions( -DUSE_PERFORMANCE_OPTIMIZATION)	
endif (USE_PERFORMANCE_OPTIMIZATION)

option(USE_DEBUG_TOOLS "Use debug tools" OFF)
if (USE_DEBUG_TOOLS)
	add_definitions( -DUSE_DEBUG_TOOLS)	
endif (USE_DEBUG_TOOLS)

option(USE_THIRD_PARTY_METHODS "Use third-party methods" ON)
if (USE_THIRD_PARTY_METHODS)
	add_definitions( -DUSE_THIRD_PARTY_METHODS)	
endif (USE_THIRD_PARTY_METHODS)

cmake_dependent_option(USE_PYTHON_BINDINGS "Generate Python Bindings using PyBind11" ON "PYTHON_EXECUTABLE" OFF)
if (USE_PYTHON_BINDINGS AND UNIX)
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
    message(STATUS "Adding -fPIC option when generating Python bindings using GCC")
endif ()

option(CI_BUILD "Build on CI System" OFF)
mark_as_advanced(CI_BUILD)

if (NOT WIN32)
	if (NOT EXISTS ${CMAKE_BINARY_DIR}/CMakeCache.txt)
	  if (NOT CMAKE_BUILD_TYPE)
		set(CMAKE_BUILD_TYPE "Release" CACHE STRING "" FORCE)
	  endif()
	endif()
endif()

option(USE_OpenMP "Use OpenMP" ON)
if(USE_OpenMP)
	FIND_PACKAGE(OpenMP)
	if(OPENMP_FOUND)
		SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
		SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
	endif()
endif()

if (MSVC)
    set(CMAKE_USE_RELATIVE_PATHS "1")
    # Set compiler flags for "release"
    set(CMAKE_CXX_FLAGS_RELEASE "/MD /MP /Ox /Ob2 /Oi /Ot /fp:fast /D NDEBUG") 
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "/MD /Zi /MP /Ox /Ob2 /Oi /Ot /fp:fast /D NDEBUG") 
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /MP") 
	if (FOUND_AVX2)
		add_compile_options(${AVX_FLAGS})
	endif()
endif (MSVC)

if (UNIX OR MINGW)
    set(CMAKE_USE_RELATIVE_PATHS "1")
    # Set compiler flags for "release" Use generic 64 bit instructions when building on CI
	if (CI_BUILD)
		set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -march=x86-64")
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O3 -DNDEBUG -march=x86-64")
	else()
		set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -march=native")
		set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O3 -DNDEBUG -march=native")
	endif ()
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG}")
	if (FOUND_AVX2)
		add_compile_options(${AVX_FLAGS})
	endif()
endif (UNIX OR MINGW)
if(MINGW)
	set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -O1 -Wa,-mbig-obj")
endif(MINGW)

if(APPLE)
	set(CMAKE_MACOSX_RPATH 1)
endif()

if (MSVC)
add_definitions(-D_CRT_SECURE_NO_DEPRECATE)
endif(MSVC)

set(CMAKE_CXX_STANDARD 11)
