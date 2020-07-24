Extension { #name : #TLMultiChoiceMenuInteraction }

{ #category : #'*Telescope-Roassal3' }
TLMultiChoiceMenuInteraction >> onRoassalShape: aRSShape with: aNode [
	aRSShape when: RSMouseRightClick do: [ :evt | 
		| menu sub |
		menu := MenuMorph new.
		
		sub := MenuMorph new.
		(self choicesListForDrawable: aNode) collect: self displayBlock 
			thenDo: [ :x | sub add: x target: nil selector: nil ].
		menu 
			add: title
			subMenu: sub.
		menu popUpInWorld.
		 ].
]
