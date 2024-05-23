from setuptools import find_packages
from setuptools import setup

setup(
    name="hs3program",
    version="2.0.0",
    packages=find_packages(),
    install_requires=["pyelftools>=0.29", "pyftdi>=0.54.0"],
    entry_points="""
        [console_scripts]
        hs3program=hs3program.avr32_prog:main
    """,
)
