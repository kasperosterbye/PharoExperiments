"
My primary purpose is to show characters or letters in short numbers to train reading them
"
Class {
	#name : 'AlfabetTest',
	#superclass : 'Object',
	#instVars : [
		'alfabeter'
	],
	#category : 'KasperPharoExperiments',
	#package : 'KasperPharoExperiments'
}

{ #category : 'as yet unclassified' }
AlfabetTest >> blandeOrd [
	^ #(Skade
Allike
Krage
'Rød Glente'
Solsort
Due
Musvåge
Spurv
Måge
Ravn
Eg
Bøg
Birk
Lærk
Ask
Ahorn
Gran
Fyrretræ
Tuja
Taks
Foodprocessor
Rivejern
Opvaskemaskine
Køleskab
Ovn
Bestik
Skål
Bageplade
Gryde
Komfur
Stegepande
Have
Mark
Hegn
Tråd
)
]

{ #category : 'as yet unclassified' }
AlfabetTest >> bogstaver [
	^ #(
af
fordi
alle
fra
alt
fri
andre
få
at
gik
blev
glad
bliver
godt
bort
ham
da
han
dag
hans
de
har
dem
havde
den
have
der
hele
deres
hen
det
hende
dig
her
dog
hjem
du
hun
efter
hvad
eller
hver
en
hvis
end
hvor
er
igen
et
ikke
far
ind
fik
jeg
fin
jer
for
jo
forbi
kan
kom
os
kommer
over
kun
på
kunne
sagde
lang
se
lidt
selv
lige
sidste
lille
sig
løb
sin
man
sine
mange
skal
med
skulle
meget
små
men
som
mere
stor
mig
store
min
så
mod
tid
mon
til
må
tog
ned
ud
nej
under
noget
var
nok
ved
nu
vi
når
vil
og
ville
også
være
om
været
op
år
)
]

{ #category : 'as yet unclassified' }
AlfabetTest >> bytAlfabet [
	| nyeAlfabeter antal bogstavNr |
	nyeAlfabeter := '# '.
	[antal := alfabeter size. antal > 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeAlfabeter := nyeAlfabeter copyWith: (alfabeter at: bogstavNr).
			nyeAlfabeter := nyeAlfabeter , '  '.
			antal = 15 ifTrue: [ 
				nyeAlfabeter := nyeAlfabeter , '
# ' ].
			alfabeter := alfabeter copyWithoutIndex: bogstavNr].
	^ Microdown asRichText: nyeAlfabeter  
]

{ #category : 'initialization' }
AlfabetTest >> initialize [ 
	alfabeter := 'bdfghjklmnoprstuvyæøå'.
	"alfabeter := 'abcdefghijklmnopqrstuvxyzæøå'."
	"alfabeter := 'ABCDEFGHIJKLMNOPQRSTUVXYZÆØÅ'."
]

{ #category : 'as yet unclassified' }
AlfabetTest >> træerstaver [
	^ #(Ask
Asp
Avnbøg
Benved
Birk
Bøg
Eg
El
Elm
Ene
Fyr
Gedeblad
Hassel
Havtorn
Hyld
Hæg
Kirsebær
Kornel
Kalkved
Lind
Løn
Navr
Pil
Ribs
Rose
Røn
Slåen
Solbær
Tjørn
Tørst
Æble)
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgAlfabet: størelse [
	| nyeAlfabeter antal tæller bogstavNr |
	nyeAlfabeter := '# '.
	tæller := størelse.
	[antal := alfabeter size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeAlfabeter := nyeAlfabeter copyWith: (alfabeter at: bogstavNr).
			nyeAlfabeter := nyeAlfabeter , '  '.
			antal = 50 ifTrue: [ 
				nyeAlfabeter := nyeAlfabeter , '
# ' ].
			alfabeter := alfabeter copyWithoutIndex: bogstavNr].
	^ Microdown asRichText: nyeAlfabeter  
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgAntal: antalTæller [
	| bogstaver nyeBogstaver antal tæller bogstavNr overskrift|
	bogstaver := BogstavTest new findUnikeBogstaver.
	nyeBogstaver := #().
	tæller := antalTæller.
	[antal := bogstaver size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeBogstaver := nyeBogstaver copyWith: (bogstaver at: bogstavNr).
			bogstaver := bogstaver copyWithoutIndex: bogstavNr].
	overskrift := nyeBogstaver collect: [ :b | '# ', b ].
	overskrift := overskrift inject: '' into: [ :all :element | all , String cr, element ].
	^ Microdown asRichText: overskrift.
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgAntalLinjer: antalTæller [
	| bogstaver nyeBogstaver antal tæller bogstavNr overskrift|
	bogstaver := BogstavTest new findUnikeBogstaver.
	nyeBogstaver := #().
	tæller := antalTæller.
	[antal := bogstaver size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeBogstaver := nyeBogstaver copyWith: (bogstaver at: bogstavNr).
			bogstaver := bogstaver copyWithoutIndex: bogstavNr].
	overskrift := nyeBogstaver.
	overskrift := overskrift inject: '# ' into: [ :all :element | all , String space, element ].
	^ Microdown asRichText: overskrift.
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgBlandedeOrd: størelse [
	| bogstaver nyeBogstaver antal tæller bogstavNr overskrift|
	bogstaver := self blandeOrd.
	nyeBogstaver := #().
	tæller := størelse.
	[antal := bogstaver size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeBogstaver := nyeBogstaver copyWith: (bogstaver at: bogstavNr)..
			bogstaver := bogstaver copyWithoutIndex: bogstavNr].
	overskrift := nyeBogstaver collect: [ :b | '# ', b ].
	overskrift := overskrift inject: '' into: [ :all :element | all , String cr, element ].
	^ Microdown asRichText: overskrift.
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgBogstaver: størelse [
	| bogstaver nyeBogstaver antal tæller bogstavNr overskrift|
	bogstaver := self bogstaver.
	nyeBogstaver := #().
	tæller := størelse.
	[antal := bogstaver size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeBogstaver := nyeBogstaver copyWith: (bogstaver at: bogstavNr)..
			bogstaver := bogstaver copyWithoutIndex: bogstavNr].
	overskrift := nyeBogstaver collect: [ :b | '### ', b ].
	overskrift := overskrift inject: '' into: [ :all :element | all , String cr, element ].
	^ Microdown asRichText: overskrift.
]

{ #category : 'as yet unclassified' }
AlfabetTest >> vælgTræer: størelse [
	| bogstaver nyeBogstaver antal tæller bogstavNr overskrift|
	bogstaver := self træerstaver.
	nyeBogstaver := #().
	tæller := størelse.
	[antal := bogstaver size. tæller := tæller -1. tæller >= 0] 
		whileTrue: [ 
			bogstavNr := ((Random new) next * antal) asInteger + 1.
			nyeBogstaver := nyeBogstaver copyWith: (bogstaver at: bogstavNr)..
			bogstaver := bogstaver copyWithoutIndex: bogstavNr].
	overskrift := nyeBogstaver collect: [ :b | '# ', b ].
	overskrift := overskrift inject: '' into: [ :all :element | all , String cr, element ].
	^ Microdown asRichText: overskrift.
]
