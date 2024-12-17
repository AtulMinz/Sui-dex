module dex::eth;

use std::option;
use sui::coin;
use sui::transfer;
use sui::tx_context::{Self, TxContext};
use sui::url;

public struct ETH has drop {}

fun init(witness: ETH, ctx: &mut TxContext) {
    let (treasury_cap, metadata) = coin::create_currency(
        witness,
        9,
        b"ETH",
        b"ETHcoin",
        b"Ethereum Native Coin",
        option::some(
            url::new_unsafe_from_bytes(
                b"https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png",
            ),
        ),
        ctx,
    );

    transfer::public_transfer(treasury_cap, tx_context::sender(ctx));

    transfer::public_share_object(metadata);
}

#[test]

public fun init_testing(ctx: &mut TxContext) {
    init(ETH {}, ctx);
}
