#!/usr/bin/env wolframscript
(* ::Package:: *)

(* ::Input:: *)
(**)


euler[f_,h_,N_,t0_,x0_]:=Nest[({#[[1]]+h, #[[2]]+h*f[#[[1]],#[[2]]]}) &, {t0,x0}, N]
euler[y, h, 3, t0, x0][[2]] // FullSimplify
euler[y, 1/3, 3, 0, 1] // FullSimplify

f = Function[{t, x}, x];
euler[f,1/1000,1000,0,1][[2]] // N



