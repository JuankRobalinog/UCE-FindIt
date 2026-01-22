const express = require('express');
const { obtenerObjeto } = require('./controller');
require('dotenv').config();

const app = express();
const PORT = process.env.PORT || 3001;

// Ruta de prueba
app.get('/item/:id', obtenerObjeto);

app.listen(PORT, () => {
    console.log(`📡 Microservicio UceFindit corriendo en http://localhost:${PORT}`);
});