"
TODO
"
Class {
	#name : #TLRoassal3CPBezierController,
	#superclass : #TLRoassal3CPController,
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #hooks }
TLRoassal3CPBezierController >> controlPointsFor: anEdge [
	| ap size from to |
	ap := anEdge attachPoint.
	anEdge from = anEdge to ifTrue: [
		^ self selfLoopControlPointsFor: anEdge.
		 ].
	size := self numberOfEdgesFor: anEdge.
	from := ap startingPointOf: anEdge.
	"from = anEdge from parent position ifTrue: [ self halt. ]."
	to := ap endingPointOf: anEdge.
	^ size > 1 
		ifTrue: [ self controlPointsFrom: from to: to ]
		ifFalse: [ Array with: from with: to].
	
]

{ #category : #hooks }
TLRoassal3CPBezierController >> numberOfEdgesFor: anEdge [
	| from to size |
	from := anEdge from.
	to := anEdge to.
	size := 0.
	from connectedEdges do: [ :ed | 
		(ed to = to or: [ ed from = to ])
			ifTrue: [ size := size + 1 ] ].
	^ size
]

{ #category : #hooks }
TLRoassal3CPBezierController >> selfLoopControlPointsFor: anEdge [
	| temp from to delta |
	temp := anEdge from.
	delta := 50.
	from := temp encompassingRectangle topCenter.
	to := temp encompassingRectangle leftCenter.
	
	^ Array
		with: from 
		with: from - (0 @ delta)
		with: to - (delta @ 0)
		with: to - (5 @ 0)
]
