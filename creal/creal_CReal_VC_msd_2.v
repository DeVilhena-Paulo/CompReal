(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require Reals.R_sqrt.
Require Reals.Rtrigo_def.
Require Reals.Rpower.
Require BuiltIn.
Require int.Int.
Require int.Abs.
Require int.EuclideanDivision.
Require int.Power.
Require real.Real.
Require real.RealInfix.
Require real.FromInt.
Require real.Square.
Require real.ExpLog.
Require real.PowerReal.

Parameter truncate: R -> Z.

Axiom Truncate_int : forall (i:Z), ((truncate (BuiltIn.IZR i)) = i).

Axiom Truncate_down_pos :
  forall (x:R), (0%R <= x)%R ->
  ((BuiltIn.IZR (truncate x)) <= x)%R /\
  (x < (BuiltIn.IZR ((truncate x) + 1%Z)%Z))%R.

Axiom Truncate_up_neg :
  forall (x:R), (x <= 0%R)%R ->
  ((BuiltIn.IZR ((truncate x) - 1%Z)%Z) < x)%R /\
  (x <= (BuiltIn.IZR (truncate x)))%R.

Axiom Real_of_truncate :
  forall (x:R),
  ((x - 1%R)%R <= (BuiltIn.IZR (truncate x)))%R /\
  ((BuiltIn.IZR (truncate x)) <= (x + 1%R)%R)%R.

Axiom Truncate_monotonic :
  forall (x:R) (y:R), (x <= y)%R -> ((truncate x) <= (truncate y))%Z.

Axiom Truncate_monotonic_int1 :
  forall (x:R) (i:Z), (x <= (BuiltIn.IZR i))%R -> ((truncate x) <= i)%Z.

Axiom Truncate_monotonic_int2 :
  forall (x:R) (i:Z), ((BuiltIn.IZR i) <= x)%R -> (i <= (truncate x))%Z.

Parameter floor: R -> Z.

Parameter ceil: R -> Z.

Axiom Floor_int : forall (i:Z), ((floor (BuiltIn.IZR i)) = i).

Axiom Ceil_int : forall (i:Z), ((ceil (BuiltIn.IZR i)) = i).

Axiom Floor_down :
  forall (x:R),
  ((BuiltIn.IZR (floor x)) <= x)%R /\
  (x < (BuiltIn.IZR ((floor x) + 1%Z)%Z))%R.

Axiom Ceil_up :
  forall (x:R),
  ((BuiltIn.IZR ((ceil x) - 1%Z)%Z) < x)%R /\ (x <= (BuiltIn.IZR (ceil x)))%R.

Axiom Floor_monotonic :
  forall (x:R) (y:R), (x <= y)%R -> ((floor x) <= (floor y))%Z.

Axiom Ceil_monotonic :
  forall (x:R) (y:R), (x <= y)%R -> ((ceil x) <= (ceil y))%Z.

(* Why3 assumption *)
Definition isqr (a:Z) : Z := (a * a)%Z.

(* Why3 assumption *)
Definition isqrt_condition (n:Z) (a:Z) : Prop :=
  ((isqr a) <= n)%Z /\ (n < (isqr (a + 1%Z)%Z))%Z.

Axiom Isqr_sqr :
  forall (n:Z), ((BuiltIn.IZR (isqr n)) = (Reals.RIneq.Rsqr (BuiltIn.IZR n))).

Axiom floor_sqrt_in_isqrt_condition :
  forall (n:Z), (0%Z <= n)%Z ->
  isqrt_condition n (floor (Reals.R_sqrt.sqrt (BuiltIn.IZR n))).

Axiom isqrt_condition_gt :
  forall (n:Z) (a:Z) (b:Z), ((0%Z <= a)%Z /\ (a < b)%Z) ->
  (isqrt_condition n a) -> (n < (isqr b))%Z.

Axiom isqrt_condition_lt :
  forall (n:Z) (a:Z) (b:Z), ((0%Z <= b)%Z /\ (b < a)%Z) ->
  (isqrt_condition n a) -> ((isqr b) < n)%Z.

Axiom unique_isqrt_condition :
  forall (n:Z) (a:Z) (b:Z), (0%Z <= a)%Z -> (0%Z <= b)%Z ->
  (isqrt_condition n a) -> (isqrt_condition n b) -> (a = b).

Axiom floor_sqrt :
  forall (n:Z) (a:Z), (0%Z <= a)%Z -> (isqrt_condition n a) ->
  (a = (floor (Reals.R_sqrt.sqrt (BuiltIn.IZR n)))).

(* Why3 assumption *)
Definition usB (n:Z) : R := (Reals.Rpower.Rpower 4%R (BuiltIn.IZR n)).

Axiom usB_pos : forall (n:Z), (0%R <= (usB n))%R.

Axiom usB_add :
  forall (n:Z) (m:Z), ((usB (n + m)%Z) = ((usB n) * (usB m))%R).

Axiom usB_add' :
  forall (n:Z) (m:Z), ((usB (n + m)%Z) = ((usB n) * (usB m))%R).

Axiom usB_inv : forall (n:Z), (((usB n) * (usB (-n)%Z))%R = 1%R).

Axiom Sqrt_pow :
  forall (n:Z), ((Reals.R_sqrt.sqrt (usB (2%Z * n)%Z)) = (usB n)).

Axiom usB_sqrt :
  forall (a:R) (n:Z), (0%R <= a)%R ->
  ((Reals.R_sqrt.sqrt (a * (usB (2%Z * n)%Z))%R) =
   ((Reals.R_sqrt.sqrt a) * (usB n))%R).

Axiom usB_eq_power :
  forall (n:Z), (0%Z <= n)%Z ->
  ((usB n) = (BuiltIn.IZR (int.Power.power 4%Z n))).

Axiom usB_eq_power2 :
  forall (n:Z), (0%Z <= n)%Z ->
  ((usB n) = (BuiltIn.IZR (int.Power.power 2%Z (2%Z * n)%Z))).

Axiom usB_eq_inv_power :
  forall (n:Z), (n < 0%Z)%Z ->
  ((usB n) =
   (Reals.Rdefinitions.Rinv (BuiltIn.IZR (int.Power.power 4%Z (-n)%Z)))).

Axiom usB_eq_inv_power2 :
  forall (n:Z), (n < 0%Z)%Z ->
  ((usB n) =
   (Reals.Rdefinitions.Rinv
    (BuiltIn.IZR (int.Power.power 2%Z (2%Z * (-n)%Z)%Z)))).

Axiom Even_power :
  forall (b:Z) (n:Z), (0%Z <= n)%Z ->
  ((int.Power.power b (2%Z * n)%Z) = (int.Power.power (isqr b) n)).

(* Why3 assumption *)
Definition framing (x:R) (p:Z) (n:Z) : Prop :=
  ((((BuiltIn.IZR p) - 1%R)%R * (usB (-n)%Z))%R < x)%R /\
  (x < (((BuiltIn.IZR p) + 1%R)%R * (usB (-n)%Z))%R)%R.

Axiom Isqrt_monotonic_rev :
  forall (a:Z) (b:Z), (0%Z <= a)%Z -> (0%Z <= b)%Z ->
  ((isqr a) <= (isqr b))%Z -> (a <= b)%Z.

(* Why3 assumption *)
Definition dual_isqrt_condition (n:Z) (a:Z) : Prop :=
  ((isqr (a - 1%Z)%Z) < n)%Z /\ (n <= (isqr a))%Z.

Axiom ceil_sqrt_in_dual_isqrt_condition :
  forall (n:Z), (1%Z <= n)%Z ->
  dual_isqrt_condition n (ceil (Reals.R_sqrt.sqrt (BuiltIn.IZR n))).

Axiom ceil_ :
  forall (n:Z), (0%Z <= n)%Z ->
  (((ceil (Reals.R_sqrt.sqrt (BuiltIn.IZR (n + 1%Z)%Z))) - 1%Z)%Z <=
   (floor (Reals.R_sqrt.sqrt (BuiltIn.IZR n))))%Z.

Axiom floor_ :
  forall (n:Z), (1%Z <= n)%Z ->
  ((ceil (Reals.R_sqrt.sqrt (BuiltIn.IZR n))) <=
   ((floor (Reals.R_sqrt.sqrt (BuiltIn.IZR (n - 1%Z)%Z))) + 1%Z)%Z)%Z.

(* Why3 assumption *)
Inductive term :=
  | Cst : Z -> term
  | Neg : term -> term
  | Sqrt : term -> term
  | Sub : term -> term -> term
  | Add : term -> term -> term.
Axiom term_WhyType : WhyType term.
Existing Instance term_WhyType.

(* Why3 assumption *)
Fixpoint interp (t:term) {struct t}: R :=
  match t with
  | Cst a => (BuiltIn.IZR a)
  | Neg t1 => (-(interp t1))%R
  | Sqrt t1 => (Reals.R_sqrt.sqrt (interp t1))
  | Sub t1 u => ((interp t1) - (interp u))%R
  | Add t1 u => ((interp t1) + (interp u))%R
  end.

Parameter wf_term: term -> bool.

Axiom wf_term_def :
  forall (t:term),
  (match t with
   | Cst _ => True
   | Neg t1 => ((wf_term t1) = true)
   | Sqrt t1 => ((wf_term t1) = true) /\ (0%R <= (interp t1))%R
   | Sub t1 u => ((wf_term t1) = true) /\ ((wf_term u) = true)
   | Add t1 u => ((wf_term t1) = true) /\ ((wf_term u) = true)
   end -> ((wf_term t) = true)) /\
  (~ match t with
     | Cst _ => True
     | Neg t1 => ((wf_term t1) = true)
     | Sqrt t1 => ((wf_term t1) = true) /\ (0%R <= (interp t1))%R
     | Sub t1 u => ((wf_term t1) = true) /\ ((wf_term u) = true)
     | Add t1 u => ((wf_term t1) = true) /\ ((wf_term u) = true)
     end ->
   ((wf_term t) = false)).

Axiom Inv_monotonic :
  forall (a:R) (b:R), ((0%R < a)%R /\ (a < b)%R) ->
  (0%R < (Reals.Rdefinitions.Rinv b))%R /\
  ((Reals.Rdefinitions.Rinv b) < (Reals.Rdefinitions.Rinv a))%R.

Axiom usB_inv' :
  forall (n:Z), ((Reals.Rdefinitions.Rinv (usB n)) = (usB (-n)%Z)).

Axiom Inv_mult :
  forall (a:R) (b:R), ~ (a = 0%R) -> ~ (b = 0%R) ->
  ((Reals.Rdefinitions.Rinv (a * b)%R) =
   ((Reals.Rdefinitions.Rinv a) * (Reals.Rdefinitions.Rinv b))%R).

Axiom usB_inv_mult :
  forall (a:R) (n:Z), ~ (a = 0%R) ->
  ((Reals.Rdefinitions.Rinv (a * (usB n))%R) =
   ((Reals.Rdefinitions.Rinv a) * (usB (-n)%Z))%R).

Axiom euclide_uniq :
  forall (a:Z) (b:Z) (q:Z) (r:Z), (a = ((q * b)%Z + r)%Z) ->
  ((0%Z <= r)%Z /\ (r < b)%Z) ->
  (q = (int.EuclideanDivision.div a b)) /\
  (r = (int.EuclideanDivision.mod1 a b)).

Axiom euclide_succ :
  forall (a:Z) (b:Z), (0%Z < a)%Z -> (0%Z < b)%Z ->
  ((int.EuclideanDivision.div a b) < b)%Z ->
  (((int.EuclideanDivision.mod1 a b) < (int.EuclideanDivision.div a b))%Z ->
   ((int.EuclideanDivision.div a (b + 1%Z)%Z) =
    ((int.EuclideanDivision.div a b) - 1%Z)%Z)) /\
  (((int.EuclideanDivision.div a b) <= (int.EuclideanDivision.mod1 a b))%Z ->
   ((int.EuclideanDivision.div a (b + 1%Z)%Z) =
    (int.EuclideanDivision.div a b))).

Axiom euclide_pred :
  forall (a:Z) (b:Z), (0%Z < a)%Z -> (1%Z < b)%Z ->
  ((int.EuclideanDivision.div a b) < (b - 1%Z)%Z)%Z ->
  ((((b - 1%Z)%Z - (int.EuclideanDivision.div a b))%Z <=
    (int.EuclideanDivision.mod1 a b))%Z ->
   ((int.EuclideanDivision.div a (b - 1%Z)%Z) =
    ((int.EuclideanDivision.div a b) + 1%Z)%Z)) /\
  (((int.EuclideanDivision.mod1 a b) <
    ((b - 1%Z)%Z - (int.EuclideanDivision.div a b))%Z)%Z ->
   ((int.EuclideanDivision.div a (b - 1%Z)%Z) =
    (int.EuclideanDivision.div a b))).

Axiom framing_convertion_rule :
  forall (n:Z) (m:Z) (x:R) (p:Z), (0%Z <= m)%Z -> (framing x p n) ->
  framing (x * (usB m))%R p (n - m)%Z.

(* Why3 assumption *)
Inductive term' :=
  | Cst' : Z -> term'
  | Neg' : term' -> term'
  | Sqrt' : term' -> term'
  | Inv' : term' -> term'
  | Sub' : term' -> term' -> term'
  | Add' : term' -> term' -> term'.
Axiom term'_WhyType : WhyType term'.
Existing Instance term'_WhyType.

(* Why3 assumption *)
Fixpoint interp' (t:term') {struct t}: R :=
  match t with
  | Cst' a => (BuiltIn.IZR a)
  | Neg' t1 => (-(interp' t1))%R
  | Sqrt' t1 => (Reals.R_sqrt.sqrt (interp' t1))
  | Inv' t1 => (Reals.Rdefinitions.Rinv (interp' t1))
  | Sub' t1 u => ((interp' t1) - (interp' u))%R
  | Add' t1 u => ((interp' t1) + (interp' u))%R
  end.

Parameter wf_term': term' -> bool.

Axiom wf_term'_def :
  forall (t:term'),
  (match t with
   | Cst' _ => True
   | Neg' t1 => ((wf_term' t1) = true)
   | Sqrt' t1 => ((wf_term' t1) = true) /\ (0%R <= (interp' t1))%R
   | Inv' t1 => ((wf_term' t1) = true) /\ ~ ((interp' t1) = 0%R)
   | Sub' t1 u => ((wf_term' t1) = true) /\ ((wf_term' u) = true)
   | Add' t1 u => ((wf_term' t1) = true) /\ ((wf_term' u) = true)
   end -> ((wf_term' t) = true)) /\
  (~ match t with
     | Cst' _ => True
     | Neg' t1 => ((wf_term' t1) = true)
     | Sqrt' t1 => ((wf_term' t1) = true) /\ (0%R <= (interp' t1))%R
     | Inv' t1 => ((wf_term' t1) = true) /\ ~ ((interp' t1) = 0%R)
     | Sub' t1 u => ((wf_term' t1) = true) /\ ((wf_term' u) = true)
     | Add' t1 u => ((wf_term' t1) = true) /\ ((wf_term' u) = true)
     end ->
   ((wf_term' t) = false)).

Parameter t: term'.

Parameter n: Z.

Parameter p: Z.

Axiom H : (0%Z <= n)%Z.

Axiom H1 : ((wf_term' t) = true).

Axiom H2 : ~ ((interp' t) = 0%R).

Axiom H3 : framing (interp' t) p n.

Parameter o: bool.

Axiom H4 :
  ((p = (-1%Z)%Z) -> (o = true)) /\
  (~ (p = (-1%Z)%Z) ->
   ((p = 0%Z) -> (o = true)) /\
   (~ (p = 0%Z) -> ((p = 1%Z) -> (o = true)) /\ (~ (p = 1%Z) -> (o = false)))).

Axiom H5 : ~ (o = true).

Axiom H6 : ~ (1%Z < p)%Z.

Axiom H7 : ((BuiltIn.IZR p) <= (-2%R)%R)%R.

Axiom H8 : ((interp' t) < (-(usB (-n)%Z))%R)%R.

(* Why3 goal *)
Theorem VC_msd : (0%Z <= n)%Z.
Proof.


Qed.

