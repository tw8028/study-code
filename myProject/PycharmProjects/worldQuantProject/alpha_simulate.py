import json
import tools
from os.path import expanduser


def create_alpha_data():
    fields_file = 'config/output_fundamental6.json'
    with open(expanduser(fields_file)) as file:
        fields_list = json.load(file)

    alpha_data = []
    for datafield in fields_list:
        # expression
        alpha_expression = f"group_rank({datafield}/cap, subindustry)"
        alpha_expression1 = f'(rank(ts_arg_max(signed_power(((returns < 0) ? ts_std_dev(returns, 20) : close), 2), 6))-0.5)'
        simulation_data = {
            'type': 'REGULAR',
            'settings': {
                'instrumentType': 'EQUITY',
                'region': 'USA',
                'universe': 'TOP3000',
                'delay': 1,
                'decay': 0,
                'neutralization': 'SUBINDUSTRY',
                'truncation': 0.08,
                'pasteurization': 'ON',
                'unitHandling': 'VERIFY',
                'nanHandling': 'ON',
                'language': 'FASTEXPR',
                'visualization': False,
            },
            'regular': alpha_expression
        }
        alpha_data.append(simulation_data)

    return alpha_data


def main():
    alpha_data = create_alpha_data()
    print(f'{len(alpha_data)} Alpha data is ready!')
    tools.simulate_progress(alpha_data=alpha_data, start=521)


if __name__ == "__main__":
    main()
