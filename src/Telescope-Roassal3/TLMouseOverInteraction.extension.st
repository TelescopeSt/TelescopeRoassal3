Extension { #name : #TLMouseOverInteraction }

{ #category : #'*Telescope-Roassal3' }
TLMouseOverInteraction >> onRoassalShape: aShape with: aNode [
	| shape |
	aShape when: RSMouseEnter do: [ :evt | 
		self action isPopUp ifTrue: [ 
			shape := self action createRoassalShapeFor: aNode evt: evt.
			shape ifNotNil: [ 
				evt canvas add: shape.
				evt signalUpdate ]
		] ifFalse: [
		 	self action regularActionOn: aNode.
			aNode visualization update.
		].	
	].
	aShape when: RSMouseLeave do: [ :evt | 
		self action isPopUp ifTrue: [ 
			shape ifNotNil: [ shape remove ].
			evt signalUpdate.
		] ifFalse: [ 
			self action reverseActionIfNecessaryOn: aNode.
			aNode visualization update.
		].
	].

]
