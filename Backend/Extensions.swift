//
//  Extensions.swift
//  Tanks
//
//  Created by Alessandro Vinciguerra on 27/07/2017.
//	<alesvinciguerra@gmail.com>
//Copyright (C) 2017 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

import Foundation

//custom operators for physics
infix operator +/
infix operator +/=

extension CGFloat {

	//when adding to a CGFloat, scale down the impact of the
	//operation to account for the update frequency (60Hz)
	//when the forces involved use SI units (seconds)
	static func +/ (left: CGFloat, right: CGFloat) -> CGFloat {
		return left + right / GameMgr.timeScaleFactor
	}

	//compound assignment using +/ operator
	static func +/= (left: inout CGFloat, right: CGFloat) {
		left = left +/ right
	}

}

//PROTEST! BRING BACK THE C!
postfix operator ++
postfix operator --

extension Int {

	//since Swift is ditching the increment/decrement operators, just redefine them
	static postfix func ++ (int: inout Int) {
		int += 1
	}

	static postfix func -- (int: inout Int) {
		int -= 1
	}
	
}
