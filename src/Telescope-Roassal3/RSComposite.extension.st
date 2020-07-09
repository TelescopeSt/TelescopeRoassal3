Extension { #name : #RSComposite }

{ #category : #'*Telescope-Roassal3' }
RSComposite >> dimension [
	^ self extent
]

{ #category : #'*Telescope-Roassal3' }
RSComposite >> incomingAdjacentNodes [
	^ self children first incomingAdjacentNodes collect: #parent
]

{ #category : #'*Telescope-Roassal3' }
RSComposite >> occupyMaxSpace [
	^ false
]

{ #category : #'*Telescope-Roassal3' }
RSComposite >> outgoingAdjacentNodes [
	^ self children first outgoingAdjacentNodes collect: #parent
]
