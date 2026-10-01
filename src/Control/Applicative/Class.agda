
module Control.Applicative.Class where

open import Common
open import Control.Functor.Class

record Applicative (F : Set → Set) : Set₁ where
  field
    pure : A → F A
    ap   : F (A → B) → F A → F B
open Applicative {{...}} public

_<*>_ : {{Applicative F}} → F (A → B) → F A → F B
_<*>_ = ap

infixl 4 _<*>_
