
module Control.Monad.Error.Methods where

open import Common
open import Control.Applicative
open import Control.Monad
open import Control.Monad.Error.Carrier
open import Control.Monad.Error.Instances

catch : {{Monad M}} → ErrorT E M A → (E → ErrorT E M A) → ErrorT E M A
catch ma emb .run-error = do
  ma .run-error >>= λ where
    (inj₂ e) → emb e .run-error
    (inj₁ a) → pure (inj₁ a)

throw : {{Monad M}} → E → ErrorT E M A
throw e .run-error = pure (inj₂ e)
