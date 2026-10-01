
module Data.Monoid.Methods where

open import Common

open import Data.Semigroup.Classes
open import Data.Monoid.Classes

intercalate : {{RawMonoid A}} → A → List A → A
intercalate sep = λ where
  [] → empty
  (x ∷ []) → x
  (x ∷ xs) → x + sep + intercalate sep xs

times : {{RawMonoid A}} → A → ℕ → A
times a = λ where
  zero    → empty
  (suc n) → a + times a n
