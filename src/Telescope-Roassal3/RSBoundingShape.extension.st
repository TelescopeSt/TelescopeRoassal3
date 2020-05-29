Extension { #name : #RSBoundingShape }

{ #category : #'*Telescope-Roassal3' }
RSBoundingShape >> incomingAdjacentNodes [
	^ self incomingEdges collect: #from
]
