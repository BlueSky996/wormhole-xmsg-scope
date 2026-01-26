import { getSignedVAAWithRetry } from "@wormhole-foundation/wormhole-sdk";

const GUARDIAN_RPC = "https://wormhole-v2-testnet-api.certus.one";

async function fetchVAA() {
    const vaa = await getSignedVAAWithRetry(
        GUARDIAN_RPC,
        2, // source chain id
        "EMITTER_ADDR", //source contract
        "SEQUENCE" // from tx log
    );

    console.log(vaa.vaaBytes);
}

fetchVAA();