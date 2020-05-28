Extension { #name : #TLStyleSheet }

{ #category : #'*Telescope-Roassal3' }
TLStyleSheet >> obtainValue: aString inNode: aNode [ 
	^ self obtainValue: aString forEntity: aNode entity inNode: aNode
]
