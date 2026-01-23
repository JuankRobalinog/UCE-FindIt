const redis = require('redis');

// Creamos el cliente
const client = redis.createClient({
    // Aquí irá la URL de AWS ElastiCache después, 
    // por ahora usamos localhost para tus pruebas.
    url: process.env.REDIS_URL || 'redis://localhost:6379'
});

client.on('error', (err) => console.log('Error en Redis:', err));

// Función para conectar (Node.js moderno usa promesas/async)
const connectRedis = async () => {
    if (!client.isOpen) {
        await client.connect();
        console.log('Conectado a Redis correctamente');
    }
};

connectRedis();

module.exports = client;