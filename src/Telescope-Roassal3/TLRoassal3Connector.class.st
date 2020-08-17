"
TODO
"
Class {
	#name : #TLRoassal3Connector,
	#superclass : #TLViewConnector,
	#instVars : [
		'lastPositions',
		'firstTimeAnimation'
	],
	#category : #'Telescope-Roassal3-Connector'
}

{ #category : #accessing }
TLRoassal3Connector class >> priority [
	^ 10000000
]

{ #category : #view }
TLRoassal3Connector >> addElementConnectionInView: aRSLine [
	| label |
	view add: aRSLine.
	label := aRSLine propertyAt: #label.
	label ifNil: [ ^ self ].
	label := RSLabel new
		text: label;
		fontSize: (aRSLine propertyAt: #labelSize).
	view add: label.
	RSLocation new
		center;
		stick: label on: aRSLine
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
TLRoassal3Connector >> allNodesFromGroup: group in: nodes [ 
	group do: [ :s | s isNode 
		ifTrue: [ | shape |
			shape := view shapeFromModel: s.
			shape ifNotNil: [ nodes at: shape ifAbsentPut: [ shape position ] ]
			 ]
		ifFalse: [ self allNodesFromGroup: s in: nodes ]
		 ].
]

{ #category : #layout }
TLRoassal3Connector >> applyLayoutOf: aTLGroup on: group [
	lastPositions ifNil: [ lastPositions := Dictionary new ].
	self allNodesFromGroup: aTLGroup in: lastPositions.
	aTLGroup layout on: group.
]

{ #category : #'generation - connection' }
TLRoassal3Connector >> applyStyle: aTLStyleSheet onLine: aRSLine connection: aTLConnection [
	| style line label |
	style := aTLStyleSheet.
	line := aRSLine.
	label := style getValue: #connectionLabel inNode: aTLConnection.
	label ifNotNil: [ 
		aRSLine propertyAt: #label put: label.
		aRSLine propertyAt: #labelSize put: (style getValue: #connectionLabelSize inNode: aTLConnection)
		 ].
	
	line width: style width.
	line color: style color.
	
	{#head->#markerEnd:}
		do: [ :asso | | substyle shape marker |
			substyle := (style copyWithout: #(#shape)) + (style > asso key).
			shape := substyle shape roassalShape.
			shape
				ifNil: [ line attachPoint endOffset: 0 ]
				ifNotNil: [ 
					shape color: substyle color.
					shape size: 10.
					marker := shape asMarker. 
					line perform: asso value with: marker.
				].
		]
	
]

{ #category : #'generation - node' }
TLRoassal3Connector >> borderFor: aNode style: styleSheet [
	| color width style |
	color := styleSheet obtainValue: #borderColor inNode: aNode.
	width := styleSheet obtainValue: #borderWidth inNode: aNode.
	style := styleSheet getValue: #borderStyle inNode: aNode.
	style ifNil: [ style := TLSolidLineStyle ].
	^ RSBorder new
		color: color;
		width: width;
		style: style roassalStyle;
		yourself
]

{ #category : #'initialize-release' }
TLRoassal3Connector >> close [
	view morph window close
]

{ #category : #initialization }
TLRoassal3Connector >> closeVisualization [
	view morph root close
]

{ #category : #accessing }
TLRoassal3Connector >> connectionHeadShapesAvailableForConnector [
	^ TLSimpleShape allSubclasses
]

{ #category : #'generation - connection' }
TLRoassal3Connector >> createElementConnection: aTLConnection From: aTLNodeSource to: aTLNodeTarget [
	| from to line style curveStyle ap lineStyle |
	from := self elementFromTLDrawable: aTLNodeSource.
	to := self elementFromTLDrawable: aTLNodeTarget.
	style := aTLConnection effectiveStyleSheet.
	curveStyle := style getValue: #curveStyle inNode: aTLConnection.
	lineStyle := style getValue: #connectionLineStyle inNode: aTLConnection.
	lineStyle ifNil: [ lineStyle := TLSolidLineStyle ].
	line := curveStyle roassalShape.
	line border style: lineStyle roassalStyle.
	ap := RSBorderAttachPoint new offset: 0; endOffset: 5.
	line
		attachPoint: ap;
		from: from shape children first;
		to: to shape children first.
	self applyStyle: style onLine: line connection: aTLConnection.
	line model: aTLConnection.
	self customizeInteractions: aTLConnection with: line.
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
	
	text ifNotNil: [ g add: text ].
	g adjustToChildren.
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
	| text color fontSize nodeLabelPosition lbl builder wrap wrapSize block |
	text := styleSheet getValue: #nodeLabel inNode: aNode.
	(text isNil or: [text =  TLNoNodeLabel] ) ifTrue: [ ^ nil ].
	color := styleSheet getValue: #textColor inNode: aNode.
	fontSize := styleSheet getValue: #labelSize inNode: aNode.
	nodeLabelPosition := TLPosition for: (styleSheet getValue: #nodeLabelPosition inNode: aNode).
	wrap := styleSheet getValue: #nodeLabelWrap inNode: aNode.
	wrapSize := styleSheet getValue: #nodeLabelMaxWidth inNode: aNode.
	
	builder := TLMultiLineLabelBuilder new.
	builder labelShape
		text: text;
		color: color;
		fontSize: fontSize.
	builder
		wrap: wrap;
		wrapMaxWidth: wrapSize.
	lbl := builder wrapShapeFor: text.
	block := [ | temp rect position |
		rect := aRSShape encompassingRectangle.
			temp := RSBox new
				fromRectangle: (Rectangle 
				floatCenter: rect floatCenter
				extent: rect extent + lbl extent).
			position := nodeLabelPosition computePositionOf: nil relativeTo: temp.
			lbl position: position.
		 ].
	aRSShape 
		removeInteractionIfPresent: self class;
		when: RSExtentChangedEvent do: block.
	block value.
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
	shape ifNil: [ shape := RSBox new ].
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
TLRoassal3Connector >> define: aTLShapeDecorator asParentFor: aCollection [ 
	aCollection do: [ :s | s parent: aTLShapeDecorator ].
	aTLShapeDecorator children: aCollection.
	aTLShapeDecorator extent: aCollection encompassingRectangle extent + 20.
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateClickInteraction: aClickInteraction onDrawable: aTLDrawable targetingDrawable: anObject [
	
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateIconLegendEntry: aTLLegendEntry [
 	| img cls |
	cls := Smalltalk at: #CYSFileLibrary ifAbsent: [ 
		^ aTLLegendEntry ].
	img := Form fromBinaryStream: (aTLLegendEntry iconName value: cls new) readStream.
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
	entries associationsDo: [ :labelAndColor | | com shape |
		shape := labelAndColor value roassalShape.
		shape 
			ifNil: [ shape := RSBox new ]
			ifNotNil: [ shape withBorder].
		shape 
			noPaint;
			extent: 20@20.
		com := lb 
			text: labelAndColor key
			withShape: (shape).
		com padding: 0@ 5 
	].
	
]

{ #category : #'generation - interaction' }
TLRoassal3Connector >> generateRightClickInteraction: aTLRightClickInteraction onDrawable: aTLSimpleNode targetingDrawable: aTLSimpleNode3 [ 
	
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
	firstTimeAnimation := true.
	aTLVisualization generateWith: self.
	lastPositions := nil. 
	firstTimeAnimation := false.
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
	url ifNotNil: [ url := url asString ].
	^ TLRoassalPaint new
		color: color;
		imageUrl: url;
		yourself
]

{ #category : #view }
TLRoassal3Connector >> removeElementConnectionFromView: aRSLine [ 
	aRSLine remove
]

{ #category : #'drawing - removing' }
TLRoassal3Connector >> removeElementFromView: element associatedToDrawable: aTLDrawable [ 
	element shape remove
]

{ #category : #'updating - connection' }
TLRoassal3Connector >> updateEdgeOf: aTLConnection [ 
	| style line |
	style := aTLConnection effectiveStyleSheet.
	line := view edges shapeFromModel: aTLConnection.
	self applyStyle: style onLine: line connection: aTLConnection.
	
]

{ #category : #'updating - node' }
TLRoassal3Connector >> updateElementNodeOf: aNode [ 
	| g styleSheet shape text |
	g := view shapeFromModel: aNode.
	g ifNil: [ ^ self ].
	styleSheet := aNode effectiveStyleSheet.
	shape := g shapes first.
	shape
		border: (self borderFor: aNode style: styleSheet);
		paint: (self paintFor: aNode style: styleSheet);
		extent: (styleSheet obtainValue: #width inNode: aNode) @ 
			(styleSheet obtainValue: #height inNode: aNode).
		
	
	g shapes size > 1 ifTrue: [ g shapes second remove. ].

	text := self createLabelFor: aNode style: styleSheet shape: shape.
	text ifNotNil: [ g add: text ].
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
	| from to | 
	view signalUpdate.
	firstTimeAnimation ifTrue: [ 
		lastPositions := nil. 
		firstTimeAnimation := false ].
	lastPositions ifNil: [ ^ self ].
	from := lastPositions.
	to := Dictionary new.
	from keysDo: [ :k | to at: k put: k position ].
	view newAnimation
		duration: 1 seconds;
		onStepDo: [ :t |
			from keysAndValuesDo:  [ :k :v |
				k position: (v interpolateTo: (to at: k)  at: t)  ].
			view zoomToFit.
			].
		
	lastPositions := nil.
]
