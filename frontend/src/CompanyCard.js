import React from 'react';
import { Link } from 'react-router-dom';
import './CompanyCard.css';

/**
 *  CompanyCard shows information about a single company.
 *
 *  Endpoint: /companies   // TODO: The endpoint itself doesn't render the card
 *
 *  Props:
 *  - company: {handle, name, description, numEmployees, logoUrl}
 *
 *  States:
 *  - None
 *
 *   CompanyList -> CompanyCard
 */

function CompanyCard({ company }) {
  console.log("Rendering CompanyCard with company: ", company);
  return (
    <div className="CompanyCard-card">
      <Link className="CompanyCard" to={`/companies/${company.handle}`}>
        <h4>{company.name}&nbsp;</h4>
        {company.logoUrl
          ? <img src={company.logoUrl} alt={company.name} />
          : ""
        }
        <div className="CompanyCard-card-description">
          <p>{company.description}</p>
        </div>
      </Link>
    </div>
  );
}

export default CompanyCard;