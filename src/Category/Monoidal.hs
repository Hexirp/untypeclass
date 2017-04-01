{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category.Monoidal
  ( Monoidal(Monoidal)
  , extend_semigroupal
  , tensor_unit
  , left_unitor
  , right_unitor
  ) where
  import Category.Semigroupal (Semigroupal)
  import Isomorphism (Isomorphism)

  data Monoidal :: (* -> * -> *) -> (* -> * -> *) -> * -> * where
    Monoidal ::
      { extend_semigroupal :: Semigroupal cat pro
      , tensor_unit :: i
      , left_unitor :: (forall a. Isomorphism cat (pro i a) a)
      , right_unitor :: (forall a. Isomorphism cat (pro a i) a)
      } -> Monoidal cat pro i