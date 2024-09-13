import { PinataSDK } from "pinata";
import { vars } from "hardhat/config";

const PINATA_JWT = vars.get('PINATA_JWT');
const PINATA_GATEWAY = vars.get('PINATA_GATEWAY');

const pinata = new PinataSDK({
    pinataJwt: `${PINATA_JWT}`,
    pinataGateway: `${PINATA_GATEWAY}`,
});

async function main() {
    try {
      const data = await pinata.gateways.get("QmZSkiHDhamrmAd6rsmdvwn7n6RWjRqFLjCx9LDqRVbrWV");
      console.log(data);
  
    } catch (error) {
      console.log(error);
    }
  }
  
  main();