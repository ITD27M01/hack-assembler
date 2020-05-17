import logging
from assembler.arguments import args_parser
from assembler.parser import parse
from assembler.code import assemble

_log = logging.getLogger(name='main')


def main():
    args = args_parser()

    level = getattr(logging, args.log.upper(), None)
    if not isinstance(level, int):
        raise ValueError('Invalid log level: %s' % args.log)
    logging.basicConfig(level=level)

    parsed_code = parse(args.file)
    _log.debug(f"parsed code: {parsed_code}")

    assembled_code = assemble(parsed_code, args.file)
    _log.debug(f"assembled code: {assembled_code}")


if __name__ == '__main__':
    main()
