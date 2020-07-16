Extension { #name : #TLCustomAction }

{ #category : #'*Telescope-Roassal3' }
TLCustomAction >> onRoassalShape: aRSShape with: aTLSimpleNode [ 
	self actionOn: aTLSimpleNode.
	aTLSimpleNode visualization update
]
