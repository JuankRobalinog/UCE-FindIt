import React, { useState } from 'react';

const ItemForm = () => {
  const [formData, setFormData] = useState({
    name: '',
    location: '',
    description: ''
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("Datos del objeto:", formData);
    // Aquí conectarás con tu Microservicio de Items mañana
  };

  return (
    <div style={{ padding: '2rem', maxWidth: '500px', margin: 'auto' }}>
      <h2>Reportar Objeto Perdido/Encontrado</h2>
      <form onSubmit={handleSubmit} style={{ display: 'flex', flexDirection: 'column', gap: '1rem' }}>
        <input 
          type="text" 
          placeholder="¿Qué encontraste/perdiste?" 
          onChange={(e) => setFormData({...formData, name: e.target.value})}
          required 
        />
        <input 
          type="text" 
          placeholder="Ubicación (ej: Facultad de Ingeniería)" 
          onChange={(e) => setFormData({...formData, location: e.target.value})}
          required 
        />
        <textarea 
          placeholder="Descripción adicional..." 
          onChange={(e) => setFormData({...formData, description: e.target.value})}
        />
        <button type="submit" style={{ padding: '0.5rem', background: '#28a745', color: 'white', border: 'none', cursor: 'pointer' }}>
          Publicar Reporte
        </button>
      </form>
    </div>
  );
};

export default ItemForm;