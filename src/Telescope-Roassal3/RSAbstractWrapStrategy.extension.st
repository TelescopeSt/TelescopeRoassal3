Extension { #name : #RSAbstractWrapStrategy }

{ #category : #'*Telescope-Roassal3' }
RSAbstractWrapStrategy class >> fromTLName: aString [ 
	aString = #wrap ifTrue: [ ^ RSWrapStrategy new ].
	aString = #ellipsis ifTrue: [ ^ RSWrapEllipsisStrategy new ].
	^ RSNoWrapStrategy new
]
