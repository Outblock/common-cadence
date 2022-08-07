import FungibleToken from 0xFungibleToken
import <Token> from <TokenAddress>

transaction {

  prepare(signer: AuthAccount) {
    
    if(signer.borrow<&<Token>.Vault>(from: <TokenStoragePath>) != nil) {
      return
    }
    
    signer.save(<-<Token>.createEmptyVault(), to: <TokenStoragePath>)

    signer.link<&<Token>.Vault{FungibleToken.Receiver}>(
      <TokenReceiverPath>,
      target: <TokenStoragePath>
    )

    signer.link<&<Token>.Vault{FungibleToken.Balance}>(
      <TokenBalancePath>,
      target: <TokenStoragePath>
    )
  }
}