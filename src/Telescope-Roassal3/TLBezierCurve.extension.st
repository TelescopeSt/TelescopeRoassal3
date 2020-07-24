Extension { #name : #TLBezierCurve }

{ #category : #'*Telescope-Roassal3' }
TLBezierCurve class >> roassalShape [
	^ RSBezier new
		controlPointsController: TLRoassal3CPBezierController new.
]
