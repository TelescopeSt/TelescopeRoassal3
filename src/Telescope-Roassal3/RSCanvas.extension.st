Extension { #name : #RSCanvas }

{ #category : #'*Telescope-Roassal3' }
RSCanvas >> tlDecorators [
	^ self propertyAt: #decorators ifAbsentPut: [ Dictionary new ]
]
