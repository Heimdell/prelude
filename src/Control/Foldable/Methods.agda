module Control.Foldable.Methods where

open import Common

open import Control.Foldable.Class

fold-l : {{Foldable F}} → (B → A → B) → B → F A → B
fold-l f z xs = fold-r (λ a b→b b → f (b→b b) a) id xs z

open import Data.Monoid
open import Data.Semigroup

fold-map : {{RawMonoid C}} → {{Foldable F}} → (A → C) → F A → C
fold-map f = fold-r (_+_ ∘ f) empty

length : {{Foldable F}} → F A → ℕ
length = fold-map (const 1)

any : {{Foldable F}} → (A → Bool) → F A → Bool
any f = fold-r (_∨_ ∘ f) true
