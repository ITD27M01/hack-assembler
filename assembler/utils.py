from logging import getLogger
from sys import exit
from os.path import realpath


_log = getLogger(name=__name__)


def get_code(asm_file):
    """
    Reads asm file and constructs list of instruction
    :param asm_file: asm file name
    :return: List of strings represent instruction
    """
    # (TODO): Move files operatoins to utils module
    asm_file_path = realpath(asm_file)
    dirty_code = list()
    try:
        with open(asm_file_path, "r") as assembly_file_descriptor:
            _log.debug(f"Start to process {asm_file_path}")
            instruction = assembly_file_descriptor.readline()
            while instruction:
                dirty_code.append(instruction)
                instruction = assembly_file_descriptor.readline()

        return dirty_code
    except FileNotFoundError:
        exit(f"File {asm_file_path} not found.")
