
module Data.Semigroup.Classes where

open import Common

record RawSemigroup (A : Set) : Set where
  field
    add : A → A → A
open RawSemigroup {{...}} public

_+_ : {{RawSemigroup A}} → A → A → A
_+_ = add
infixr 5 _+_

{-# DISPLAY RawSemigroup.add _ a b = a + b #-}

-- record Semigroup (A : Set) : Set where
--   field
--     {{raw-semigroup}} : RawSemigroup A

--   field
--     add-assoc : (a : A) {b c : A} → ((a + b) + c) ≡ (a + (b + c))
-- open Semigroup {{...}} public
