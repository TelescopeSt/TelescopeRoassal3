Extension { #name : #TLNodeMovedInteraction }

{ #category : #'*Telescope-Roassal3' }
TLNodeMovedInteraction >> onRoassalShape: aRSShape with: aNode [
	aRSShape when: RSPositionChangedEvent do: [ :s | 
		 self actionOn: aNode parameter: s position.
		aNode visualization update ].
]
