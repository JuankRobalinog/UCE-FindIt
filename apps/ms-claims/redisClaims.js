const redis = require('redis');
require('dotenv').config();

const claim = redis.createClient({
    url: process.env.REDIS_URL
});

claim.on('error', (err) => console.log('❌ Error en Redis:', err));

const connectRedis = async () => {
    await client.connect();
    console.log('🚀 Conectado a Redis');
};

connectRedis();

module.exports = claim;