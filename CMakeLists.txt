cmake_minimum_required(VERSION 3.10)

# Set some basic project attributes
project (gipSPlisHSPlasH
	VERSION 0.1
	DESCRIPTION "A Hello World Project")

# This project will output an executable file
file(GLOB SRC_FILES *.cpp)
add_executable(${PROJECT_NAME} ${SRC_FILES})

# Create a simple configuration header
configure_file(config.h.in config.h)

# Local Header Files
SET(TARGET_H
	AnimationField.h
	AnimationFieldSystem.h
	BoundaryModel.h
	BoundaryModel_Akinci2012.h
	BoundaryModel_Bender2019.h
	BoundaryModel_Koschier2017.h
	Common.h
	Emitter.h
	EmitterSystem.h
	FluidModel.h
	NeighborhoodSearch.h
	NonPressureForceBase.h
	RigidBodyObject.h
	Simulation.h
	SPHKernels.h
	StaticRigidBody.h
	TimeManager.h
	TimeStep.h
	TriangleMesh.h
	XSPH.h
	SimulationDataDFSPH.h
	TimeStepDFSPH.h
	DragBase.h
	DragForce_Gissler2017.h
	DragForce_Macklin2014.h
	Elasticity_Becker2009.h
	Elasticity_Kugelstadt2021.h
	Elasticity_Peer2018.h
	ElasticityBase.h
	SimulationDataICSPH.h
	TimeStepICSPH.h
	SimulationDataIISPH.h
	TimeStepIISPH.h
	SimulationDataPBF.h
	TimeIntegration.h
	TimeStepPBF.h
	SimulationDataPCISPH.h
	TimeStepPCISPH.h
	SimulationDataPF.h
	TimeStepPF.h
	SurfaceTension_Akinci2013.h
	SurfaceTension_Becker2007.h
	SurfaceTension_He2014.h
	SurfaceTension_ZorillaRitter2020.h
	SurfaceTension_ZorillaRitter2020_haltonVec323.h
	SurfaceTensionBase.h
	AVX_math.h
	CholeskyAVXSolver.h
	DebugTools.h
	GaussQuadrature.h
	MathFunctions.h
	MatrixFreeSolver.h
	MeshImport.h
	PoissonDiskSampling.h
	RegularSampling2D.h
	RegularTriangleSampling.h
	SceneLoader.h
	SceneParameterObjects.h
	SceneWriter.h
	SDFFunctions.h
	SimpleQuadrature.h
	SurfaceSampling.h
	VolumeSampling.h
	WindingNumbers.h
	Viscosity_Bender2017.h
	Viscosity_Peer2015.h
	Viscosity_Peer2016.h
	Viscosity_Standard.h
	Viscosity_Takahashi2015.h
	Viscosity_Weiler2018.h
	ViscosityBase.h
	MicropolarModel_Bender2017.h
	VorticityBase.h
	VorticityConfinement.h
	SimulationDataWCSPH.h
	TimeStepWCSPH.h
	)
	
# Local Source Files
SET(TARGET_SRC
	AnimationField.cpp
	AnimationFieldSystem.cpp
	BoundaryModel.cpp
	BoundaryModel_Akinci2012.cpp
	BoundaryModel_Bender2019.cpp
	BoundaryModel_Koschier2017.cpp
	Emitter.cpp
	EmitterSystem.cpp
	FluidModel.cpp
	NonPressureForceBase.cpp
	NonPressureForceRegistration.cpp
	Simulation.cpp
	SPHKernels.cpp
	TimeManager.cpp
	TimeStep.cpp
	TriangleMesh.cpp
	XSPH.cpp
	SimulationDataDFSPH.cpp
	TimeStepDFSPH.cpp
	DragBase.cpp
	DragForce_Gissler2017.cpp
	DragForce_Macklin2014.cpp
	Elasticity_Becker2009.cpp
	Elasticity_Kugelstadt2021.cpp
	Elasticity_Peer2018.cpp
	ElasticityBase.cpp
	SimulationDataICSPH.cpp
	TimeStepICSPH.cpp
	SimulationDataIISPH.cpp
	TimeStepIISPH.cpp
	SimulationDataPBF.cpp
	TimeIntegration.cpp
	TimeStepPBF.cpp
	SimulationDataPCISPH.cpp
	TimeStepPCISPH.cpp
	SimulationDataPF.cpp
	TimeStepPF.cpp
	SurfaceTension_Akinci2013.cpp
	SurfaceTension_Becker2007.cpp
	SurfaceTension_He2014.cpp
	SurfaceTension_ZorillaRitter2020.cpp
	SurfaceTensionBase.cpp
	CholeskyAVXSolver.cpp
	DebugTools.cpp
	GaussQuadrature.cpp
	MathFunctions.cpp
	MeshImport.cpp
	PoissonDiskSampling.cpp
	RegularSampling2D.cpp
	RegularTriangleSampling.cpp
	SceneLoader.cpp
	SceneParameterObjects.cpp
	SceneWriter.cpp
	SDFFunctions.cpp
	SimpleQuadrature.cpp
	VolumeSampling.cpp
	WindingNumbers.cpp
	Viscosity_Bender2017.cpp
	Viscosity_Peer2015.cpp
	Viscosity_Peer2016.cpp
	Viscosity_Standard.cpp
	Viscosity_Takahashi2015.cpp
	Viscosity_Weiler2018.cpp
	ViscosityBase.cpp
	MicropolarModel_Bender2017.cpp
	VorticityBase.cpp
	VorticityConfinement.cpp
	SimulationDataWCSPH.cpp
	TimeStepWCSPH.cpp
	)

# Include the configuration header in the build
target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}")
