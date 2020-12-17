Extension { #name : #TLClickInteraction }

{ #category : #'*Telescope-Roassal3' }
TLClickInteraction >> onRoassalShape: aShape with: aNode [
	self flag: #TODO. "issue with HideAndShowConnections"
	"This shape has 2 times this interaction
	- one for show
	- two for hide
	But update runs twice, then this produces a bad animation.
	Will be nice to have one RSMouseClick to run all thhe click interactions in this
	shape and then call update"
	aShape when: RSMouseLeftClick do: [ :evt |
		self actionOn: aNode.
		aNode visualization update
		 ].
	
]
