import NonFungibleToken from 0xNonFungibleToke
import <NFT> from <NFTAddress>

// This transaction is for transferring and NFT from
// one account to another

pub fun check<Token>Vault(address: Address) : Bool {
    let account = getAccount(address)

    let vaultRef = account
    .getCapability<&{NonFungibleToken.CollectionPublic}>(<CollectionPublicPath>)
    .check()

    return vaultRef
}