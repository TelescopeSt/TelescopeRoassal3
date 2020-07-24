Extension { #name : #TLSegmentsCurve }

{ #category : #'*Telescope-Roassal3' }
TLSegmentsCurve class >> roassalShape [
	^ RSPolyline new
	controlPointsController: TLRoassal3CPController new.
]
