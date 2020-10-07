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
	spec
		for: #common
		do: [
			"our dependencies"
			"https://github.com/TelescopeSt/TelescopeRoassal3/"
			spec baseline: 'Roassal3' with: [ 
				spec repository: 'github://ObjectProfile/Roassal3' ].
			spec baseline: 'Telescope' with: [ 
				spec repository: 'github://TelescopeSt/Telescope:v2.x.x/src' ].
			
			"The packages to use, but not load"
			spec
				package: #'Telescope-Roassal3' with: [ spec requires: #('Roassal3' 'Telescope') ];
				package: #'Telescope-Roassal3-Tests'.

			"packages to load"
			
			spec 
				group: 'default' with: #(
					'Telescope-Roassal3'
					'Telescope-Roassal3-Tests') ].

		
	







]
