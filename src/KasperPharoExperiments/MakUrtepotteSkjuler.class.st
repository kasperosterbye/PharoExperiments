"
Jeg genererer svg for en urtepotteskjuler
"
Class {
	#name : 'MakUrtepotteSkjuler',
	#superclass : 'MakSVGGenerator',
	#category : 'KasperPharoExperiments',
	#package : 'KasperPharoExperiments'
}

{ #category : 'accessing' }
MakUrtepotteSkjuler >> height [
	^ 10
]

{ #category : 'accessing' }
MakUrtepotteSkjuler >> lowCut [
	^ 1
]

{ #category : 'accessing' }
MakUrtepotteSkjuler >> segment: angle1 to: angle2 [
	"Assumes svg placed correctly from start, so I can use relative coordinates"
	| b c d |
	b := (angle1 cos  @ angle1 sin) * self height.
	d := ((Float pi - angle2) sin @ (Float pi - angle2) cos) * self lowCut.
	c := d + ((angle2 cos @ angle2 sin) * self height).
	
]
