import time
import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis-lb', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hit():
    count = get_hit_count()
    return 'Web Server have been hit %i times since deployment !!.\n' % int(count)


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
