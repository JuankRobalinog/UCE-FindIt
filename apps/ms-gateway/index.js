const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hola desde ms-gateway'));

app.listen(PORT, () => console.log('ms-gateway corriendo en puerto ' + PORT));
