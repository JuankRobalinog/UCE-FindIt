import React from 'react';
import logo from '../assets/Uce Findit 1.jpg'; 

const Navbar = () => {
  return (
    <nav style={{ display: 'flex', alignItems: 'center', padding: '1rem', background: '#003366', color: 'white' }}>
      <img src={logo} alt="UceFindit Logo" style={{ height: '50px', marginRight: '1rem' }} />
      <h1>UceFindit - Lost & Found</h1>
    </nav>
  );
};

export default Navbar;
