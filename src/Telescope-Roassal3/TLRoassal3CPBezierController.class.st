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
	size := self numberOfEdgesFor: anEdge.
	from := ap startingPointOf: anEdge.
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
