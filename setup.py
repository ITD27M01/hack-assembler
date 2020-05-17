from setuptools import setup

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name='assembler',
    version='0.1.0',
    author="itd27m01",
    author_email="igortiunov@gmail.com",
    description="nand2tetris hack assembler",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://www.nand2tetris.org/project06",
    packages=['assembler'],
    python_requires=">=3.8",
    entry_points='''
        [console_scripts]
        assembler=assembler.cli:main
    '''
)