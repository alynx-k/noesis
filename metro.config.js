const { getDefaultConfig } = require('expo/metro-config');

const config = getDefaultConfig(__dirname);

// @tanstack/query-core's package.json "exports" field trips a Metro bug
// where its internal relative imports (e.g. "./queryCache.js" from its own
// index.js) fail to resolve even though the file exists on disk. Falling
// back to the legacy main/module fields sidesteps it entirely.
config.resolver.unstable_enablePackageExports = false;

module.exports = config;
