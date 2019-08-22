generation - node
createElementNodeFromNode: aNode
	| styleSheet text shape |
	styleSheet := aNode effectiveStyleSheet.
	[ text := styleSheet
		obtainValue: #nodeLabel
		forEntity: aNode entity
		inNode: aNode ]
		on: TLStyleSheetMissingProperty
		do: [  ].
	shape := (styleSheet
		obtainValue: #shape
		forEntity: aNode entity
		inNode: aNode) trachelNodeShape.
	shape class = TSLabel
		ifTrue: [ shape text: text ].
	^ RSElement new
		shape: shape;
		extent:
			(styleSheet obtainValue: #width forEntity: aNode entity inNode: aNode)
				@
					(styleSheet obtainValue: #height forEntity: aNode entity inNode: aNode);
		position: 0 @ 0;
		color: styleSheet backgroundColor;
		yourself