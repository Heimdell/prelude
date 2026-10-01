module Control.Choice.Instances where

open import Common
open import Control.Choice.Class

instance
  sum-is-choice : Choice (_⊎ E)
  sum-is-choice .choice = ⊎-elim (λ a _ → inj₁ a) constᵣ
