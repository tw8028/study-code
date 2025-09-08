import json
import time
from os.path import expanduser
import requests
from requests.auth import HTTPBasicAuth


def sign_in():
    with open(expanduser("config/brain_account.json")) as file:
        credentials = json.load(file)

    username, password = credentials
    sess = requests.session()
    sess.auth = HTTPBasicAuth(username, password)

    response = sess.post("https://api.worldquantbrain.com/authentication")
    print(f'登录: {response.status_code}!{response.json()}')
    return sess


def simulate_progress(alpha_data, start: int = 0):
    sess = sign_in()
    start_time = time.perf_counter()
    execution_time = 0
    n = start
    m = len(alpha_data)
    while n < m:
        sim_resp = sess.post("https://api.worldquantbrain.com/simulations", json=alpha_data[n])
        try:
            sim_progress_url = sim_resp.headers['Location']
            print("模拟进行中", end="", flush=True)
            while True:
                sim_progress_response = sess.get(sim_progress_url)
                retry_after_sec = float(sim_progress_response.headers.get('Retry-After', 0))

                if retry_after_sec == 0:
                    print(" ✅")
                    break

                print(".", end="", flush=True)
                time.sleep(retry_after_sec)

            alpha_id = sim_progress_response.json()['alpha']
            execution_time = time.perf_counter() - start_time
            print(f"完成序列 {n}! Alpha ID: {alpha_id}")
            n += 1

        except Exception as e:
            execution_time = time.perf_counter() - start_time
            print(f"❌ 序列 {n} 发生错误:{e}! try again!")
            time.sleep(10)
            sess = sign_in()

        finally:
            if execution_time > 13400:
                time.sleep(10)
                sess = sign_in()
