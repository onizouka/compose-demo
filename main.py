import redis

# Connexion à Redis
r = redis.Redis(host='redis', port=6379, db=0)

# Enregistrement d'un couple clé/valeur dans Redis
r.set('mykey', 'Hello from Python container!')

# Lecture et affichage de la valeur
value = r.get('mykey')
print(f"Value retrieved from Redis: {value.decode('utf-8')}")
