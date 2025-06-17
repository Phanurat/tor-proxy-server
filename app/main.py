import requests

proxies = {
    'http': 'socks5h://127.0.0.1:9050',
    'https': 'socks5h://127.0.0.1:9050'
}

def check_ip():
    url = 'http://httpbin.org/ip'
    res = requests.get(url, proxies=proxies)
    print("🔐 Tor IP:", res.text)

def check_tor_status():
    try:
        res = requests.get("http://check.torproject.org", proxies=proxies)
        if "Congratulations" in res.text:
            print("✅ กำลังใช้งาน Tor อยู่")
        else:
            print("❌ ไม่ได้ใช้ Tor")
    except Exception as e:
        print("⚠️ มีข้อผิดพลาด:", e)

if __name__ == "__main__":
    check_ip()
    check_tor_status()
