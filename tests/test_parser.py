import re
import assembler.parser as parser
from assembler.parser import A_INSTRUCTION, C_INSTRUCTION, L_INSTRUCTION

CLEARED_CODE = [
    '(MAIN_LOOP)',
    'AM=M-1',
    '@next'
]
A_INSTRUCTION_GROUPS = re.fullmatch(A_INSTRUCTION, '@next').groups()
C_INSTRUCTION_GROUPS = re.fullmatch(C_INSTRUCTION, 'AM=M-1').groups()
L_INSTRUCTION_GROUPS = re.fullmatch(L_INSTRUCTION, '(MAIN_LOOP)').groups()


def test_parse(mocker):
    mocker.patch.object(parser, '_get_path')
    parser.path_realpath.return_value = None
    mocker.patch.object(parser, '_cleanup_code')
    parser._cleanup_code.return_value = CLEARED_CODE

    for instruction in parser.parse(None):
        if instruction['type'] == 'A_INSTRUCTION':
            assert instruction['obj'].groups() == A_INSTRUCTION_GROUPS
        if instruction['type'] == 'C_INSTRUCTION':
            assert instruction['obj'].groups() == C_INSTRUCTION_GROUPS
        if instruction['type'] == 'L_INSTRUCTION':
            assert instruction['obj'].groups() == L_INSTRUCTION_GROUPS
