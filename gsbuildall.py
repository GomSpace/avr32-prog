#!/usr/bin/env python3
# Copyright (c) 2024 GomSpace A/S. All rights reserved.
import logging

LOG = logging.getLogger(__name__)
from deps.src.py_common.py_common.code_quality import run_recommended_code_quality_checks


def main():
    # Setup logging
    logging.basicConfig(
        level=logging.INFO,
        format="[%(asctime)s.%(msecs)03d] %(levelname)-8s - %(message)s",
        datefmt="%H:%M:%S",
    )

    # Run code quality checks
    if not check_code_quality():
        LOG.error("Code quality checks failed")
        exit(1)
    else:
        LOG.info("Code quality checks passed")


def check_code_quality() -> bool:
    """Run code quality checks."""
    LOG.info("Running code quality checks")
    sources = "*.py digilent_hs3/hs3program"
    result = run_recommended_code_quality_checks(sources)
    return result == 0


if __name__ == "__main__":
    main()
