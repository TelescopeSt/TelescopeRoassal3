Extension { #name : #TLMouseOverInteraction }

{ #category : #'*Telescope-Roassal3' }
TLMouseOverInteraction >> onRoassalShape: aShape [
	
]

{ #category : #'*Telescope-Roassal3' }
TLMouseOverInteraction >> onRoassalShape: aShape with: aNode [
	| shape |
	shape := nil.
	aShape when: RSMouseEnter do: [ :evt | 
		shape := self action createRoassalShapeFor: aNode evt: evt.
		evt canvas add: shape. 
		evt signalUpdate ].
	aShape when: RSMouseLeave do: [ :evt | shape remove. evt signalUpdate ].
]
