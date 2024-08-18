/*
 * Copyright (c) 2024 Jamie M.
 */

#include <zephyr/kernel.h>
#include <zephyr/types.h>
#include <zephyr/init.h>
#include <zephyr/device.h>
#include <zephyr/drivers/sensor.h>
#include <zephyr/pm/device.h>

static int disable_lis2dh(void)
{
	const struct device *const sensor = DEVICE_DT_GET_ANY(st_lis2dh);

	int err;

	if (sensor != NULL && device_is_ready(sensor)) {
		err = pm_device_action_run(sensor, PM_DEVICE_ACTION_SUSPEND);

		if (err < 0) {
			printf("lis2dh suspend failed: %d\n", err);
		}
	} else {
		printk("lis2dh sensor issue, cannot power down\n");
	}

	return 0;
}

SYS_INIT(disable_lis2dh, APPLICATION, CONFIG_APPLICATION_INIT_PRIORITY);
