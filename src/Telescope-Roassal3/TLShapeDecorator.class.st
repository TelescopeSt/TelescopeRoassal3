"
TODO
"
Class {
	#name : #TLShapeDecorator,
	#superclass : #Object,
	#instVars : [
		'shape',
		'userFixedPosition',
		'position',
		'children',
		'dimension',
		'parent',
		'encompassingRectangle',
		'label'
	],
	#category : #'Telescope-Roassal3-Utils'
}

{ #category : #accessing }
TLShapeDecorator >> adjustToChildren [
	| rect |
	rect := self children encompassingRectangle.
	
	shape position: (position := rect floatCenter).
	
	self extent: self dimension.
	self parent ifNotNil: #adjustToChildren.
]

{ #category : #accessing }
TLShapeDecorator >> children [
	^ children ifNil: [ #() ]
]

{ #category : #accessing }
TLShapeDecorator >> children: aCollection [
	children := aCollection
]

{ #category : #geometry }
TLShapeDecorator >> clearBB [
	encompassingRectangle := nil.
]

{ #category : #accessing }
TLShapeDecorator >> defineFixedRelativePosition: aPoint [ 
	userFixedPosition := false.
	shape propertyAt: #decorator put: self.
	self position: aPoint.
	userFixedPosition :=  true.
]

{ #category : #dimension }
TLShapeDecorator >> dimension [
	^ self hasChildren
		ifTrue: [ self children extent + 20 ]
		ifFalse: [ dimension ifNil: [ dimension := shape extent ] ]
	
]

{ #category : #dimension }
TLShapeDecorator >> dimension: aPoint [
	dimension := aPoint.
	self clearBB.
]

{ #category : #accessing }
TLShapeDecorator >> encompassingRectangle [
	^ encompassingRectangle ifNil: [
		| rects rect |
		rects := OrderedCollection new: 2.
		rect := Rectangle floatCenter: self position extent: self dimension.
		rects add: rect.
		label ifNotNil: [
			rects add: label encompassingRectangle ].
		encompassingRectangle := Rectangle merging: rects.
		
		encompassingRectangle
	].
	
]

{ #category : #geometry }
TLShapeDecorator >> extent: aPoint [
	| node |
	self dimension: aPoint.
	
	shape extent: aPoint.
	
	label ifNil: [ ^ self ].

	label remove.
	node := shape model.
	label := node generator 
		createLabelFor: node 
		style: node effectiveStyleSheet 
		shape: shape.
	shape canvas ifNotNil: [ :canvas | canvas add: label ].
]

{ #category : #accessing }
TLShapeDecorator >> hasChildren [
	^ self children isNotEmpty
]

{ #category : #accessing }
TLShapeDecorator >> incomingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape incomingEdges
		collect: [ :ed |
			decorators at: ed from ].
]

{ #category : #initialization }
TLShapeDecorator >> initialize [
	super initialize.
	userFixedPosition := false.
]

{ #category : #testing }
TLShapeDecorator >> isNode [
	^ shape isNode
]

{ #category : #accessing }
TLShapeDecorator >> label [
	^ label
]

{ #category : #accessing }
TLShapeDecorator >> label: aRSLabel [
	label := aRSLabel.
	self clearBB.
]

{ #category : #dimension }
TLShapeDecorator >> occupyMaxSpace [
	^ false
]

{ #category : #accessing }
TLShapeDecorator >> outgoingAdjacentNodes [
	| decorators |
	decorators := shape canvas tlDecorators.
	
	^ shape outgoingEdges
		collect: [ :ed |
			decorators at: ed to ].
]

{ #category : #accessing }
TLShapeDecorator >> parent [
	^ parent
]

{ #category : #accessing }
TLShapeDecorator >> parent: aTLShapeDecorator [
	parent := aTLShapeDecorator
]

{ #category : #accessing }
TLShapeDecorator >> position [
	^ position
]

{ #category : #accessing }
TLShapeDecorator >> position: aPoint [
	| rect gap |
	self clearBB.
	self userFixedPosition ifTrue: [ ^ self ].
	position := aPoint.
	shape translateTo: aPoint.
	self extent: self dimension.
	self hasChildren ifFalse: [ ^ self ].
	rect := self children encompassingRectangle.
	gap := 20.
	self children do: [ :child | 
		child position: child position + aPoint - rect floatCenter].
	
	
]

{ #category : #removing }
TLShapeDecorator >> remove: aTLShapeDecorator [
	
	self children
		remove: aTLShapeDecorator.
	dimension := nil.
	self clearBB.
]

{ #category : #accessing }
TLShapeDecorator >> shape [
	^ shape
]

{ #category : #accessing }
TLShapeDecorator >> shape: aRSShape [
	shape := aRSShape.
	"shape when: RSPositionChangedEvent send: #adjustPosition: to: self."
]

{ #category : #accessing }
TLShapeDecorator >> translateBy: delta [
	
	self position: self position + delta
]

{ #category : #accessing }
TLShapeDecorator >> userFixedPosition [
	^ userFixedPosition
]
