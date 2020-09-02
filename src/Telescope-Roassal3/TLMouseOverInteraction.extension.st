Extension { #name : #TLMouseOverInteraction }

{ #category : #'*Telescope-Roassal3' }
TLMouseOverInteraction >> onRoassalShape: aShape with: aNode [
	| remove |
	remove := nil.
	self action isPopUp ifTrue: [ 
		| shape | 
		shape := nil.
		remove := [ :evt |
				shape ifNotNil: [ shape remove ].
				evt signalUpdate.
			].
		aShape 
			when: RSMouseEnter do: [ :evt | 
				shape := self action createRoassalShapeFor: aNode evt: evt.
				shape ifNotNil: [ 
					evt canvas addShape: shape.
					evt signalUpdate ] ];
			when: RSMouseLeave do: remove.
	] ifFalse: [
		remove := [ :evt |
				self action reverseActionIfNecessaryOn: aNode.
				aNode visualization update].
		aShape 
			when: RSMouseEnter do: [ :evt | 
				self action regularActionOn: aNode.
				aNode visualization update];
			when: RSMouseLeave do: remove.
		
	].
	aShape parent ifNotNil: [ :p| p when: RSMouseDragging do: remove ].

]
