{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category.Monoidal where
  import High.Category.Semigroupal (Semigroupal)
  import High.Isomorphism (Isomorphism)

  data Monoidal :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> (* -> *) -> * where
    Monoidal ::
      { extend_semigroupal :: Semigroupal cat pro
      , tensor_unit :: (forall a. a -> i a)
      , left_unitor :: (forall a. Isomorphism cat (pro i a) a)
      , right_unitor :: (forall a. Isomorphism cat (pro a i) a)
      } -> Monoidal cat pro i