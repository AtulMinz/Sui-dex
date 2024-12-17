/*
/// Module: dex
module dex::dex;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions

module dex::dex;

use std::option;
use std::type_name::{get, TypeName};
use sui::balance::{Self, Supply};
use sui::clock::Clock;
use sui::coin::{Self, TreasuryCap, Coin};
use sui::dynamic_field as df;
use sui::object::{Self, UID};
use sui::sui::SUI;
use sui::table::{Self, Table};
use sui::transfer;
use sui::tx_context::{Self, TxContext};
use deepbook::clob_v2::{Self as clob, Pool};
use deepbook::custodian_v2::AccountCap;
use dex::eth::ETH;
use dex::usdc::USDC;

 // Constants
  const CLIENT_ID: u64 = 122227;
  const MAX_U64: u64 = 18446744073709551615;
  const NO_RESTRICTION: u8 = 0;
  const FLOAT_SCALING: u64 = 1_000_000_000;
  const EAlreadyMintedThisEpoch: u64 = 0;
