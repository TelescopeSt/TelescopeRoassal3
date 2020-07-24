"
TODO
"
Class {
	#name : #TLRoassal3CPController,
	#superclass : #RSAbstractCPAPController,
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #hooks }
TLRoassal3CPController >> controlPointsFrom: fromPoint to: toPoint [
	| vector u middle |
	vector := fromPoint - toPoint.
	u := vector normal.
	middle := (fromPoint + toPoint) / 2.0.
	middle := middle - (u * 15).
	^ Array 
		with: fromPoint
		with: middle
		with: toPoint
]
