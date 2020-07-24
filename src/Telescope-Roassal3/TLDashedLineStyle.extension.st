Extension { #name : #TLDashedLineStyle }

{ #category : #'*Telescope-Roassal3' }
TLDashedLineStyle class >> roassalStyle [
	^ RSStrokeStyle new
		dashArray: #(8 2)
]
