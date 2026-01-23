// frontend/src/App.jsx
import React from 'react';
import ItemCard from './components/ItemCard';
import { Search, PlusCircle } from 'lucide-react';
import './index.css';

const MOCK_DATA = [
  { id: 1, objectName: "Laptop HP", description: "Encontrada en la Facultad de Ingeniería, tiene un sticker de Batman.", location: "Piso 3, Lab 4", dateFound: "2024-05-10", status: "encontrado" },
  { id: 2, objectName: "Llaves", description: "Llavero de peluche, encontradas cerca del comedor.", location: "Explanada Central", dateFound: "2024-05-12", status: "encontrado" },
  { id: 3, objectName: "Calculadora Casio", description: "Calculadora científica sin tapa.", location: "Biblioteca", dateFound: "2024-05-09", status: "encontrado" },
];

function App() {
  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-blue-800 text-white py-6 shadow-md">
        <div className="container mx-auto px-4 flex justify-between items-center">
          <h1 className="text-2xl font-black tracking-tight italic">UCE FINDIT</h1>
          <button className="flex items-center bg-white text-blue-800 px-4 py-2 rounded-full font-bold hover:bg-blue-100">
            <PlusCircle className="mr-2" size={20} /> Reportar
          </button>
        </div>
      </header>

      {/* Main Content */}
      <main className="container mx-auto px-4 py-10">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
          {MOCK_DATA.map(item => (
            <ItemCard key={item.id} item={item} />
          ))}
        </div>
      </main>
    </div>
  );
}

export default App;