"
TODO
"
Class {
	#name : #TLRoassal3Connector,
	#superclass : #TLViewConnector,
	#category : #'Telescope-Roassal3-Connector'
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

{ #category : #'generation - node' }
TLRoassal3Connector >> borderFor: aNode style: styleSheet [
	| color width |
	color := styleSheet obtainValue: #borderColor inNode: aNode.
	width := styleSheet obtainValue: #borderWidth inNode: aNode.
	^ RSBorder new
		color: color;
		width: width;
		yourself
]

{ #category : #'initialize-release' }
TLRoassal3Connector >> close [
	view morph window close
]

{ #category : #accessing }
TLRoassal3Connector >> connectionHeadShapesAvailableForConnector [
	^ TLSimpleShape allSubclasses
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createBoxFor: aNode style: styleSheet [
	| shape |
	shape := (styleSheet
		obtainValue: #shape
		forEntity: aNode entity
		inNode: aNode) roassalShape.
	
	shape
		extent: 
			(styleSheet 
				obtainValue: #width 
				inNode: aNode) @ 
			(styleSheet 
				obtainValue: #height 
				inNode: aNode);
		position: 0 @ 0;
		border: (self borderFor: aNode style: styleSheet);
		color: styleSheet backgroundColor.
	^ TLShapeDecorator new
		shape: shape;
		yourself.
]

{ #category : #'generation - connection' }
TLRoassal3Connector >> createElementConnection: aTLConnection From: aTLNodeSource to: aTLNodeTarget [
	| from to |
	from := self elementFromTLDrawable: aTLNodeSource.
	to := self elementFromTLDrawable: aTLNodeTarget.
	^ RSLine new
		withBorderAttachPoint;
		from: from children first;
		to: to children first;
		yourself.

]

{ #category : #'generation - node' }
TLRoassal3Connector >> createElementNodeFromNode: aNode [
	| styleSheet text shape g |
	styleSheet := aNode effectiveStyleSheet.
	
	shape := self createBoxFor: aNode style: styleSheet.
	text := self createLabelFor: aNode style: styleSheet.

	g := RSComposite new.
	g add: shape.
	text ifNotNil: [ g add: text ].
	g adjustToChildren.
	^ g
]

{ #category : #'generation - group' }
TLRoassal3Connector >> createGroup: aTLEntitiesGroup with: aCollection [ 
	^ RSGroup withAll: aCollection
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createLabelFor: aNode style: styleSheet [
	| text  |
	[ text := styleSheet
		obtainValue: #nodeLabel
		inNode: aNode ]
		on: TLStyleSheetMissingProperty
		do: [ :ex | ^ nil ].
	
	^ RSLabel new
		text: text;
		yourself
]

{ #category : #'generation - legend' }
TLRoassal3Connector >> createLegendFrom: legendItems [
	"TODO"
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateIconLegendEntry: aTLLegendEntry [
 	| img |
	img := Form fromBinaryStream: (aTLLegendEntry iconName value: CYSFileLibrary new) readStream.
	img := RSBitmap new
		form: img;
		yourself.
	self legendBuilder
		text: aTLLegendEntry label
		withShape: ((RSGroup with: img) asShape
			padding: 0@5;
			yourself).
	^ aTLLegendEntry
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateMultiChoiceMenuInteraction: anInteraction onDrawable: aTLDrawable targeting: anotherDrawable [
	"self halt."
	"| sub |
	sub := MenuMorph new.
	(anInteraction choicesListForDrawable: aTLDrawable)
		 collect: anInteraction displayBlock.
	
	MenuMorph new
		add: anInteraction title subMenu: sub."
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateNodeShapeLegendEntry: aLegendEntry [ 
	| entries lb |
	entries := aLegendEntry obtainAssociations 
		collect: [ :collection | | drawable | 
			drawable := collection first.
			drawable effectiveStyleSheet obtainValue: #shape inNode: drawable ].
	lb := self legendBuilder.
	entries associationsDo: [ :labelAndColor |
		lb 
			text: labelAndColor key
			withShape: (labelAndColor value roassalShape 
				noPaint;
				withBorder;
				extent: 20@20) ].
	
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateTLHeightLegendEntry: aTLHeightLegendEntry [ 
	^ self generateIconLegendEntry: aTLHeightLegendEntry.
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateTLWidthLegendEntry: aTLWidthLegendEntry [ 
 	^ self generateIconLegendEntry: aTLWidthLegendEntry.
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> legendBuilder [
	^ view propertyAt: #lb ifAbsentPut: [ 
		RSLegend new
			container: view;
			leyendDo: [ :s | 
				s
					withBorder; 
					color: (Color white alpha: 0.7);
					padding: 10 ];
			onDemand: 'Legend';
			yourself ].
]

{ #category : #accessing }
TLRoassal3Connector >> nodesShapesAvailableForConnector [
	^ TLSimpleShape allSubclasses
]

{ #category : #opening }
TLRoassal3Connector >> open: aTLVisualization inWindowSized: aDimension titled: aString [ 
	| window inspector |
	view := RSCanvas new.
	view @ RSCanvasController new noLegend.
	aTLVisualization generateWith: self.
	self legendBuilder build.
	inspector := GTInspector new.
	window := inspector openOn: view.
	inspector title: aString.
	window extent: aDimension.
	
]

{ #category : #view }
TLRoassal3Connector >> updateViewForVisualization: aTLVisualization [
	view signalUpdate
]
