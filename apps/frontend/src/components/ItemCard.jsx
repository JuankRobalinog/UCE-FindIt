import React from 'react';
import { MapPin, Calendar, Tag } from 'lucide-react';

const ItemCard = ({ item }) => {
  return (
    <div className="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-shadow border border-gray-100">
      <div className="p-5">
        <div className="flex justify-between items-start">
          <h3 className="text-lg font-bold text-gray-800">{item.objectName}</h3>
          <span className={`px-2 py-1 rounded text-xs font-semibold ${
            item.status === 'encontrado' ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'
          }`}>
            {item.status.toUpperCase()}
          </span>
        </div>
        
        <p className="text-gray-600 mt-2 text-sm line-clamp-2">{item.description}</p>
        
        <div className="mt-4 space-y-2">
          <div className="flex items-center text-gray-500 text-sm">
            <MapPin size={16} className="mr-2" />
            {item.location}
          </div>
          <div className="flex items-center text-gray-500 text-sm">
            <Calendar size={16} className="mr-2" />
            {item.dateFound}
          </div>
        </div>
        
        <button className="w-full mt-5 bg-blue-50 text-blue-600 py-2 rounded-lg font-medium hover:bg-blue-600 hover:text-white transition-colors">
          Ver detalles
        </button>
      </div>
    </div>
  );
};

export default ItemCard;