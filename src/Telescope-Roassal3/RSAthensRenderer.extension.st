Extension { #name : #RSAthensRenderer }

{ #category : #'*Telescope-Roassal3' }
RSAthensRenderer >> visitDoubleBorder: border [
	self visitBorder: border.
	athensCanvas draw.
	self visitBorder: (RSBorder new
		width: border width / 2;
		color: Color white;
		yourself). 
]
