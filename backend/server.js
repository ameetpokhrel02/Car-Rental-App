// ... existing code ...

// Example in-memory data
let cars = [
  { id: 1, name: 'Hyundai Verna', rating: 4.8, price: 25.00, specs: ['Manual', 'Petrol', '5 Seats'], image: 'hyundai_verna.png' },
  { id: 2, name: 'BMW 3 Series', rating: 4.7, price: 30.00, specs: ['Automatic', 'Petrol', '5 Seats'], image: 'bmw_3series.png' },
  { id: 3, name: 'Toyota Camry', rating: 4.6, price: 28.00, specs: ['Automatic', 'Hybrid', '5 Seats'], image: 'toyota_camry.png' },
  { id: 4, name: 'Tesla Model S', rating: 4.9, price: 40.00, specs: ['Automatic', 'Electric', '5 Seats'], image: 'tesla.png' }
];
let favorites = [];
let users = [];

// Get all cars
app.get('/api/cars', (req, res) => {
  res.json(cars);
});

// Get a single car by ID
app.get('/api/cars/:id', (req, res) => {
  const car = cars.find(c => c.id === parseInt(req.params.id));
  if (car) res.json(car);
  else res.status(404).json({ error: 'Car not found' });
});

// Add to favorites
app.post('/api/favorites', (req, res) => {
  const { carId } = req.body;
  if (!favorites.includes(carId)) favorites.push(carId);
  res.json({ favorites });
});

// Get all favorite cars
app.get('/api/favorites', (req, res) => {
  const favoriteCars = cars.filter(car => favorites.includes(car.id));
  res.json(favoriteCars);
});

// Remove from favorites
app.delete('/api/favorites/:carId', (req, res) => {
  favorites = favorites.filter(id => id !== parseInt(req.params.carId));
  res.json({ favorites });
});

// Example user registration (simple, no auth)
app.post('/api/users', (req, res) => {
  const { username } = req.body;
  if (!users.includes(username)) users.push(username);
  res.json({ users });
});

// ... existing code ...