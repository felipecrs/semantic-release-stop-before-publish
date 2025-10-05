// @ts-check

export function prepare(_pluginConfig, { logger }) {
  logger.log('Stopping before publishing...');
  process.exit(0);
}
