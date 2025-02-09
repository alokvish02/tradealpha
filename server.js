const express = require('express');
const mysql = require('mysql');
const axios = require('axios');
const moment = require('moment');
const cors = require('cors');
const app = express();
const port = 5000;

const BINANCE_API_URL = 'https://api.binance.com/api/v3/klines';
const CRYPTOCURRENCIES = ['BTC', 'ETH', 'XRP', 'LTC', 'DOGE', 'SOL', 'ADA', 'BNB', 'MATIC', 'DOT', 'AVAX', 'SHIB', 'LINK', 'TRX', 'UNI'];

// Enable CORS
app.use(cors());

// Database connection pool (MySQL)
const pool = mysql.createPool({
  host: '127.0.0.1',
  user: 'root', 
  password: '', 
  database: 'crypto',  
});

// Fetch historical data for a specific cryptocurrency from MySQL
function getHistoricalData(symbol, callback) {
  console.log(`Fetching historical data for: ${symbol}`);
  pool.query('SELECT * FROM ?? ORDER BY timestamp DESC', [symbol], (err, results) => {
    if (err) {
      console.error('Database query error:', err); // Log the exact database error
      return callback(err, null);  // Send error to callback
    }
    console.log('Historical data fetched:', results);
    return callback(null, results);  // Return the fetched data
  });
}

// Fetch real-time data for a specific cryptocurrency symbol from MySQL
function getRealTimeData(symbol, callback) {
  console.log(`Fetching real-time data for: ${symbol}`);
  pool.query('SELECT * FROM ?? ORDER BY timestamp DESC LIMIT 1', [symbol], (err, results) => {
    if (err) {
      console.error('Database query error:', err); // Log the exact database error
      return callback(err, null);  // Send error to callback
    }
    console.log('Real-time data fetched:', results);
    return callback(null, results);  // Return the fetched data
  });
}

// Insert real-time data into MySQL
const insertRealTimeData = (symbol, data) => {
  const { timestamp, open, high, low, close, volume } = data;
  const query = `
    INSERT INTO \`${symbol}USDT\` (timestamp, open, high, low, close, volume)
    VALUES (?, ?, ?, ?, ?, ?)
  `;
  pool.query(query, [timestamp, open, high, low, close, volume], (err) => {
    if (err) {
      console.error('Error inserting data into DB:', err);
    }
  });
};

// Fetch real-time data from Binance API for a specific cryptocurrency
const fetchBinanceData = async (symbol) => {
  try {
    const response = await axios.get(BINANCE_API_URL, {
      params: {
        symbol: `${symbol}USDT`,
        interval: '1m',
        limit: 1,
      },
    });
    const data = response.data[0];
    return {
      timestamp: moment(data[0]).format('YYYY-MM-DD HH:mm:ss'),
      open: parseFloat(data[1]),
      high: parseFloat(data[2]),
      low: parseFloat(data[3]),
      close: parseFloat(data[4]),
      volume: parseFloat(data[5]),
    };
  } catch (error) {
    console.error('Error fetching Binance data:', error);
    return null;
  }
};

// Handle real-time data streaming
let streamingInterval = null;
const startStreaming = () => {
  streamingInterval = setInterval(async () => {
    for (const crypto of CRYPTOCURRENCIES) {
      const data = await fetchBinanceData(crypto);
      if (data) {
        insertRealTimeData(crypto, data);
      }
    }
  }, 60000); // Fetch data every 1 minute
};

const stopStreaming = () => {
  if (streamingInterval) {
    clearInterval(streamingInterval);
    streamingInterval = null;
  }
};

app.get('/historical/:symbol', (req, res) => {
  const symbol = req.params.symbol.toUpperCase() + 'USDT';
  console.log('Fetching historical data for:', symbol);  // Log for debugging
  getHistoricalData(symbol, (err, results) => {
    if (err) {
      console.error('Error fetching historical data:', err);  // Log error
      return res.status(500).send('Error fetching historical data');
    }
    console.log('Fetched historical data:', results);  // Log successful fetch
    res.json(results);
  });
});

app.get('/realtime/:symbol', (req, res) => {
  const symbol = req.params.symbol.toUpperCase() + 'USDT';
  console.log('Fetching real-time data for:', symbol);  // Log for debugging
  getRealTimeData(symbol, (err, results) => {
    if (err) {
      console.error('Error fetching real-time data:', err);  // Log error
      return res.status(500).send('Error fetching real-time data');
    }
    console.log('Fetched real-time data:', results);  // Log successful fetch
    res.json(results);
  });
});

app.get('/start', (req, res) => {
  startStreaming();
  res.send('Streaming started');
});

app.get('/stop', (req, res) => {
  stopStreaming();
  res.send('Streaming stopped');
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

app.get('/store-historical', async (req, res) => {
  try {
    for (const crypto of CRYPTOCURRENCIES) {
      const response = await axios.get(BINANCE_API_URL, {
        params: {
          symbol: `${crypto}USDT`,
          interval: '1m',
          limit: 2880, // Fetch last 2 days of 1-minute candles
        },
      });
      
      if (response.data.length > 0) {
        const insertValues = response.data.map(candle => [
          moment(candle[0]).format('YYYY-MM-DD HH:mm:ss'),
          parseFloat(candle[1]),
          parseFloat(candle[2]),
          parseFloat(candle[3]),
          parseFloat(candle[4]),
          parseFloat(candle[5])
        ]);
        
        const query = `
          INSERT INTO \`${crypto.toLowerCase()}usdt\` (timestamp, open, high, low, close, volume)
          VALUES ?
        `;
        
        pool.query(query, [insertValues], (err) => {
          if (err) {
            console.error(`Error inserting data for ${crypto}:`, err);
          }
        });
      }
    }
    res.send('Historical data for the last 2 days stored successfully');
  } catch (error) {
    console.error('Error fetching and storing historical data:', error);
    res.status(500).send('Error fetching and storing historical data');
  }
});