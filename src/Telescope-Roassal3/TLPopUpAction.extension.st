Extension { #name : #TLPopUpAction }

{ #category : #'*Telescope-Roassal3' }
TLPopUpAction >> createRoassalShapeFor: aTLNode evt: aRSEvent [
	| text lb pos |
	text := self textBlock cull: aTLNode entity cull: aTLNode.
	lb := RSMultilineLabelBuilder new.
	lb labelShape color: Color white.
	lb := lb compositeLabelFor: text lines.
	pos := self obtainsPositionFrom: aTLNode.
	pos := pos computePositionOf: nil relativeTo: aRSEvent shape.
	pos := aRSEvent camera fromSpaceToPixel: pos.
	lb 
		padding: 10;
		isFixed: true;
		color: Color black translucent;
		position: pos.
	
	^ lb
]
