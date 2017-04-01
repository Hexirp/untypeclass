{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category.Monoidal.Monad.Monad where
  import qualified High.Category.Monoidal.Monad as M (Monad)

  type Hask = (->)

  data Monad :: (* -> *) -> * where
    Monad ::
      { extend_monad :: M.Monad Hask f
      } -> Monad f
