module Control.Traversable.Class where

open import Common

open import Control.Applicative.Class

record Traversable (F : Set → Set) : Set where
  field
    traverse : {{Applicative M}} → (A → M B) → F A → M (F B)
open Traversable {{...}} public
