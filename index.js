// @ts-check

function prepare(_pluginConfig, { logger }) {
  logger.log('Stopping before publishing...');
  process.exit(0);
}

module.exports = {
  prepare,
};
