//
// Created by sjeske on 2/20/20.
//

#ifndef SPLISHSPLASH_COMMON_H
#define SPLISHSPLASH_COMMON_H

#include <pybind11/pybind11.h>
#include <pybind11/eigen.h>
#include <pybind11/stl.h>
#include <pybind11/stl_bind.h>

#include <SPlisHSPlasH/Emitter.h>
#include <SPlisHSPlasH/AnimationField.h>
#include <Utilities/OBJLoader.h>
#include <SPlisHSPlasH/Utilities/SceneLoader.h>
#include <Simulator/PositionBasedDynamicsWrapper/PBDWrapper.h>

PYBIND11_MAKE_OPAQUE(std::vector<SPH::Emitter*>)
PYBIND11_MAKE_OPAQUE(std::vector<SPH::AnimationField*>)
PYBIND11_MAKE_OPAQUE(std::vector<SPH::FieldDescription>)
PYBIND11_MAKE_OPAQUE(std::vector<std::array<float, 3>>)
PYBIND11_MAKE_OPAQUE(std::vector<std::array<float, 2>>)
PYBIND11_MAKE_OPAQUE(std::vector<Vector3r>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::MeshFaceIndices>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::BoundaryParameterObject *>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::FluidModelParameterObject*>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::FluidBlockParameterObject*>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::EmitterParameterObject *>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::AnimationFieldParameterObject *>)
PYBIND11_MAKE_OPAQUE(std::vector<Utilities::MaterialParameterObject*>)
PYBIND11_MAKE_OPAQUE(std::vector<PBDWrapper::RBData>)

#endif //SPLISHSPLASH_COMMON_H
