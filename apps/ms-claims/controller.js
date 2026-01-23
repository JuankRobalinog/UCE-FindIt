const redisClient = require('./redisClient');

// Simulamos una base de datos de objetos perdidos en la UCE
const DB_SIMULADA = [
    { id: "1", nombre: "Llaves de auto", lugar: "Facultad de Ingeniería" },
    { id: "2", nombre: "Carnet Universitario", lugar: "Biblioteca Central" }
];

const obtenerObjeto = async (req, res) => {
    const { id } = req.params;
    const cacheKey = `item:${id}`;

    try {
        // 1. PASO CACHE: ¿Está en Redis?
        const dataCachada = await redisClient.get(cacheKey);
        
        if (dataCachada) {
            console.log("Servido desde: CACHÉ (Rápido ⚡)");
            return res.json({ origen: "caché", data: JSON.parse(dataCachada) });
        }

        // 2. PASO DB: Si no está, lo buscamos en la "Base de Datos"
        console.log("Servido desde: BASE DE DATOS (Lento 🐢)");
        const objeto = DB_SIMULADA.find(item => item.id === id);

        if (!objeto) return res.status(404).send("No encontrado");

        // 3. PASO GUARDAR: Lo metemos a Redis por 60 segundos
        await redisClient.setEx(cacheKey, 60, JSON.stringify(objeto));

        res.json({ origen: "base_de_datos", data: objeto });
    } catch (error) {
        res.status(500).send("Error de servidor");
    }
};

module.exports = { obtenerObjeto };