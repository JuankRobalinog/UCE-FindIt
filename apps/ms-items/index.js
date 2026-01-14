const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hola desde ms-items'));

app.listen(PORT, () => console.log('ms-items corriendo en puerto ' + PORT));
