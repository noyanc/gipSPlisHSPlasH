/*
 * gipEmptyPlugin.cpp
 *
 *  Created on: Mar 11, 2023
 *      Author: Noyan Culum
 *      Created by: kayra
 */

#include "gipSPlisHSPlasH.h"
#include <bits/stdc++.h>
#include "gBaseCanvas.h"
#include "gApp.h"
#include "gImage.h"
#include <Windows.h>


gipSPlisHSPlasH::gipSPlisHSPlasH() {

}

gipSPlisHSPlasH::~gipSPlisHSPlasH() {
}

void gipSPlisHSPlasH::SplishsplashSetup() {
	LPCWSTR powershellexecutable = L"powershell.exe";
	LPCWSTR powershellcommand = L"splash";
	int windowstate = SW_SHOW;
	LPCWSTR powershelldirectory = L"C:\dev\glist\glistplugins\gipSPlisHSPlasH\libs\src\SPlisHSPlasH";

	if(!SetCurrentDirectory(powershelldirectory)){
		return 1;
	}

	HINSTANCE hinstance = ShellExecute(0, 0, powershellexecutable, powershellcommand, powershelldirectory, windowstate);
}
