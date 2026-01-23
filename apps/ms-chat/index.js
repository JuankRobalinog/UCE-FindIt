const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hola desde ms-chat'));

app.listen(PORT, () => console.log('ms-chat corriendo en puerto ' + PORT));
