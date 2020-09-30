import React from 'react';
import styles from './layouts.module.css';


class NavBar extends React.Component {
  render() {
    return (

      <nav className="navbar navbar-light navbar-expand-md navigation-clean" style={{background: '#1f2021'}}>
        <div className="container"><a className="navbar-brand" href="#" style={{color: '#dddddd'}}>AdLucem</a><button data-toggle="collapse" data-target="#navcol-1" className="navbar-toggler"><span className="sr-only">Toggle navigation</span><span className="navbar-toggler-icon" /></button>
          <div className="collapse navbar-collapse" id="navcol-1">
            <ul className="nav navbar-nav ml-auto">
              <li className="nav-item"><a className="nav-link active" href="#">Home</a></li>
              <li className="nav-item" style={{color: '#ffffff'}}><a className="nav-link" href="#" style={{color: '#f0f0f0'}}>Resume</a></li>
              <li className="nav-item"><a className="nav-link" href="#" style={{color: '#f0f0f0'}}>Projects</a></li>
              <li className="nav-item"><a className="nav-link" href="#" style={{color: '#f0f0f0'}}>Blog</a></li>
            </ul>
          </div>
        </div>
      </nav>
    );
  }
}


export default function Layout({ children }) {
  return (
    <div>
        <NavBar />
        <div className={styles.container}>
        {children}
        </div>
    </div>
  );
};


