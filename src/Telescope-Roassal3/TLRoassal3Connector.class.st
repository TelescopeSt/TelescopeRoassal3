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
TLRoassal3Connector >> addElementNodeInView: aDecorator [
	| arr |
	arr := view tlDecorators.
	arr at: aDecorator shape children first put: aDecorator.
	view add: aDecorator shape.
]

{ #category : #view }
TLRoassal3Connector >> allNodesFromGroup: group in: allNodes [
	group do: [ :s | s isNode 
		ifTrue: [ allNodes add: s ]
		ifFalse: [ self allNodesFromGroup: s in: allNodes ]
		 ].
]

{ #category : #view }
TLRoassal3Connector >> applyLayoutOf: aTLGroup on: group [
	| from to zero allNodes |	
	allNodes := OrderedCollection new.
	self allNodesFromGroup: group in: allNodes.
	from := allNodes collect: #position.
	aTLGroup layout on: group.
	to := allNodes collect: #position.
	zero := 0@0.
	(from allSatisfy: [ :p | p = zero ]) ifTrue: [ ^ self ].
	view newAnimation
		duration: 1 seconds;
		onStepDo: [ :t |
			allNodes doWithIndex: [ :s :i |
				s position: ( (from at:i) interpolateTo: (to at: i)  at: t)  ].
			view zoomToFit.
			].
]

{ #category : #'generation - connection' }
TLRoassal3Connector >> applyStyle: aTLStyleSheet onLine: aRSLine [
	| style line |
	style := aTLStyleSheet.
	line := aRSLine.
	
	line width: style width.
	line color: style color.
	{#head->#markerEnd:}
		do: [ :asso | | substyle shape |
			substyle := (style copyWithout: #(#shape)) + (style > asso key).
			shape := substyle shape roassalShape.
			shape color: substyle color.
			shape size: 10.
			line perform: asso value with: shape.
			 ]
	
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

{ #category : #'generation - connection' }
TLRoassal3Connector >> createElementConnection: aTLConnection From: aTLNodeSource to: aTLNodeTarget [
	| from to line |
	from := self elementFromTLDrawable: aTLNodeSource.
	to := self elementFromTLDrawable: aTLNodeTarget.
	
	line := RSLine new
		attachPoint: (RSBorderAttachPoint new
			endOffset: 5);
		from: from shape children first;
		to: to shape children first;
		yourself.
	self applyStyle: aTLConnection effectiveStyleSheet onLine: line.
	^ line
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createElementNodeFromNode: aNode [
	| styleSheet text shape g |
	styleSheet := aNode effectiveStyleSheet.
	
	shape := self createShapeFor: aNode style: styleSheet.
	text := self createLabelFor: aNode style: styleSheet shape: shape.

	g := RSComposite new.
	g add: shape.
	g model: aNode.
	g @ TLDraggable.
	
	g adjustToChildren.
	text ifNotNil: [ g add: text ].
	self customizeInteractions: aNode with: g.
	^ TLShapeDecorator new
		shape: g;
		yourself
]

{ #category : #'generation - group' }
TLRoassal3Connector >> createGroup: aTLEntitiesGroup with: aCollection [ 
	^ RSGroup withAll: aCollection
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createLabelFor: aNode style: styleSheet shape: aRSShape [
	| text  color  fontSize position lbl rect temp |
	text := styleSheet getValue: #nodeLabel inNode: aNode.
	text ifNil: [ ^ nil ].
	color := styleSheet getValue: #textColor inNode: aNode.
	fontSize := styleSheet getValue: #labelSize inNode: aNode.
	position := styleSheet getValue: #nodeLabelPosition inNode: aNode.
	rect := aRSShape encompassingRectangle.
	lbl := RSLabel new
		text: text;
		color: color;
		fontSize: fontSize;
		yourself.
	temp := RSBox new
		fromRectangle: (Rectangle 
			floatCenter: rect floatCenter
			extent: rect extent + lbl extent).
	position isString ifFalse: [
	position := position computePositionOf: nil relativeTo: temp.
	lbl position: position ].
	^ lbl
]

{ #category : #'generation - legend' }
TLRoassal3Connector >> createLegendFrom: legendItems [
	"TODO"
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> createMenuFor: aTLSimpleNode [ 

	self shouldNotImplement
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createShapeFor: aNode style: styleSheet [
	| shape |
	shape := (styleSheet
		obtainValue: #shape
		forEntity: aNode entity
		inNode: aNode) roassalShape.
	
	shape
		extent: (styleSheet obtainValue: #width inNode: aNode) @ 
			(styleSheet obtainValue: #height inNode: aNode);
		position: 0 @ 0;
		border: (self borderFor: aNode style: styleSheet);
		paint: (self paintFor: aNode style: styleSheet).
	^ shape
]

{ #category : #'generation - node' }
TLRoassal3Connector >> customizeInteractions: aNode with: aRSShape [
	aNode allInteractions do: [ :in | in onRoassalShape: aRSShape with: aNode ].
]

{ #category : #'generation - node' }
TLRoassal3Connector >> define: aRSComposite asParentFor: aCollection [ 
	
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
TLRoassal3Connector >> generateMenuInteraction: aMenuInteraction onDrawable: aTLDrawable targetingDrawable: aTargetDrawable [
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateMouseOverInteraction: aTLMouseOverInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateMovedInteraction: aTLNodeMovedInteraction onDrawable: aTLSimpleNode targetingDrawable: aTLSimpleNode3 [ 
	
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
TLRoassal3Connector >> generateNodeBackgroundLegendEntry: aTLNodeBackgroundLegendEntry [ 
	
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateNodeShapeLegendEntry: aLegendEntry [ 
	| entries lb |
	entries := aLegendEntry obtainAssociations 
		collect: [ :collection | | drawable | 
			drawable := collection first.
			drawable effectiveStyleSheet obtainValue: #shape inNode: drawable ].
	lb := self legendBuilder.
	entries associationsDo: [ :labelAndColor | | com |
		com := lb 
			text: labelAndColor key
			withShape: (labelAndColor value roassalShape 
				noPaint;
				withBorder;
				extent: 20@20).
		com padding: 0@ 5 ].
	
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateTLColorLegendEntry: aTLColorLegendEntry [ 
	^ aTLColorLegendEntry
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateTLHeightLegendEntry: aTLHeightLegendEntry [ 
	^ self generateIconLegendEntry: aTLHeightLegendEntry.
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateTLStyleSheetLegendEntry: aTLStyleSheetLegendEntry [ 
	^ aTLStyleSheetLegendEntry
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
	| window inspector lb |
	view := RSCanvas new.
	view inspectorContext: RSEmptyContext new.
	view @ RSCanvasController new noLegend.
	view @ TLDragPointCanvas.
	aTLVisualization generateWith: self.
	lb := self legendBuilder.
	lb shapes ifNotEmpty: [ lb build]. 
	
	inspector := GTInspector new.
	window := inspector openOn: view.
	inspector title: aString.
	window extent: aDimension.
	
]

{ #category : #'generation - node' }
TLRoassal3Connector >> paintFor: aNode style: styleSheet [
	| color url |
	color := styleSheet obtainValue: #backgroundColor inNode: aNode.
	url := styleSheet attributes at: #backgroundImageUrl ifAbsent: [ nil ].
	^ TLRoassalPaint new
		color: color;
		imageUrl: url asString;
		yourself
]

{ #category : #view }
TLRoassal3Connector >> removeElementConnectionFromView: aRSLine [ 
	aRSLine remove
]

{ #category : #'updating - node' }
TLRoassal3Connector >> updateElementNodeOf: aTLSimpleNode [ 
	
]

{ #category : #'updating - interaction' }
TLRoassal3Connector >> updateInteractionsOf: aDrawable [
	self flag: #todo.	"Remove the interaction that are no longer needed and add the new ones."
	(aDrawable allInteractions select: #isGraphicallyRepresented)
		do: [ :aGraphicInteraction | aGraphicInteraction updateWith: self forDrawable: aDrawable ]
]

{ #category : #'updating - legend' }
TLRoassal3Connector >> updateLegend: aTLLegend [ 
	
]

{ #category : #view }
TLRoassal3Connector >> updateViewForVisualization: aTLVisualization [
	view signalUpdate
]
