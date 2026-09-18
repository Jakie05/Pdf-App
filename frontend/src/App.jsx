import { useEffect, useState } from "react";

function App() {
  const [questions, setQuestions] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch("/api/questions/")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to fetch questions");
        }

        return response.json();
      })
      .then((data) => {
        setQuestions(data);
        setLoading(false);
      })
      .catch((err) => {
        setError(err.message);
        setLoading(false);
      });
  }, []);

  return (
    <div>
      <h1>DevPrep</h1>

      <p>
        Technical Interview Preparation Platform
      </p>

      <hr />

      <h2>Interview Questions</h2>

      {loading && <p>Loading questions...</p>}

      {error && <p>Error: {error}</p>}

      {!loading &&
        !error &&
        questions.map((question) => (
          <div key={question.id}>
            <h3>{question.question}</h3>

            <p>
              <strong>Difficulty:</strong>{" "}
              {question.difficulty}
            </p>

            <p>
              <strong>Answer:</strong>{" "}
              {question.answer}
            </p>

            <p>
              <strong>Explanation:</strong>{" "}
              {question.explanation}
            </p>

            <hr />
          </div>
        ))}
    </div>
  );
}

export default App;
