import argparse


def args_parser():
    parser = argparse.ArgumentParser(description='Generates hack machine binary code from symbolic form.')
    parser.add_argument('file', nargs='?', type=str, action='store',
                        help='File path with assembly code')

    parser.add_argument('--log', type=str, default='INFO', action='store',
                        help='log level for assembler')

    return parser.parse_args()
