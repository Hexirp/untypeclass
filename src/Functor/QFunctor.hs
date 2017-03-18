{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Functor.QFunctor
  ( QFunctor(QFunctor)
  , qfunctor
  , extend_funcor
  ) where
  import Functor

  data QFunctor :: (* -> * -> *) -> (* -> * -> *) -> (* -> * -> *) -> * where
    QFunctor ::
      { extend_functor :: (forall a. Functor cat dat (pro a) f)
      } -> QFunctor cat dat pro f

  qfunctor = QFunctor