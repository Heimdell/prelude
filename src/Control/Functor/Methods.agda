
module Control.Functor.Methods where

open import Common

open import Control.Functor.Class

void : {{Functor F}} → F A → F ⊤
void fa = _ <$ fa
