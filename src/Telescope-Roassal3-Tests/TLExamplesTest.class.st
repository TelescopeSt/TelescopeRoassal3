Class {
	#name : #TLExamplesTest,
	#superclass : #TestCase,
	#category : #'Telescope-Roassal3-Tests'
}

{ #category : #tests }
TLExamplesTest >> testAllExamples [
	| no examplesToTest redExamples |
	no := 
		#(exampleCompositeNodeWithLabelInsideInButterfly exampleTreeExplorerCollectionHierarchy
		exampleTwoConnectedVisualization exampleNameCloud).
	examplesToTest := TLDemos class methods 
		select: [ :met | met selector beginsWith: 'example' ].
	examplesToTest := examplesToTest reject: [ :met | no includes: met selector ].
	redExamples := OrderedCollection new.
	
	examplesToTest do: [ :met |
		[ met selector value: TLDemos ]
			on: Error 
			do: [ :ex | redExamples add: met ]
		 ].
	self assert: redExamples isEmpty.
]
