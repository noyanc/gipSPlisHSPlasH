add_executable(ReadWriteStateTests
	  ReadWriteStateTests.cpp
)
add_dependencies(ReadWriteStateTests SimulatorBase)
target_include_directories(ReadWriteStateTests PRIVATE ${PROJECT_SOURCE_DIR}/extern/Catch2)
target_link_libraries(ReadWriteStateTests SimulatorBase)

set_target_properties(ReadWriteStateTests PROPERTIES FOLDER "Tests")
set_target_properties(ReadWriteStateTests PROPERTIES DEBUG_POSTFIX ${CMAKE_DEBUG_POSTFIX})
set_target_properties(ReadWriteStateTests PROPERTIES RELWITHDEBINFO_POSTFIX ${CMAKE_RELWITHDEBINFO_POSTFIX})
set_target_properties(ReadWriteStateTests PROPERTIES MINSIZEREL_POSTFIX ${CMAKE_MINSIZEREL_POSTFIX})
