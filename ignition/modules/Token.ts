import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CreatorModule = buildModule("CreatorModule", (m) => {

    const creatorToken = m.contract("CreatorToken", [1000000]);
    const creatorPlatform = m.contract("CreatorPlatform", [creatorToken]);
    return { creatorToken, creatorPlatform };
});

export default CreatorModule;
