Extension { #name : #TLDottedLineStyle }

{ #category : #'*Telescope-Roassal3' }
TLDottedLineStyle class >> roassalStyle [
	 ^ RSStrokeStyle new
		dashArray: #(2)
]
