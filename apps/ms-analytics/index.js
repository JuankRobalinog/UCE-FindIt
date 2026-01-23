const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hola desde ms-analytics'));

app.listen(PORT, () => console.log('ms-analytics corriendo en puerto ' + PORT));
