
module Data.Semigroup.Deriving where

open import Common

open import Data.Semigroup.Classes
open import Data.Monoid.Classes

-- instance
--   raw-semigroup←semigroup : {{Semigroup A}} → RawSemigroup A
--   raw-semigroup←semigroup .add = add′

-- {-# INCOHERENT raw-semigroup←semigroup #-}

-- instance
--   raw-semigroup←raw-monoid : {{RawMonoid A}} → RawSemigroup A
--   raw-semigroup←raw-monoid .add = add″

-- {-# INCOHERENT raw-semigroup←raw-monoid #-}

-- instance
--   semigroup←monoid : {{Monoid A}} → Semigroup A
--   semigroup←monoid .add′      = add‴
--   semigroup←monoid .add-assoc = add‴-assoc

-- {-# INCOHERENT semigroup←monoid #-}
