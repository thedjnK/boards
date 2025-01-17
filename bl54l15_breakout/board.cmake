# Copyright (c) 2024 Nordic Semiconductor ASA
# SPDX-License-Identifier: Apache-2.0

if(CONFIG_SOC_NRF54L15_CPUAPP)
  board_runner_args(jlink "--device=cortex-m33" "--speed=4000")
elseif(CONFIG_SOC_NRF54L15_CPUFLPR)
  set(JLINKSCRIPTFILE ${CMAKE_CURRENT_LIST_DIR}/support/bl54l15_nrf54l15_cpuflpr.JLinkScript)
  board_runner_args(jlink "--device=RISC-V" "--speed=4000" "-if SW" "--tool-opt=-jlinkscriptfile ${JLINKSCRIPTFILE}")
endif()

include(${ZEPHYR_BASE}/boards/common/nrfutil.board.cmake)
include(${ZEPHYR_BASE}/boards/common/jlink.board.cmake)
