#!/usr/bin/env node

import {
    getWWWAuthenticateHeader,
    tokenGenerationProtocol
} from "./privacypass.js"

import {
    genTokens
} from "./generation_and_redemption.js"

genTokens()
