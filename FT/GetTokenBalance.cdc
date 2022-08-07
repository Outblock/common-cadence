import FungibleToken from 0xFungibleToken
import <Token> from <TokenAddress>

pub fun main(address: Address): UFix64 {
    let account = getAccount(address)

    let vaultRef = account
        .getCapability(<TokenBalancePath>)
        .borrow<&<Token>.Vault{FungibleToken.Balance}>()
        ?? panic("Could not borrow Balance capability")

    return vaultRef.balance
 }