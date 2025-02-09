import React, { useState, useEffect, useCallback } from "react";
import "./App.css";
import axios from "axios";
import { createChart, CrosshairMode } from "lightweight-charts";

const App = () => {
  const [isStreaming, setIsStreaming] = useState(false);
  const [cryptoData, setCryptoData] = useState({});
  const [selectedCrypto, setSelectedCrypto] = useState("BTC");
  const [historicalData, setHistoricalData] = useState([]);

  const calculateMovingAverage = (history) => {
    if (history.length === 0) return "0.00";
    const sum = history.reduce((acc, val) => acc + val, 0);
    return (sum / history.length).toFixed(2);
  };

  const fetchBinanceData = async (symbol) => {
    try {
      const response = await axios.get(`https://api.binance.com/api/v3/ticker/price?symbol=${symbol}USDT`);
      return response.data;
    } catch (error) {
      console.error("Error fetching Binance data:", error);
      return null;
    }
  };

  const fetchHistoricalData = async (symbol) => {
    try {
      const response = await axios.get(`http://localhost:5000/historical/${symbol.toLowerCase()}`);
      setHistoricalData(response.data);
    } catch (error) {
      console.error("Error fetching historical data:", error);
    }
  };

  const fetchRealTimeData = useCallback(async () => {
    try {
      const symbols = ["BTC", "ETH", "XRP", "LTC", "DOGE", "SOL", "ADA", "BNB", "MATIC", "DOT", "AVAX", "SHIB", "LINK", "TRX", "UNI"];
      const updatedData = { ...cryptoData };

      for (let symbol of symbols) {
        const cryptoInfo = await fetchBinanceData(symbol);
        if (cryptoInfo) {
          const price = parseFloat(cryptoInfo.price);
          updatedData[symbol] = {
            time: new Date().toLocaleTimeString(),
            ltp: price,
            history: [price, ...(updatedData[symbol]?.history || [])].slice(0, 12),
          };
        }
      }
      setCryptoData(updatedData);
    } catch (error) {
      console.error("Error fetching real-time data:", error);
    }
  }, [cryptoData]);

  const storeHistoricalData = async () => {
    try {
      await axios.get('http://localhost:5000/store-historical');
      alert('Historical data stored successfully');
    } catch (error) {
      console.error("Error storing historical data:", error);
      alert('Error storing historical data');
    }
  };

  useEffect(() => {
    let interval;
    if (isStreaming) {
      interval = setInterval(fetchRealTimeData, 1000);
    }
    return () => clearInterval(interval);
  }, [isStreaming, fetchRealTimeData]);

  useEffect(() => {
    fetchHistoricalData(selectedCrypto);
  }, [selectedCrypto]);

  const renderChart = useCallback(async () => {
    const chartData = historicalData.map(data => ({
      time: new Date(data.timestamp).getTime() / 1000,
      open: data.open,
      high: data.high,
      low: data.low,
      close: data.close,
    }));

    const chartContainer = document.getElementById('chart');
    chartContainer.innerHTML = ''; // Clear previous chart

    const chart = createChart(chartContainer, {
      layout: {
        backgroundColor: '#121212',
        textColor: '#ffffff',
      },
      grid: {
        vertLines: {
          visible: false,
        },
        horzLines: {
          visible: false,
        },
      },
      timeScale: {
        timeVisible: true,
        secondsVisible: true,
      },
      priceScale: {
        position: 'right',
        borderColor: '#ccc',
      },
      crosshair: {
        mode: CrosshairMode.Normal,
      },
      width: chartContainer.clientWidth,
      height: 500,
    });

    const candlestickSeries = chart.addCandlestickSeries({
      upColor: '#26a69a',
      downColor: '#ef5350',
      borderDownColor: '#ef5350',
      borderUpColor: '#26a69a',
      wickDownColor: '#ef5350',
      wickUpColor: '#26a69a',
    });

    candlestickSeries.setData(chartData);

    window.addEventListener('resize', () => {
      chart.resize(chartContainer.clientWidth, 500);
    });
  }, [historicalData]);

  useEffect(() => {
    renderChart();
  }, [historicalData, renderChart]);

  const handleCryptoClick = async (crypto) => {
    setSelectedCrypto(crypto);
    if (!cryptoData[crypto]) {
      setCryptoData((prevData) => ({
        ...prevData,
        [crypto]: { time: "--:--:--", ltp: 0, history: [] },
      }));
    }
  };

  const renderTable = () => {
    const crypto = selectedCrypto;
    const data = cryptoData[crypto] || { time: "--:--:--", ltp: 0, history: [] };

    return (
      <table className="crypto-table">
        <thead>
          <tr>
            <th>Crypto</th>
            <th>Real-Time</th>
            <th>Latest Price</th>
            <th>Moving Average</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>{crypto}</td>
            <td>{data.time}</td>
            <td>${data.ltp?.toFixed(2) || "0.00"}</td>
            <td>${calculateMovingAverage(data.history)}</td>
          </tr>
        </tbody>
      </table>
    );
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>Real-Time Cryptocurrency Data</h1>
        <div className="control-buttons">
          <button onClick={() => setIsStreaming(true)} disabled={isStreaming}>Start</button>
          <button onClick={() => setIsStreaming(false)} disabled={!isStreaming}>Stop</button>
          <button onClick={storeHistoricalData}>Store Historical Data</button>
        </div>

        <div className="crypto-selection">
          {["BTC", "ETH", "XRP", "LTC", "DOGE", "SOL", "ADA", "BNB", "MATIC", "DOT", "AVAX", "SHIB", "LINK", "TRX", "UNI"].map((crypto) => (
            <button key={crypto} onClick={() => handleCryptoClick(crypto)}>
              {crypto}
            </button>
          ))}
        </div>

        {renderTable()}

        <h2>{selectedCrypto} Chart</h2>
        <div className="chart-container">
          <div id="chart" className="chart"></div>
        </div>
      </header>
    </div>
  );
};

export default App;