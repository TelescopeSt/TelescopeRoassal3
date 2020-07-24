Extension { #name : #TLStyleSheet }

{ #category : #'*Telescope-Roassal3' }
TLStyleSheet >> getValue: aString inNode: aTLNode [ 
	[ ^ self
		obtainValue: aString
		inNode: aTLNode ]
		on: Error
		do: [ :ex | ^ nil ].
]

{ #category : #'*Telescope-Roassal3' }
TLStyleSheet >> obtainValue: aString inNode: aNode [ 
	^ self obtainValue: aString forEntity: aNode entity inNode: aNode
]
