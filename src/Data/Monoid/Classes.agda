
module Data.Monoid.Classes where

open import Common

open import Data.Semigroup.Classes

record RawMonoid (A : Set) : Set where
  field
    {{raw-semigroup}} : RawSemigroup A

  field
    empty : A
open RawMonoid {{...}} public

-- record Monoid (A : Set) : Set where
--   field
--     {{raw-monoid}} : RawMonoid A
--     {{semigroup}}  : Semigroup A

--   field
--     left-identity  : (a : A) → semigroup .raw-semigroup .add empty a ≡ a
--     right-identity : (a : A) → semigroup .raw-semigroup .add a empty ≡ a
-- open Monoid {{...}} public
