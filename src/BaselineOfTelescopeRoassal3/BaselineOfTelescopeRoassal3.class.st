"
Baseline for telescope
"
Class {
	#name : #BaselineOfTelescopeRoassal3,
	#superclass : #BaselineOf,
	#category : #BaselineOfTelescopeRoassal3
}

{ #category : #baselines }
BaselineOfTelescopeRoassal3 >> baseline: spec [

	<baseline>
	self pharo8: spec.
	self pharo9: spec.

	spec for: #common do: [ 
		spec
			baseline: 'Telescope'
			with: [ 
			spec repository: 'github://TelescopeSt/Telescope:v2.x.x/src' ].
		spec package: #'Telescope-Roassal3-Tests'.

		spec
			group: 'default'
			with: #( 'Telescope-Roassal3' 'Telescope-Roassal3-Tests' ) ]
]

{ #category : #baselines }
BaselineOfTelescopeRoassal3 >> pharo8: spec [

	spec for: #'pharo8.x' do: [ 
		spec
			baseline: 'Roassal3'
			with: [ spec repository: 'github://ObjectProfile/Roassal3' ].
		spec
			package: #'Telescope-Roassal3'
			with: [ spec requires: #( 'Roassal3' 'Telescope' ) ] ]
]

{ #category : #baselines }
BaselineOfTelescopeRoassal3 >> pharo9: spec [

	spec for: #'pharo9.x' do: [ 
		spec
			package: #'Telescope-Roassal3'
			with: [ spec requires: #( 'Telescope' ) ] ]
]
