"
TODO
"
Class {
	#name : #TLPackageButterfly,
	#superclass : #TLButterfly,
	#category : #'Telescope-Roassal3-Examples'
}

{ #category : #building }
TLPackageButterfly >> backgroundColor [

	^ Color white
]

{ #category : #building }
TLPackageButterfly >> buildVisualization [

	| leftEntitiesValues rightEntitiesValues leftGroup rightGroup |
	self styleSheet nodeLabel: #selector.
	self styleSheet compositeExpandedByDefault: true.
	leftEntitiesValues := (self
		                       obtain: self leftEntities
		                       on: self mainEntity) asOrderedCollection.
	rightEntitiesValues := (self
		                        obtain: self rightEntities
		                        on: self mainEntity) asOrderedCollection.
	leftGroup := leftEntitiesValues groupedBy: #methodClass.
	rightGroup := leftEntitiesValues groupedBy: #methodClass.
	(self > #left) nodeCreationStrategy childrenProperty: [ :assoc | 
		assoc value ].

	(self > #right) nodeCreationStrategy childrenProperty: [ :assoc | 
		assoc value ].

	self styleSheet
		nodeLabelPosition: #top;
		backgroundColor: self backgroundColor.

	self > #central addNodeFromEntity: self mainEntity.
	self > #left addNodesFromEntities: leftGroup.
	self > #right addNodesFromEntities: rightGroup.

	self styleSheet nodeLabelPosition: #top.

	(self > #left) allChildrenNodes connectTo: self > #central.
	self > #central connectTo: (self > #right) allChildrenNodes
]
