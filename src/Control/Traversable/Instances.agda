module Control.Traversable.Instances where

open import Common

open import Control.Functor
open import Control.Applicative

open import Control.Traversable.Class

module _ where

  pair-is-traversable : Traversable (A ×_)
  pair-is-traversable .traverse f (a , b) = ⦇ ⦇ a ⦈ , f b ⦈

module _ where

  instance
    maybe-is-traversable : Traversable Maybe
    maybe-is-traversable .traverse f = λ where
      (just a) → ⦇ just (f a) ⦈
      nothing  → ⦇ nothing    ⦈

module _ where

  instance
    list-is-traversable : Traversable List
    list-is-traversable .traverse f = λ where
      []       → ⦇ [] ⦈
      (x ∷ xs) → ⦇ f x ∷ traverse f xs ⦈

module _ where

  instance
    vec-is-traversable : ∀{n} → Traversable λ A → Vec A n
    vec-is-traversable .traverse f = λ where
      []       → ⦇ [] ⦈
      (x ∷ xs) → ⦇ f x ∷ traverse f xs ⦈
