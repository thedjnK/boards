# Copyright (c) 2024 Jamie M.
# SPDX-License-Identifier: Apache-2.0

board_runner_args(pyocd "--target=nrf51822" "--frequency=4000000")
board_runner_args(nrfjprog "--nrf-family=NRF51")
include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
include(${ZEPHYR_BASE}/boards/common/nrfjprog.board.cmake)
