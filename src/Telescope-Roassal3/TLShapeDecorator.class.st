"
TODO
"
Class {
	#name : #TLShapeDecorator,
	#superclass : #Object,
	#instVars : [
		'shape'
	],
	#category : #'Telescope-Roassal3-Connector'
}

{ #category : #accessing }
TLShapeDecorator >> children [
	^ #()
]

{ #category : #accessing }
TLShapeDecorator >> dimension [
	^ shape extent
]

{ #category : #accessing }
TLShapeDecorator >> doesNotUnderstand: aMessage [
	^ aMessage sendTo: shape
]

{ #category : #accessing }
TLShapeDecorator >> occupyMaxSpace [
	^ false
]

{ #category : #accessing }
TLShapeDecorator >> renderOn: aCanvas [
	shape renderOn: aCanvas 
]

{ #category : #accessing }
TLShapeDecorator >> shape [
	^ shape
]

{ #category : #accessing }
TLShapeDecorator >> shape: aRSShape [
	shape := aRSShape
]
