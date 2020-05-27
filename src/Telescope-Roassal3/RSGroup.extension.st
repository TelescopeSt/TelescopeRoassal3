Extension { #name : #RSGroup }

{ #category : #'*Telescope-Roassal3' }
RSGroup >> dimension [
	^ self extent
]

{ #category : #'*Telescope-Roassal3' }
RSGroup >> isNode [
	^ false
]

{ #category : #'*Telescope-Roassal3' }
RSGroup >> occupyMaxSpace [
	^ false
]

{ #category : #'*Telescope-Roassal3' }
RSGroup >> position: aPoint [
	self translateTo: aPoint
]
