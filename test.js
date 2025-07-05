// 🔁 Fetch signal from local API
async function fetchSignal() {
  try {
    const res = await fetch("http://localhost:3000", {
      method: "GET",
      headers: {
        "Content-Type": "application/json"
      }
    });

    if (!res.ok) throw new Error("❌ API request failed: " + res.status);

    const signal = await res.json();
    console.log("📥 Signal received:", signal);
    return signal;
  } catch (err) {
    console.error("❌ Failed to fetch signal from API:", err.message);
    throw err;
  }
}

// 📅 Set date and time
function setDatetime(value = "2025-07-05 11:30:00") {
  const datetimeInput = document.querySelector('.input-group.date input.form-control');
  const nativeSetter = Object.getOwnPropertyDescriptor(window.HTMLInputElement.prototype, 'value').set;
  nativeSetter.call(datetimeInput, value);

  datetimeInput.dispatchEvent(new Event('input', { bubbles: true }));
  datetimeInput.dispatchEvent(new Event('change', { bubbles: true }));
  datetimeInput.dispatchEvent(new Event('blur', { bubbles: true }));
  datetimeInput.dispatchEvent(new KeyboardEvent('keydown', { key: 'Enter', bubbles: true }));
  datetimeInput.dispatchEvent(new KeyboardEvent('keyup', { key: 'Enter', bubbles: true }));

  console.log("✅ Date/time set to:", value);
}

// ⏱ Set timeframe using +/– buttons
async function setTimeframe(hours = 0, minutes = 5, seconds = 0) {
  const rwBlocks = document.querySelectorAll('.quick-timeframe-selector__in .rw');
  const targets = [hours, minutes, seconds];

  for (let i = 0; i < 3; i++) {
    const block = rwBlocks[i];
    const input = block.querySelector('input');
    const plusBtn = block.querySelector('.btn-plus');
    const minusBtn = block.querySelector('.btn-minus');

    const getVal = () => parseInt(input.value, 10) || 0;

    while (getVal() > targets[i]) {
      minusBtn.click();
      await new Promise(r => setTimeout(r, 150));
    }

    while (getVal() < targets[i]) {
      plusBtn.click();
      await new Promise(r => setTimeout(r, 150));
    }

    console.log(`✅ ${['Hours', 'Minutes', 'Seconds'][i]} set to ${targets[i].toString().padStart(2, '0')}`);
  }
}

// 🚀 Execute trade
async function placeTrade(signal) {
  // 1. Click asset dropdown
  document.querySelector('button[title*="OTC"]').click();
  await new Promise(r => setTimeout(r, 500));

  // 2. Search for asset
  const searchInput = document.querySelector('input[type="search"][role="combobox"]');
  searchInput.value = signal.asset;
  searchInput.dispatchEvent(new Event('input', { bubbles: true }));
  await new Promise(r => setTimeout(r, 500));

  // 3. Select asset
  const assetOption = Array.from(document.querySelectorAll('a.dropdown-item span.text'))
    .find(el => el.textContent.trim() === signal.asset);
  if (assetOption) assetOption.click();
  else return console.error("❌ Asset not found:", signal.asset);

  // 4. Timeframe
  await setTimeframe(...signal.timeframe);

  // 5. Datetime
  setDatetime(signal.datetime);

  // 6. Buy or Sell
  if (signal.direction === "call") {
    document.querySelector('#pending-trades_higher-btn').click();
  } else {
    document.querySelector('#pending-trades_lower-btn').click();
  }

  console.log("✅ Trade placed:", signal.direction.toUpperCase(), "→", signal.asset);
}

// 🔄 Loop every 1 minute
async function startLoop() {
  console.log("🔁 Starting signal polling loop...");
  while (true) {
    try {
      const signal = await fetchSignal();
      await placeTrade(signal);
    } catch (err) {
      console.warn("⚠️ Skipping this cycle due to error.");
    }

    await new Promise(r => setTimeout(r, 60_000)); // Wait 1 minute
  }
}

startLoop();
