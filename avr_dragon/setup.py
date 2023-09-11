from setuptools import find_packages, setup

setup(
    name='avrprogram',
    version='2.0.0',
    packages=find_packages(),
    entry_points='''
        [console_scripts]
        avrprogram=avrprogram.avr32_prog:main
    ''',
)