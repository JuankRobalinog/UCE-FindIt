const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hola desde ms-auth'));

app.listen(PORT, () => console.log('ms-auth corriendo en puerto ' + PORT));
