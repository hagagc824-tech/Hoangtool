<!DOCTYPE html>
<html>
<head>
    <title>SYSTEM ADMIN</title>
    <style>
        body { background: #050505; color: #00ff00; font-family: monospace; }
        .log-area { height: 400px; overflow-y: scroll; border: 1px solid #333; padding: 10px; }
    </style>
</head>
<body>
    <h2 align="center">📡 LOG NHÓM (REAL-TIME)</h2>
    <div class="log-area" id="logs">Đang kết nối tới server...</div>
    <script>
        // Cập nhật log mỗi 1 giây
        setInterval(() => {
            fetch('http://localhost:3000/get-logs')
            .then(res => res.json())
            .then(data => {
                document.getElementById('logs').innerHTML = data.map(l => 
                    `<div>[${l.time}] <b>${l.user}</b>: ${l.msg}</div>`).join('');
            }).catch(() => {
                document.getElementById('logs').innerHTML = "⚠️ MẤT KẾT NỐI SERVER";
            });
        }, 1000);
    </script>
</body>
</html>
