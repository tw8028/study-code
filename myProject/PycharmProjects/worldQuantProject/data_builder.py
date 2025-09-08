import json
import pandas as pd
import tools


def create_datafields_json(s, search_scope, dataset_id: str = '', search: str = '', data_type: str = 'MATRIX'):
    instrument_type = search_scope['instrumentType']
    region = search_scope['region']
    delay = search_scope['delay']
    universe = search_scope['universe']

    if len(search) == 0:
        url_template = "https://api.worldquantbrain.com/data-fields?" \
                       f"&instrumentType={instrument_type}" \
                       f"&region={region}&delay={str(delay)}&universe={universe}&dataset.id={dataset_id}&limit=50" \
                       "&offset={x}"
        count = s.get(url_template.format(x=0)).json()['count']
    else:
        url_template = "https://api.worldquantbrain.com/data-fields?" \
                       f"&instrumentType={instrument_type}" \
                       f"&region={region}&delay={str(delay)}&universe={universe}&limit=50" \
                       f"&search={search}" \
                       "&offset={x}"
        count = 100

    datafields_list = []
    for x in range(0, count, 50):
        datafields = s.get(url_template.format(x=x))
        datafields_list.append(datafields.json()['results'])

    datafields_list_flat = [item for sublist in datafields_list for item in sublist]
    datafields_df = pd.DataFrame(datafields_list_flat)
    datafields_df = datafields_df[datafields_df['type'] == data_type]
    datafields_list = datafields_df['id'].tolist()
    with open(f'config/output_{dataset_id}.json', 'w', encoding='utf-8') as f:
        json.dump(datafields_list, f, ensure_ascii=False, indent=4)
    print(f'生成文件 {f.name}')


def output_fundamental6(sess):
    dataset_id = 'fundamental6'
    data_type = 'MATRIX'
    search_scope = {'region': 'USA', 'delay': 1, 'universe': 'TOP3000', 'instrumentType': 'EQUITY'}
    search = ''
    create_datafields_json(s=sess, search_scope=search_scope, dataset_id=dataset_id, search=search, data_type=data_type)


def main():
    sess = tools.sign_in()
    output_fundamental6(sess)


if __name__ == "__main__":
    main()
