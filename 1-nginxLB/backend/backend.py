import os
from http.server import HTTPServer, BaseHTTPRequestHandler

SERVER_ID = int(os.getenv("SERVER_ID", 0))
print(f"Server ID is: {SERVER_ID}")

PORT = 8000

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):            
        self.send_response(200)
        self.send_header("Content-Type", "text/plain") 
        self.end_headers()
        self.wfile.write(str(SERVER_ID).encode())

if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", PORT), Handler)
    print(f"Server {SERVER_ID} listening on port {PORT} ...")
    server.serve_forever()
