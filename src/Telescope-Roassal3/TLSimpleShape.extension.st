Extension { #name : #TLSimpleShape }

{ #category : #'*Telescope-Roassal3' }
TLSimpleShape class >> roassalShape [
	^ RSPolygon new
		points: self polygonPoints * (1@ -1);
		yourself
]
