Extension { #name : #TLClickInteraction }

{ #category : #'*Telescope-Roassal3' }
TLClickInteraction >> onRoassalShape: aShape with: aNode [
	aShape when: RSMouseClick do: [ :evt |
		self action onRoassalShape: aShape with: aNode ].
	
]
