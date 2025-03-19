#!/usr/bin/env wolframscript
(* ::Package:: *)

f[x,t]:=Exp[-x^2/(2Ct)]/(Sqrt[2\[Pi]]Sqrt[Ct])
Assuming[t>0 && C>0, Integrate[f[x,t],{x,-Infinity,Infinity}]]


sol = DSolve[{D[p[x,t],t]==C/2 D[p[x,t],{x,2}], p[x,0]==DiracDelta[x]}, p[x,t], {x,t}]


ListLinePlot[
	ParallelTable[
		Prepend[Accumulate[RandomChoice[{-1,1},50]],0],
		8],
	AxesLabel->{\[CapitalDelta]t,\[CapitalDelta]x},
	PlotStyle->Black,
	PlotMarkers->{{"\[FilledCircle]",10}, {"\[FilledSquare]",10}, {"\[FilledDiamond]",10}, {"\[FilledUpTriangle]",10}, {"\[FilledDownTriangle]",10}, {"\[EmptyCircle]",10}, {"\[EmptySquare]",10}, {"\[EmptyDiamond]",10}}
]


particles=3000;
time=100;

Walk[N_,t_] := 
	ParallelTable[
		Prepend[
			Accumulate[
				RandomChoice[{-1,1},t]],
			0],
		N]

walks = Walk[particles,time];

ListLinePlot[
	Mean[walks], 
	PlotStyle->Black,
	AxesLabel->{"\[CapitalCHacek]as (n\[AAcute]sobky \[CapitalDelta]t)", "Pr\[URing]m\[EHacek]rn\[AAcute] poloha (n\[AAcute]sobky \[CapitalDelta]x)"},
	PlotMarkers->{"\[FilledCircle]",6}]

ListLinePlot[
	Variance[walks], 
	PlotStyle->Black,
	AxesLabel->{"\[CapitalCHacek]as (n\[AAcute]sobky \[CapitalDelta]t)", "Variance polohy (n\[AAcute]sobky \[CapitalDelta]x)^2"},
	PlotMarkers->{"\[FilledCircle]",6}]


Show[
  Histogram[Last[Transpose[walks]], Automatic, "PDF", 
    ChartStyle -> Directive[EdgeForm[Black], White]], 
  Plot[Evaluate[p[x,t] /. sol /. C->1 /. t->time], 
    {x, Min[Last[Transpose[walks]]], Max[Last[Transpose[walks]]]}, 
    PlotStyle -> {Thick, Black}],
   AxesLabel->{"Poloha (n\[AAcute]sobky \[CapitalDelta]x)", "Po\[CHacek]et \[CHacek]\[AAcute]stic (pod\[IAcute]l)"}
]
