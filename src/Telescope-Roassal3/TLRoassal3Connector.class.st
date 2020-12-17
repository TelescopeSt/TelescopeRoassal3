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

{ #category : #icons }
TLRoassal3Connector class >> telescopeHeightPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 31 0 0 0 36 8 4 0 0 0 219 26 41 220 0 0 0 2 98 75 71 68 0 0 170 141 35 50 0 0 0 9 112 72 89 115 0 0 0 72 0 0 0 72 0 70 201 107 62 0 0 1 225 73 68 65 84 72 199 237 214 191 107 20 81 16 192 241 207 238 222 25 56 76 154 168 4 65 2 33 144 222 66 141 166 52 141 34 36 168 165 63 42 253 3 196 127 192 70 253 23 82 217 72 42 45 68 131 26 17 84 12 250 39 72 34 40 18 3 194 21 18 20 147 189 221 181 184 189 51 111 67 146 59 44 117 166 217 55 188 239 155 157 153 247 222 60 82 169 77 153 66 161 229 151 194 107 208 176 170 40 237 59 106 77 205 31 73 32 176 68 114 133 72 40 133 72 220 158 122 67 93 211 41 87 101 238 88 53 236 99 48 49 182 139 68 98 185 81 47 140 227 169 25 27 34 20 26 150 29 198 45 207 13 201 183 48 177 117 83 110 203 219 75 79 88 83 200 101 10 111 13 34 238 198 94 152 237 6 181 53 196 233 118 94 98 99 30 27 145 137 196 82 39 61 52 16 248 74 80 147 4 170 19 82 108 209 184 172 76 78 98 211 105 115 129 175 12 89 69 117 28 196 142 96 222 75 112 207 59 140 233 89 98 117 175 92 146 129 47 206 248 110 160 31 124 201 133 110 173 27 126 56 107 173 31 124 70 179 27 75 11 239 93 11 54 206 30 120 179 82 150 216 183 50 148 158 240 34 40 147 202 168 7 188 42 69 63 248 95 201 127 252 95 197 163 109 182 168 63 60 174 88 250 242 126 160 114 190 114 35 149 51 184 43 254 200 193 174 207 26 38 205 105 245 142 31 247 128 18 248 105 208 130 67 253 252 124 106 202 124 121 191 140 90 176 223 102 239 120 205 103 227 46 150 217 190 172 133 149 126 188 79 251 32 41 175 136 204 62 207 92 15 102 36 84 154 68 208 38 62 57 231 171 68 33 87 247 198 121 105 80 188 12 173 157 218 68 77 108 217 9 139 38 68 158 152 149 138 130 235 234 168 166 161 160 184 137 117 199 218 159 145 155 234 154 38 93 145 185 107 205 176 21 247 41 59 108 190 215 54 10 223 11 45 133 37 116 58 108 190 173 191 117 180 124 93 108 148 57 72 144 73 53 164 229 194 57 178 29 189 231 240 27 233 224 188 241 114 182 246 7 0 0 0 37 116 69 88 116 100 97 116 101 58 99 114 101 97 116 101 0 50 48 49 53 45 48 50 45 49 53 84 50 49 58 53 54 58 51 50 43 48 48 58 48 48 225 26 111 76 0 0 0 37 116 69 88 116 100 97 116 101 58 109 111 100 105 102 121 0 50 48 49 53 45 48 50 45 49 53 84 50 49 58 53 54 58 51 50 43 48 48 58 48 48 144 71 215 240 0 0 0 40 116 69 88 116 115 118 103 58 98 97 115 101 45 117 114 105 0 102 105 108 101 58 47 47 47 116 109 112 47 109 97 103 105 99 107 45 122 118 97 100 97 79 57 86 64 183 65 84 0 0 0 0 73 69 78 68 174 66 96 130]
]

{ #category : #icons }
TLRoassal3Connector class >> telescopeWidthPng [
	^ #[137 80 78 71 13 10 26 10 0 0 0 13 73 72 68 82 0 0 0 36 0 0 0 31 8 4 0 0 0 37 180 167 125 0 0 0 2 98 75 71 68 0 0 170 141 35 50 0 0 0 9 112 72 89 115 0 0 0 72 0 0 0 72 0 70 201 107 62 0 0 1 159 73 68 65 84 72 199 237 212 189 106 20 113 20 5 240 223 124 108 34 152 47 33 22 169 211 236 11 216 236 130 141 15 145 202 206 50 144 34 144 128 15 224 115 40 230 5 2 105 82 8 70 178 105 36 34 41 130 77 154 52 18 80 108 44 22 39 51 215 98 103 55 46 33 174 187 153 210 115 153 153 63 12 247 112 239 57 247 254 19 161 17 228 245 183 186 7 71 10 73 147 21 85 82 47 125 176 48 117 93 169 159 158 122 165 146 14 91 251 164 39 83 78 73 148 41 45 140 107 148 34 155 186 159 76 57 80 104 92 236 114 234 138 134 153 117 37 141 224 63 209 100 12 93 203 254 56 79 147 93 14 135 102 152 92 226 122 38 251 203 113 162 46 51 174 72 119 112 76 84 136 123 105 85 73 26 221 254 175 205 16 37 30 54 67 212 24 146 209 59 49 220 228 76 226 186 254 115 27 33 23 181 233 41 98 240 164 142 156 217 16 18 243 222 56 113 106 223 114 157 114 59 96 217 190 83 39 94 155 151 8 27 206 28 81 8 59 88 116 40 132 111 58 152 147 223 17 115 232 248 46 132 67 139 216 17 10 250 194 22 142 133 208 179 58 106 248 111 114 172 234 9 225 24 91 66 63 151 227 177 3 93 133 150 115 47 60 82 76 80 182 229 135 115 29 133 174 3 159 145 15 6 242 151 214 140 211 93 73 20 230 110 38 187 50 219 149 50 202 203 85 82 111 61 209 86 202 188 83 120 48 241 22 200 244 181 60 83 202 124 241 209 115 213 192 181 77 107 174 132 176 39 253 39 177 83 123 66 184 178 102 115 224 90 33 236 162 237 66 8 239 173 32 147 222 17 25 86 28 9 225 66 27 187 55 68 219 96 221 101 61 2 75 119 86 149 96 169 182 254 210 58 216 22 138 223 229 3 149 71 13 230 112 23 0 0 0 37 116 69 88 116 100 97 116 101 58 99 114 101 97 116 101 0 50 48 49 53 45 48 50 45 49 53 84 50 49 58 53 54 58 51 57 43 48 48 58 48 48 227 29 59 182 0 0 0 37 116 69 88 116 100 97 116 101 58 109 111 100 105 102 121 0 50 48 49 53 45 48 50 45 49 53 84 50 49 58 53 54 58 51 57 43 48 48 58 48 48 146 64 131 10 0 0 0 40 116 69 88 116 115 118 103 58 98 97 115 101 45 117 114 105 0 102 105 108 101 58 47 47 47 116 109 112 47 109 97 103 105 99 107 45 76 78 78 107 76 97 101 98 187 2 42 77 0 0 0 0 73 69 78 68 174 66 96 130]
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
	| arr shape |
	arr := view tlDecorators.
	shape := aDecorator shape.
	arr at: shape put: aDecorator.
	
	view add: shape.
	aDecorator label 
		ifNotNil: [ :label | view add: label ].
]

{ #category : #view }
TLRoassal3Connector >> allNodesFromGroup: group in: nodes [

	group do: [ :s | 
		s isNode
			ifTrue: [ 
				| shape |
				shape := view shapeFromModel: s.
				shape ifNotNil: [ nodes at: shape ifAbsentPut: [ shape position ] ] ]
			ifFalse: [ self allNodesFromGroup: s in: nodes ] ]
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
	| color width style borderType |
	color := styleSheet obtainValue: #borderColor inNode: aNode.
	width := styleSheet obtainValue: #borderWidth inNode: aNode.
	style := styleSheet getValue: #borderStyle inNode: aNode.
	style ifNil: [ style := TLSolidLineStyle ].
	borderType := aNode isNode
		ifTrue: [ style borderType ]
		ifFalse: [ RSBorder new ].
	^ borderType
		color: color;
		width: width;
		style: style roassalStyle;
		yourself
]

{ #category : #'initialize-release' }
TLRoassal3Connector >> close [
	"Close the window"
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
		from: from shape;
		to: to shape.
	self applyStyle: style onLine: line connection: aTLConnection.
	line model: aTLConnection.
	self customizeInteractions: aTLConnection with: line.
	^ line
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createElementNodeFromNode: aNode [
	| styleSheet text shape |
	styleSheet := aNode effectiveStyleSheet.
	
	shape := self createShapeFor: aNode style: styleSheet.
	text := self createLabelFor: aNode style: styleSheet shape: shape.
	
	shape 
		model: aNode;
		addInteraction: TLDraggable.
	
	self customizeInteractions: aNode with: shape.
	^ TLShapeDecorator new
		shape: shape;
		label: text;
		yourself
]

{ #category : #'generation - group' }
TLRoassal3Connector >> createGroup: aTLEntitiesGroup with: aCollection [ 
	^ RSGroup withAll: aCollection
]

{ #category : #'generation - node' }
TLRoassal3Connector >> createLabelFor: aNode style: styleSheet shape: aRSShape [
	| text color fontSize nodeLabelPosition lbl wrap wrapSize block builder |
	text := styleSheet getValue: #nodeLabel inNode: aNode.
	(text isNil or: [text = TLNoNodeLabel] ) ifTrue: [ ^ nil ].
	color := styleSheet getValue: #textColor inNode: aNode.
	fontSize := styleSheet getValue: #labelSize inNode: aNode.
	nodeLabelPosition := TLPosition for: (styleSheet getValue: #nodeLabelPosition inNode: aNode).
	wrap := styleSheet getValue: #nodeLabelWrap inNode: aNode.
	wrapSize := styleSheet getValue: #nodeLabelMaxWidth inNode: aNode.
	builder := RSMultilineLabelBuilder new.
	builder labelShape
		text: text;
		color: color;
		fontSize: fontSize.
	builder layout: (RSVerticalLineLayout new alignCenter gapSize: 1).
	builder wrapStrategy: ((RSAbstractWrapStrategy fromTLName: wrap)
		wrapMaxWidth: wrapSize).
	lbl := builder shapeFor: text.
	block := [ | temp rect position |
		rect := aRSShape encompassingRectangle.
			temp := RSBox new
				fromRectangle: (Rectangle 
				floatCenter: rect floatCenter
				extent: rect extent + lbl extent).
			position := nodeLabelPosition computePositionOf: nil relativeTo: temp.
			lbl position: position.
		 ].
	"aRSShape 
		removeInteractionIfPresent: self class;
		when: RSExtentChangedEvent do: block;
		when: RSPositionChangedEvent do: block."
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
	| shape isNil |
	shape := (styleSheet
		obtainValue: #shape
		forEntity: aNode entity
		inNode: aNode) roassalShape.
	isNil := false.
	shape ifNil: [ shape := RSBox new. isNil := true ].
	shape
		extent: (styleSheet obtainValue: #width inNode: aNode) @ 
			(styleSheet obtainValue: #height inNode: aNode);
		position: 0 @ 0;
		border: (isNil 
			ifTrue: [ nil ]
			ifFalse: [self borderFor: aNode style: styleSheet ]);
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
 	| img |
	
	img := Form fromBinaryStream: (aTLLegendEntry rsIconName value: self class) readStream.
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
	^ (aTLNodeBackgroundLegendEntry obtainAssociations
		collect: [ :collection | 
			| drawable |
			drawable := collection anyOne.
			drawable effectiveStyleSheet 
				obtainValue: #backgroundColor 
				forEntity: drawable entity 
				inNode: drawable ])
		associationsDo: [ :assoc |
			self legendBuilder 
				text: assoc key
				withBoxColor: assoc value
			 ]
]

{ #category : #'generation-legendEntry' }
TLRoassal3Connector >> generateNodeBorderColorLegendEntry: aTLNodeBorderColorLegendEntry [ 
	self flag: 'TODO'
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
TLRoassal3Connector >> generateTLBorderColorLegendEntry: aTLBorderColorLegendEntry [ 
	self flag: 'TODO'
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
			legendDo: [ :s | 
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
	| window inspector lb controller |
	view := RSCanvas new.
	view inspectorContext: RSEmptyContext new.
	controller := RSCanvasController new noLegend.
	view
		@ controller;
		@ TLDragPointCanvas.
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
	aRSLine remove.
	(aRSLine propertyAt: #label) ifNotNil: [ :label | label remove ].
]

{ #category : #'drawing - removing' }
TLRoassal3Connector >> removeElementFromView: element associatedToDrawable: aTLDrawable [ 
	element shape remove.
	element label ifNotNil: [ :label | label remove ].
	element children do: [ :child | child shape remove ].
	element children: #().
	element parent ifNotNil: [ :parent | parent remove: element ]
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
	| styleSheet deco shape text |
	deco := shapeByDrawable at: aNode.
	deco ifNil: [ ^ self ].
	shape := deco shape.
	
	styleSheet := aNode effectiveStyleSheet.
	
	shape
		border: (self borderFor: aNode style: styleSheet);
		paint: (self paintFor: aNode style: styleSheet);
		extent: (styleSheet obtainValue: #width inNode: aNode) @ 
			(styleSheet obtainValue: #height inNode: aNode).
	
	deco label ifNotNil: [ :label | label remove ].
	
	text := self createLabelFor: aNode style: styleSheet shape: shape.
	
	text ifNotNil: [ 
		deco label: text.
		view add: text. ].
	
	
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
TLRoassal3Connector >> updatePositionWithAnimation: aTLVisualization [
	| from to iterate oldCameraS oldCameraP newCameraS newCameraP |
	from := lastPositions.
	
	to := Dictionary new.
	from keysDo: [ :k | 
		| p newP deco |
		p := from at: k.
		deco := self shapeByDrawable at: k model.
		"p = (0@0) ifTrue: [ from at: k put: k position ]."
		newP := k position.
		to at: k put: newP ].
	iterate := nil.
	iterate := [ :aNode :t |
		aNode do: [ :child |
			child isNode ifTrue: [ 
				child isComposite 
					ifTrue: [ iterate value: child childrenNodes value: t ].
				self shapeByDrawable at: child ifPresent: [:deco | 
					| oldP newP |	
					oldP := from at: deco shape ifAbsent: [ deco position ].
					newP := oldP interpolateTo: (to at: deco shape ifAbsent: [ deco position ]) at: t.
					deco position: newP.
					].
				
			] ifFalse: [
				iterate value: child value: t.
			].
		] 
	].
	oldCameraS := view camera scale.
	oldCameraP := view camera position.
	view removeKey: #encompassingRectangle.
	view zoomToFit.
	newCameraS := view camera scale.
	newCameraP := view camera position.
	view newAnimation
		duration: 1 seconds;
		onStepDo: [ :t |
			iterate value: aTLVisualization value: t.
			view camera
				position: (oldCameraP interpolateTo: newCameraP at: t);
				scale: (oldCameraS interpolateTo: newCameraS at: t).
			view signalUpdate.
			].
]

{ #category : #view }
TLRoassal3Connector >> updateViewForVisualization: aTLVisualization [
	view signalUpdate.
	firstTimeAnimation ifTrue: [ 
		lastPositions := nil. 
		firstTimeAnimation := false ].
	lastPositions ifNil: [ ^ self ].
	self updatePositionWithAnimation: aTLVisualization.
	lastPositions := nil.
]
