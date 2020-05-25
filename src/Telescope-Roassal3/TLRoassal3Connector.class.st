"
TODO
"
Class {
	#name : #TLRoassal3Connector,
	#superclass : #TLViewConnector,
	#category : #'Telescope-Roassal3-Connecctor'
}

{ #category : #accessing }
TLRoassal3Connector class >> priority [
	^ 10000000
]

{ #category : #view }
TLRoassal3Connector >> addElementConnectionInView: aRSLine [ 
	view add: aRSLine
]

{ #category : #view }
TLRoassal3Connector >> addElementLegendInView: legend [
	"TODO"
]

{ #category : #view }
TLRoassal3Connector >> addElementNodeInView: aRSShape [
	view add: aRSShape
]

{ #category : #'generation - connection' }
TLRoassal3Connector >> createElementConnection: aTLConnection From: aTLNodeSource to: aTLNodeTarget [
	| from to |
	from := self elementFromTLDrawable: aTLNodeSource.
	to := self elementFromTLDrawable: aTLNodeTarget.
	^ RSLine new
		withBorderAttachPoint;
		from: from;
		to: to;
		yourself.

]

{ #category : #'generation - node' }
TLRoassal3Connector >> createElementNodeFromNode: aNode [
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
	shape class = RSLabel
		ifTrue: [ shape text: text ].
	shape := TLShapeDecorator new
		shape: shape;
		yourself.
	^ shape
		extent:
			(styleSheet obtainValue: #width forEntity: aNode entity inNode: aNode)
				@
					(styleSheet obtainValue: #height forEntity: aNode entity inNode: aNode);
		position: 0 @ 0;
		
		color: styleSheet backgroundColor;
		yourself
]

{ #category : #'generation - group' }
TLRoassal3Connector >> createGroup: aTLEntitiesGroup with: aCollection [ 
	^ RSGroup withAll: aCollection
]

{ #category : #'generation - legend' }
TLRoassal3Connector >> createLegendFrom: legendItems [
	"TODO"
]

{ #category : #opening }
TLRoassal3Connector >> open: aTLVisualization inWindowSized: aDimension titled: aString [ 
	| window |
	view := RSCanvas new.
	view @ RSCanvasController new.
	window := view open.
	window
		extent: aDimension;
		setLabel: aString.
	aTLVisualization generateWith: self
]
