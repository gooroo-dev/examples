import React, { useState, useEffect } from 'react';

const MyLovelyComponent: React.FC = () => {
  const [userInput, setUserInput] = useState<string>('');
  const [items, setItems] = useState<string[]>([]);
  const [filteredItems, setFilteredItems] = useState<string[]>([]);

  const handleChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setUserInput(event.target.value);
  };

  // Simulate fetching data
  useEffect(() => {
    const fetchData = async () => {
      const data = ['item1', 'item2', 'item3', 'item4', 'item5'];
      setItems(data);
    };
    fetchData();
  }, []);

  // Filter items based on user input (Performance bottleneck)
  useEffect(() => {
    const result = items.filter(item => item.includes(userInput));
    setFilteredItems(result);
  }, [userInput, items]);

  return (
    <div>
      <h1>My Lovely Component</h1>
      <input type="text" value={userInput} onChange={handleChange} placeholder="Enter some text" />
      <div>
        <h2>Output:</h2>
        {/* Directly rendering user input without sanitization */}
        <div dangerouslySetInnerHTML={{ __html: userInput }} />
      </div>
      <div>
        <h2>List of Items:</h2>
        <ul>
          {filteredItems.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      </div>
    </div>
  );
};

export default MyLovelyComponent;
