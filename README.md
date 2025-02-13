# 📈 Stock Watchlist App  

A Flutter-based stock watchlist app that displays stock prices, changes, and trends with a clean and reusable UI. The app supports multiple watchlists using **TabBar** and **ListView**, making it easy to track stock performance dynamically.  

---

## 📂 Folder Structure  

```
lib/
│── main.dart                 # Entry point of the app
│
└── watchlist/                # Watchlist module
    │── screens/              # UI Screens
    │   └── watchlist_screen.dart   # Main watchlist screen with tabs
    │   └── watchlist_tab1.dart     # Main screen having contents of tab1
    |
    │── models/               # Data models
    │   └── stock.dart        # Stock model class
    │
    │── components/           # UI Components
    │   └── stock_card.dart   # Reusable stock card widget
```

### **📜 Explanation of Folders & Files**
- **`screens/`** – Contains the `WatchlistScreen`, which manages tab navigation and stock list UI.  
- **`models/`** – Defines the `Stock` class to represent stock data.  
- **`components/`** – Includes `StockCard`, a reusable widget for displaying stock details.  
- **`main.dart`** – The entry point of the application that initializes the app and `WatchlistScreen`.  

### **2️⃣ Installation**  
```sh
git clone https://github.com/TirthNisar193/021.trade-assignment.git
cd stock-watchlist-app
flutter pub get
flutter run
```

---

### **🚀 Happy Coding! 🚀**  
Let me know if you want to customize it further! 😊
