Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5D6C48BC4
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Feb 2024 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muEvLhRWQJZyV+8kX9/gN6nWdnL421os/aVlqS+LsLU=; b=ICG+brxjY6YjpE
	9Tjl9yZoX4cd94yPAOg8HbEfYu3U5RYWC1NP5QrRbl2/mxoqYuOmio0GqtaHEv3uk11+fYxLy0eyI
	egr0OTHcGwVmJMCDp2N3Jk77Jx+NZjYoMU2dcApxi2oSddG9UwF59r/5n5SJ2TV921fV0l1Tpx0iL
	jvH/f0MLDbrqtWf1jb+BHM6OUd9ILi0ZotNtPxcDdVgjauwnylo0rpoK6A5Qcz1dKxQSBFP7Dyk5f
	uMy4JBrt57j5dwh8lhQzSXu9YJLKpE2FHsywjosxhuO7dKM2T9aPYD8XARLxPYBWuI7jOGUdFGJ8M
	9YuWNypRoMdtSDzgDqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLDS-00000005mlw-42Th;
	Sat, 17 Feb 2024 13:58:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbLDQ-00000005mkN-3xmf
	for linux-i3c@lists.infradead.org;
	Sat, 17 Feb 2024 13:58:54 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so4374732a12.1
        for <linux-i3c@lists.infradead.org>; Sat, 17 Feb 2024 05:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708178331; x=1708783131; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQTzDAH2s2TOWjrgdwdmeP0d2+alI9pX57Ee92xdM60=;
        b=fY94/PGFkjcg+ndg4tGsYbaJx9oOCzdReWvJiZBDnl+zuelSraqObiwGPFzzB7Dv/6
         wGcAbTe/0QQNalvgvq+hWydU9gNGtHG0MBxwXUh5Zt99M80B4CedP+7WG1FIDEw9OzTH
         V2nZUQ+c8mUeUOtmAEd3qMT9JaES3nUruM5mJL96RIc0EAWqAFq5cacCzDpfZuRK5wg3
         7NsHgG60TKSBsxFB7g4T9bICXju73Jogz/kisMOEwhq48w/fXuS5LOthBn+1WBsP5lcv
         mEkxIfFVcf6PowRAZevAipggqkyPBa8kaYuzruMMqLwdab1/fmpC3ppqosw2izt9J578
         VJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708178331; x=1708783131;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FQTzDAH2s2TOWjrgdwdmeP0d2+alI9pX57Ee92xdM60=;
        b=VwWjWCqIWMtW4MS6OXCGfVsVZ5RJwdAoqs0vDbFq7yvT527NePs+7gaR+CVCEN4kKf
         By1uehle13z+eA3ALhc2j9NNUfzxlWMVE2tAnxKxNlCezgS9NJrX5XHITq601FjjvBoE
         5TguJvi5sI/31UEkuHtkwdTmX5hTF5K5BewthoGpCt4z6hDU15d/RCP6N0uFENnm7z8g
         CvSlJhgA8HxASwjq/H9IegOkh4aTAuRMSoMzzJaJgrYbrmcEBPJXsDqXnI1IdrAvvaCO
         Ud4zquY8sYZw4e0/Rfju98ShJFUI3cMJuL59mQceSMZHIuLMC8am1St4jb+w+v2Yfl0L
         CBQw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgoM3aVRm6Ej3/6JToc6p5RPrUzvnpdPkJxEjrfCCrlIJ51pbJw21yuOvEQcTOZg9kYKtB9e9arCdyGb/EOhJLqcNILOnQgB9+D3Bmg==
X-Gm-Message-State: AOJu0YyL3MAMFONauXc3yD4pq9YFIIq/WZQGvc5SnyM8W2BL63t1ozOY
	ymPubNGfdrmzLq3BLDJMajg7wyWVfWevxijahLrmaBKLar3up6y1ITzwImeXpYA=
X-Google-Smtp-Source: AGHT+IE6TE7FkR861V4jgJweCw5NuGOOxA1KNRQlovILUZiSxktTVZnCjQFSUH4K2w9hASF75AGZ1w==
X-Received: by 2002:aa7:c346:0:b0:561:2fd1:99e4 with SMTP id j6-20020aa7c346000000b005612fd199e4mr5161939edr.26.1708178331327;
        Sat, 17 Feb 2024 05:58:51 -0800 (PST)
Received: from [192.168.0.22] ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id ec11-20020a0564020d4b00b005643f110e66sm71005edb.16.2024.02.17.05.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 05:58:50 -0800 (PST)
Message-ID: <e4daf637-131e-432d-a0cc-548351e8525d@linaro.org>
Date: Sat, 17 Feb 2024 14:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i3c: i3c-hub: Add Renesas RG3MxxB12A1 I3C HUB driver
Content-Language: en-US
To: Steven Niu <steven.niu.uj@renesas.com>, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Cc: zbigniew.lukwinski@linux.intel.com
References: <20240217131412.4145506-1-steven.niu.uj@renesas.com>
 <20240217131412.4145506-2-steven.niu.uj@renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240217131412.4145506-2-steven.niu.uj@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_055853_035258_5FE474B0 
X-CRM114-Status: GOOD (  27.03  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 17/02/2024 14:14, Steven Niu wrote:
>  endif # I3C
> diff --git a/drivers/i3c/Makefile b/drivers/i3c/Makefile
> index 11982efbc6d9..ca298faaee9a 100644
> --- a/drivers/i3c/Makefile
> +++ b/drivers/i3c/Makefile
> @@ -2,3 +2,4 @@
>  i3c-y				:= device.o master.o
>  obj-$(CONFIG_I3C)		+= i3c.o
>  obj-$(CONFIG_I3C)		+= master/
> +obj-$(CONFIG_I3C_HUB)	+= i3c-hub.o
> diff --git a/drivers/i3c/i3c-hub.c b/drivers/i3c/i3c-hub.c
> new file mode 100644
> index 000000000000..73a9b96e6635
> --- /dev/null
> +++ b/drivers/i3c/i3c-hub.c
> @@ -0,0 +1,1982 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright (C) 2021 - 2023 Intel Corporation.*/


So this explains the code... You push to us some vendor stuff with
bindings not up to any upstream style. Please clean the bindings first
so they look like other bindings.


> +
> +static int read_backend_from_i3c_hub_dts(struct device_node *i3c_node_target,
> +					 struct i3c_hub *priv)
> +{
> +	struct device_node *i3c_node_tp;

Your coding style is terrible. device_node are called np or node.

> +	const char *compatible;
> +	int tp_port, ret;
> +	u32 addr_dts;
> +	struct smbus_backend *backend;
> +
> +	if (sscanf(i3c_node_target->full_name, "target-port@%d", &tp_port) == 0)
> +		return -EINVAL;
> +
> +	if (tp_port > I3C_HUB_TP_MAX_COUNT)
> +		return -ERANGE;
> +
> +	if (tp_port < 0)
> +		return -EINVAL;
> +
> +	INIT_LIST_HEAD(&priv->logical_bus[tp_port].smbus_port_adapter.backend_entry);
> +	for_each_available_child_of_node(i3c_node_target, i3c_node_tp) {
> +		if (strcmp(i3c_node_tp->name, "backend"))

No, don't compare names. What for?

> +			continue;
> +
> +		ret = of_property_read_u32(i3c_node_tp, "target-reg", &addr_dts);
> +		if (ret)
> +			return ret;
> +
> +		if (backend_node_is_exist(tp_port, priv, addr_dts))
> +			continue;
> +
> +		ret = of_property_read_string(i3c_node_tp, "compatible", &compatible);
> +		if (ret)
> +			return ret;
> +
> +		/* Currently only the slave-mqueue backend is supported */
> +		if (strcmp("slave-mqueue", compatible))

NAK, undocumented compatible.

> +			return -EINVAL;
> +
> +		backend = kzalloc(sizeof(*backend), GFP_KERNEL);
> +		if (!backend)
> +			return -ENOMEM;
> +
> +		backend->addr = addr_dts;
> +		backend->compatible = compatible;
> +		list_add(&backend->list,
> +			 &priv->logical_bus[tp_port].smbus_port_adapter.backend_entry);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * This function saves information about the i3c_hub's ports
> + * working in slave mode. It takes its data from the DTs
> + * (aspeed-bmc-intel-avc.dts) and saves the parameters
> + * into the coresponding target port i2c_adapter_group structure
> + * in the i3c_hub
> + *
> + * @dev: device used by i3c_hub
> + * @i3c_node_hub: device node pointing to the hub
> + * @priv: pointer to the i3c_hub structure
> + */
> +static void i3c_hub_parse_dt_tp(struct device *dev,
> +				const struct device_node *i3c_node_hub,
> +				struct i3c_hub *priv)
> +{
> +	struct device_node *i3c_node_target;
> +	int ret;
> +
> +	for_each_available_child_of_node(i3c_node_hub, i3c_node_target) {
> +		if (!strcmp(i3c_node_target->name, "target-port")) {
> +			ret = read_backend_from_i3c_hub_dts(i3c_node_target, priv);
> +			if (ret)
> +				dev_err(dev, "DTS entry invalid - error %d", ret);
> +		}
> +	}
> +}
> +
> +static int i3c_hub_probe(struct i3c_device *i3cdev)
> +{
> +	struct regmap_config i3c_hub_regmap_config = {
> +		.reg_bits = 8,
> +		.val_bits = 8,
> +	};
> +	struct device *dev = &i3cdev->dev;
> +	struct device_node *node = NULL;
> +	struct regmap *regmap;
> +	struct i3c_hub *priv;
> +	char hub_id[32];
> +	int ret;
> +	int i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->i3cdev = i3cdev;
> +	priv->driving_master = i3c_dev_get_master(i3cdev->desc);
> +	i3cdev_set_drvdata(i3cdev, priv);
> +	INIT_DELAYED_WORK(&priv->delayed_work, i3c_hub_delayed_work);
> +	sprintf(hub_id, "i3c-hub-%d-%llx", i3c_dev_get_master(i3cdev->desc)->bus.id,
> +		i3cdev->desc->info.pid);
> +	ret = i3c_hub_debugfs_init(priv, hub_id);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialized DebugFS.\n");

Drop, you cannot fail probe on debugfs.

> +
> +	i3c_hub_of_default_configuration(dev);
> +
> +	regmap = devm_regmap_init_i3c(i3cdev, &i3c_hub_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "Failed to register I3C HUB regmap\n");
> +		goto error;
> +	}
> +	priv->regmap = regmap;
> +
> +	ret = i3c_hub_read_id(dev);
> +	if (ret)
> +		goto error;
> +
> +	priv->hub_dt_sel_id = -1;
> +	priv->hub_dt_cp1_id = -1;
> +	if (priv->hub_pin_cp1_id >= 0 && priv->hub_pin_sel_id >= 0)
> +		/* Find hub node in DT matching HW ID or just first without ID provided in DT */
> +		node = i3c_hub_get_dt_hub_node(dev->parent->of_node, priv);
> +
> +	if (!node) {
> +		dev_info(dev, "No DT entry - running with hardware defaults.\n");
> +	} else {
> +		of_node_get(node);
> +		i3c_hub_of_get_conf_static(dev, node);
> +		i3c_hub_of_get_conf_runtime(dev, node);
> +		of_node_put(node);
> +
> +		/* Parse DTS to find data on the SMBus target mode */
> +		i3c_hub_parse_dt_tp(dev, node, priv);
> +	}
> +
> +	/* Unlock access to protected registers */
> +	ret = regmap_write(priv->regmap, I3C_HUB_PROTECTION_CODE, REGISTERS_UNLOCK_CODE);
> +	if (ret) {
> +		dev_err(dev, "Failed to unlock HUB's protected registers\n");
> +		goto error;
> +	}
> +
> +	/* Register logic for native smbus ports */
> +	for (i = 0; i < I3C_HUB_TP_MAX_COUNT; i++) {
> +		priv->logical_bus[i].smbus_port_adapter.used = 0;
> +		if (priv->settings.tp[i].mode == I3C_HUB_DT_TP_MODE_SMBUS)
> +			ret = i3c_hub_smbus_tp_algo(priv, i);
> +	}
> +
> +	ret = i3c_hub_configure_hw(dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to configure the HUB\n");
> +		goto error;
> +	}
> +
> +	/* Lock access to protected registers */
> +	ret = regmap_write(priv->regmap, I3C_HUB_PROTECTION_CODE, REGISTERS_LOCK_CODE);
> +	if (ret) {
> +		dev_err(dev, "Failed to lock HUB's protected registers\n");
> +		goto error;
> +	}
> +
> +	/* TBD: Apply special/security lock here using DEV_CMD register */
> +
> +	schedule_delayed_work(&priv->delayed_work, msecs_to_jiffies(100));
> +
> +	return 0;
> +
> +error:
> +	debugfs_remove_recursive(priv->debug_dir);
> +	return ret;
> +}
> +
> +static void i3c_hub_remove(struct i3c_device *i3cdev)
> +{
> +	struct i3c_hub *priv = i3cdev_get_drvdata(i3cdev);
> +	struct i2c_adapter_group *g_adap;
> +	struct smbus_backend *backend = NULL;
> +	int i;
> +
> +	for (i = 0; i < I3C_HUB_TP_MAX_COUNT; i++) {
> +		if (priv->logical_bus[i].smbus_port_adapter.used) {
> +			g_adap = &priv->logical_bus[i].smbus_port_adapter;
> +			cancel_delayed_work_sync(&g_adap->delayed_work_polling);
> +			list_for_each_entry(backend,  &g_adap->backend_entry, list) {
> +				i2c_unregister_device(backend->client);
> +				kfree(backend);
> +			}
> +		}
> +
> +		if (priv->logical_bus[i].smbus_port_adapter.used ||
> +		    priv->logical_bus[i].registered)
> +			i3c_master_unregister(&priv->logical_bus[i].controller);
> +	}
> +
> +	cancel_delayed_work_sync(&priv->delayed_work);
> +	debugfs_remove_recursive(priv->debug_dir);
> +}
> +
> +static struct i3c_driver i3c_hub = {
> +	.driver.name = "i3c-hub",
> +	.id_table = i3c_hub_ids,
> +	.probe = i3c_hub_probe,
> +	.remove = i3c_hub_remove,
> +};
> +
> +module_i3c_driver(i3c_hub);
> +
> +MODULE_AUTHOR("Zbigniew Lukwinski <zbigniew.lukwinski@linux.intel.com>");
> +MODULE_AUTHOR("Steven Niu <steven.niu.uj@renesas.com>");
> +MODULE_DESCRIPTION("I3C HUB driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 3afa530c5e32..b7cf15ba4e67 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2244,15 +2244,26 @@ static int of_populate_i3c_bus(struct i3c_master_controller *master)
>  	struct device_node *node;
>  	int ret;
>  	u32 val;
> +	bool ignore_hub_node = false;
> +	char *addr_pid;
>  
>  	if (!i3cbus_np)
>  		return 0;
>  
>  	for_each_available_child_of_node(i3cbus_np, node) {
> -		ret = of_i3c_master_add_dev(master, node);
> -		if (ret) {
> -			of_node_put(node);
> -			return ret;
> +		ignore_hub_node = false;
> +		if (node->full_name && strstr(node->full_name, "hub")) {

NAK, you cannot rely on node name. Node name can be whatever, not "hub".

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
