
module Control.Functor.Class where

open import Common

record Functor (F : Set → Set) : Set₁ where
  field
    map : (A → B) → F A → F B
open Functor {{...}} public

_<$>_ : {{Functor F}} → (A → B) → F A → F B
_<$>_ = map

_<&>_ : {{Functor F}} → F A → (A → B) → F B
_<&>_ = flip map

_<$_ : {{Functor F}} → A → F B → F A
_<$_ = map ∘ const

_&>_ : {{Functor F}} → F A → B → F B
_&>_ = flip (map ∘ const)

infixl 4 _<$>_ _<$_
infixr 4 _<&>_ _&>_
