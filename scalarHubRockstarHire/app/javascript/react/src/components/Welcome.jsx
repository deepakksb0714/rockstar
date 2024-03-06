import React, { useState } from 'react';
import * as ReactDOM from 'react-dom';

const Welcome = () => {
  return (
    <div className="container">
     
      <p>&copy; Foo Test Inc. New Hire Onboarding</p>
      
      <FeedbackForm />
    </div>
    
  );
};


<div>
<div className="container">
  {/* Your page content here */}
  <FeedbackForm />
</div>
<div className="footer">
  &copy; Foo Test Inc. New Hire Onboarding
</div>
</div>

function FeedbackForm() {
  const [feedback, setFeedback] = useState('');
  const [isFormVisible, setIsFormVisible] = useState(false);
  const [thankYou, setThankYou] = useState(false);

  const openForm = () => {
    setIsFormVisible(true);
  };

  const closeForm = () => {
    setIsFormVisible(false);
  };

  const handleFeedbackChange = (e) => {
    setFeedback(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();

    try {
      const csrfToken = document.querySelector('meta[name="csrf-token"]').content;
      
      const response = await fetch('/api/v1/feedbacks', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        },
        body: JSON.stringify({
          name: e.target[0].value,
          email: e.target[2].value,
          comment: feedback,
        }),
      });

      if (response.ok) {
        console.log('Feedback submitted successfully');
        closeForm();
        setThankYou(true);
      } else {
        const data = await response.json();
        console.error('Failed to submit feedback:', data.errors);
      }
    } catch (error) {
      console.error('Error submitting feedback:', error);
    }
  };

  return thankYou ? (
    <div className="thank-you-message">
      <p>Thank you for your feedback!</p>
    </div>
  ) : isFormVisible ? (
    <div className="feedback-form">
      <button type="button" className="close-form-button" onClick={closeForm}>
        X
      </button>
      <h2>Feedback Form</h2>
      <form onSubmit={handleSubmit}>
        <input name="name" placeholder='Name' required />

        <br></br>
        <br></br>
        <input type="ëmail" name="email" placeholder='Email' required />

        <br></br>
        <br></br>
        <textarea
          name="comment"
          value={feedback}
          onChange={handleFeedbackChange}
          placeholder="Enter your feedback..."
          required
        />

        <br></br>
        <button type="submit" className="btn btn-primary">
          Submit Feedback
        </button>
      </form>
    </div>
  ) : (
    <button
      type="button"
      className="btn btn-primary"
      onClick={openForm}
      id="openFeedbackForm"
    >
      Please give feedback
    </button>
  );
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(<Welcome />, document.getElementById('welcome'));
});

export default Welcome;
