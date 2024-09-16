"
Jeg er en klasse der skriver svg filer til working directory.

[SVG Tutorial](https://www.w3schools.com/graphics/svg_path.asp)
"
Class {
	#name : #MakSVGGenerator,
	#superclass : #Object,
	#instVars : [
		'svgOut'
	],
	#category : #KasperPharoExperiments
}

{ #category : #accessing }
MakSVGGenerator >> svgWidth: width height: height make: aBlock [
	| ref |
	ref := 'output.svg' asFileReference.
	ref deleteIfAbsent: [ nil ].
	svgOut := ref writeStream. 
	svgOut nextPutAll: (self template format: { width asInteger. height asInteger . aBlock value }).
	svgOut close.
]

{ #category : #accessing }
MakSVGGenerator >> template [
	^'<svg width="{1}cm" height="{2}cm" xmlns="http://www.w3.org/2000/svg">
    <g transform="scale(35.43307)">{3}</g>
</svg>'
]
