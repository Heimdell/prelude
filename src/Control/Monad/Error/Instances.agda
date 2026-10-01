
module Control.Monad.Error.Instances where

open import Common
open import Control.Monad
open import Control.Monad.Error.Carrier

open import Control.Monad.Transformer.Class
open import Control.Applicative

instance
  error-is-transformer : Transformer (ErrorT E)
  error-is-transformer .lift ma .run-error = ⦇ inj₁ ma ⦈

  error-is-monad : {{Monad M}} → Monad (ErrorT E M)
  error-is-monad .return = lift ∘ pure
  error-is-monad .bind ma amb .run-error = do
    ma .run-error >>= λ where
      (inj₁ a) → amb a .run-error
      (inj₂ e) → pure (inj₂ e)

open import Control.Alternative
open import Control.Choice

instance
  error-is-alternative : {{Alternative M}} → {{Monad M}} → Alternative (ErrorT E M)
  error-is-alternative .choose ma mb .run-error = ma .run-error <|> mb .run-error
  error-is-alternative .loose                   = lift loose

open import Control.Monad.Catch.Class

instance
  catch-error : Catch (ErrorT E)
  catch-error .lift-catch catch ma k .run-error = do
    catch (ma .run-error) λ where
      e → k e .run-error
