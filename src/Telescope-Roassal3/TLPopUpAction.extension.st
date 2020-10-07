Extension { #name : #TLPopUpAction }

{ #category : #'*Telescope-Roassal3' }
TLPopUpAction >> createRoassalShapeFor: aTLNode evt: aRSEvent [
	| text lb pos point reversed |
	text := self textBlock cull: aTLNode entity cull: aTLNode.
	lb := RSMultilineLabelBuilder new.
	lb labelShape color: Color white.
	lb := lb compositeLabelFor: text lines.
	pos := self obtainsPositionFrom: aTLNode.
	reversed := pos reversed.
	point := pos computePositionOf: nil relativeTo: aRSEvent shape parent.
	point := aRSEvent camera fromSpaceToPixel: point.
	lb 
		padding: 10;
		isFixed: true;
		color: Color black translucent;
		position: point.
	pos horizontal = #left ifTrue: [ lb translateBy: lb width / -2 @ 0 ].
	pos horizontal = #right ifTrue: [ lb translateBy: lb width / 2 @ 0 ].
	pos vertical = #top ifTrue: [ lb translateBy: 0 @ lb height / -2 ].
	pos vertical = #bottom ifTrue: [ lb translateBy: 0 @ lb height / 2 ].
	^ lb
]
