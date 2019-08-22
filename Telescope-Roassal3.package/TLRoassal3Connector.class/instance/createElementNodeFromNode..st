generation - node
createElementNodeFromNode: aNode
	| styleSheet |
	styleSheet := aNode effectiveStyleSheet.
	^ RSElement new
		shape: TSBox new;
		extent:
			(styleSheet obtainValue: #width forEntity: aNode entity inNode: aNode)
				@
					(styleSheet obtainValue: #height forEntity: aNode entity inNode: aNode);
		position: 0 @ 0;
		color: styleSheet backgroundColor;
		yourself