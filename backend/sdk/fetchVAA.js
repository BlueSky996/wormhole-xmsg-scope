import { getSignedVAAWithRetry, parseVaa, } from "@wormhole-foundation/wormhole-sdk";

const GUARDIAN_RPC = "https://wormhole-v2-testnet-api.certus.one";

// eth sepolia
const CHAIN_ID = 2;

// sourcemessenger address = 32 byte padded
const EMITTER = 
   "000000000000000000000000d4e095ca2381c0da7af8fdcd947962c82e919f87";

const SEQUENCE = "1";

async function fetchVAA() {
    const { vaaBytes } = await getSignedVAAWithRetry(
        GUARDIAN_RPC,
        CHAIN_ID, // source chain id
        EMITTER, //source contract
        SEQUENCE // from tx log
    );

    const parsed = parseVaa(vaa.vaaBytes);

    console.log("Raw Payload (bytes)", parsed.payload);
    console.log("Decoded payload (string):", ArrayBuffer.from(parsed.payload).toString());


}

fetchVAA();