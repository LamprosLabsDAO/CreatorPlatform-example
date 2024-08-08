import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const CreatorPlatformModule = buildModule("CreatorPlatformModule", (m) => {
    const creatorPlatform = m.contract("CreatorPlatform");
    return { creatorPlatform };
});

export default CreatorPlatformModule;
