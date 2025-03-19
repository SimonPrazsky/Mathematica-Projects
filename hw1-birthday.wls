#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
birthday={2,0,0,1,0,3}
listHaystack=First[RealDigits[\[Pi],10,300000]];
position=SequencePosition[listHaystack,birthday,1][[1]][[1]];
Print["My birthday is found at position ", position, "."]



