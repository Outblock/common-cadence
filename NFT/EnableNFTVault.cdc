import NonFungibleToken from 0xNonFungibleToken
import <NFT> from <NFTAddress>

transaction {
    prepare(signer: AuthAccount) {
        // if the account doesn't already have a collection
        if signer.borrow<&<NFT>.Collection>(from: <CollectionStoragePath>) == nil {

            // create a new empty collection
            let collection <- <NFT>.createEmptyCollection()
            
            // save it to the account
            signer.save(<-collection, to: <CollectionStoragePath>)

            // create a public capability for the collection
            signer.link<&<NFT>.Collection{NonFungibleToken.CollectionPublic, NonFungibleToken.Receiver, <CollectionPublic>}>(<CollectionPublicPath>, target: <CollectionStoragePath>)
        }
    }
}