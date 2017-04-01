{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category.Semigroupal where
  import High.Functor.Bifunctor (Bifunctor)
  import High.Isomorphism (Isomorphism)

  data Semigroupal :: ((* -> *) -> (* -> *) -> *) -> ((* -> *) -> (* -> *) -> (* -> *)) -> * where
    Semigroupal ::
      { tensor_product :: Bifunctor cat cat cat pro
      , associator :: (forall f g h. Isomorphism cat (pro (pro f g) h) (pro f (pro g h)))
      } -> Semigroupal cat pro
