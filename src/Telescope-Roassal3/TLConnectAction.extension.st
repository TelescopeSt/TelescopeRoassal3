Extension { #name : #TLConnectAction }

{ #category : #'*Telescope-Roassal3' }
TLConnectAction >> createRoassalShapeFor: aNode evt: evt [
	self actionOn: aNode.
	aNode visualization update.
	^ nil.
]
