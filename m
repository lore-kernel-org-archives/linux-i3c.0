Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF53D132D3
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Nov 2024 14:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNOijc35Fj5uMqpa4EqHyhVnG0gcq3u8X4bc3vDCGFU=; b=tozg7jAYBlQpSy
	4kJOrfERBruo+RoJX3zBwwmdxVdeMdT0Al0IIYCnK103qxB8bEYcmNbNcXb3OK9lpb1Zah/AFY8c/
	Tj9B2CB71CqWG2zj1bDk5kxkBMWYQbSLu/r0en7YY9jt9SHltT9R2QT0/gbCVFetgfksaQ+TrLITL
	6PoVTc5jDiHPmwrYCgqo+r9ERvELp2Fyon9CePJzSsTnXAU0RAwwQ2C6gdobdgeu9qPR/xImYTK+A
	sRiwB8Klf01HO/ZdWkEortFhAk4oXOec3SwUf2pN8iPjvYX8rkLz2yxv78zr9YDkKti378Vo7Esnm
	pAy++epWGd5nejcC8Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yAH-0000000E415-0lLX;
	Mon, 04 Nov 2024 14:34:45 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xj0-0000000DzDB-0yi4
	for linux-i3c@lists.infradead.org;
	Mon, 04 Nov 2024 14:06:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730729194; x=1762265194;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VXAcHtL5x5ge/VyyxMeQg5COdO2jV9c/IRLXzuvE+c8=;
  b=ZPV3Pd701/mCvFRmo58lkGlnPPDOWi0GcpBSVBZBFo+Wlw/AYm8hiEY+
   VP6Tsu3OtPCYSgbGKsnM4DJ5jxUoroaSnkC1Zk45wZDUC5k9x697ORywk
   R8IvjQpAGspmP7t+hX3dbGh4L2py1ftR/P0GhR2JoWZr86KVtrjEillP0
   igU1PrOLpGDdS8SEEZq/7aX2YkxqQIS1wm+W6jUuoLivnpN3M9TGCtFUe
   awIaJ5HdKwfEtTwuDYH1j9DUbpySKsUNtyNhf2ZRwpbflpt1/euDX1xtH
   vDVp3glL1KlLvKTBpaQNjPN0IgMY28p4iqfcNq6IwpPRS9ydbtaUnpU22
   Q==;
X-CSE-ConnectionGUID: p6uSj611SGW0R0+k0GPTEQ==
X-CSE-MsgGUID: HVKUPH4UQUC95aPCfcsiIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33263932"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="33263932"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:06:32 -0800
X-CSE-ConnectionGUID: 4k40pCOPSUyyQkBY1mEzew==
X-CSE-MsgGUID: l5TnZGeFQBKZVeeSYLgNBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83775755"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP; 04 Nov 2024 06:06:30 -0800
Message-ID: <7cfc1f2a-cb4a-4ddc-af0a-df7793ad4487@linux.intel.com>
Date: Mon, 4 Nov 2024 16:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] i3c: master: Add ACPI support to i3c subsystem
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
 <20241023055118.1400286-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241023055118.1400286-4-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_060634_855192_9537714A 
X-CRM114-Status: GOOD (  30.46  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi

+ linux-acpi

On 10/23/24 8:51 AM, Shyam Sundar S K wrote:
> As of now, the I3C subsystem only has ARM-specific initialization, and
> there is no corresponding ACPI plumbing present. To address this, ACPI
> support needs to be added to both the I3C core and DW driver.
> 
> Add support to get the ACPI handle from the _HID probed and parse the apci
> object to retrieve the slave information from BIOS.
> 
> Based on the acpi object information propogated via BIOS, build the i3c
> board information so that the same information can be used across the
> driver to handle the slave requests.
> 
I think it would be good to have a DSDT example here?

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/internals.h            |  2 +
>   drivers/i3c/master.c               | 84 ++++++++++++++++++++++++++++++
>   drivers/i3c/master/dw-i3c-master.c |  7 +++
>   include/linux/i3c/master.h         |  1 +
>   4 files changed, 94 insertions(+)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7ce..d2d6c69b19dd 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -10,6 +10,8 @@
>   
>   #include <linux/i3c/master.h>
>   
> +#define AMD_I3C_GET_SLAVE_ADDR		0x30
> +
>   void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>   void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>   
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6f3eb710a75d..7d23c32e1c0f 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2251,6 +2251,84 @@ static int of_i3c_master_add_dev(struct i3c_master_controller *master,
>   	return ret;
>   }
>   
> +#if IS_ENABLED(CONFIG_ACPI)
> +static int i3c_acpi_configure_master(struct i3c_master_controller *master)
> +{
> +	struct acpi_buffer buf = {ACPI_ALLOCATE_BUFFER, NULL};
> +	enum i3c_addr_slot_status addrstatus;
> +	struct i3c_dev_boardinfo *boardinfo;
> +	struct device *dev = &master->dev;
> +	struct fwnode_handle *fwnode;
> +	struct acpi_device *adev;
> +	u32 slv_addr, num_dev;
> +	acpi_status status;
> +	u64 val;
> +
> +	status = acpi_evaluate_object_typed(master->ahandle, "_DSD", NULL, &buf, ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&master->dev, "Error reading _DSD:%s\n", acpi_format_exception(status));
> +		return -ENODEV;
> +	}
> +
> +	num_dev = device_get_child_node_count(dev);
> +	if (!num_dev) {
> +		dev_err(&master->dev, "Error: no child node present\n");
> +		return -EINVAL;
> +	}
> +
> +	device_for_each_child_node(dev, fwnode) {
> +		adev = to_acpi_device_node(fwnode);
> +		if (!adev)
> +			return -ENODEV;
> +
> +		status = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &val);
> +		if (ACPI_FAILURE(status)) {
> +			dev_err(&master->dev, "Error: eval _ADR failed\n");
> +			return -EINVAL;
> +		}
> +		slv_addr = val >> AMD_I3C_GET_SLAVE_ADDR;

This doesn't seem to match with ACPI 6.5 spec [1] chapter 6.1.1 _ADR 
(Address)? Address encoding for I3C says:

Bits [63:52] - Reserved
Bits [51:48] - Master Instance
Bits [47:0] - I3C Device Provisional ID, following encoding defined in 
the MIPI
Specification for I3C.
If an I3C device supports a static address instead of a Provisional ID, 
then bits
[47:7] are Reserved (zero), and bits [6:0] are the 7-bit static address.

1. https://uefi.org/sites/default/files/resources/ACPI_Spec_6_5_Aug29.pdf

> +
> +		boardinfo = devm_kzalloc(dev, sizeof(*boardinfo), GFP_KERNEL);
> +		if (!boardinfo)
> +			return -ENOMEM;
> +
> +		if (slv_addr) {
> +			if (slv_addr > I3C_MAX_ADDR)
> +				return -EINVAL;
> +
> +			addrstatus = i3c_bus_get_addr_slot_status(&master->bus, slv_addr);
> +			if (addrstatus != I3C_ADDR_SLOT_FREE)
> +				return -EINVAL;
> +		}
> +
> +		boardinfo->static_addr = slv_addr;
> +		if (boardinfo->static_addr > I3C_MAX_ADDR)
> +			return -EINVAL;
> +
> +		addrstatus = i3c_bus_get_addr_slot_status(&master->bus,	boardinfo->static_addr);
> +		if (addrstatus != I3C_ADDR_SLOT_FREE)
> +			return -EINVAL;
> +
> +		boardinfo->pid = (val & GENMASK(47, 0));
> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +
> +		/*
> +		 * According to the specification, SETDASA is not supported for DIMM slaves
> +		 * during device discovery. Therefore, AMD BIOS will populate same initial
> +		 * dynamic address as the static address.
> +		 */
> +		boardinfo->init_dyn_addr = boardinfo->static_addr;
> +		list_add_tail(&boardinfo->node, &master->boardinfo.i3c);
> +	}
> +
> +	return 0;
> +}
> +#else
> +static int i3c_acpi_configure_master(struct i3c_master_controller *master) { return 0; }
> +#endif
> +
>   static int of_populate_i3c_bus(struct i3c_master_controller *master)
>   {
>   	struct device *dev = &master->dev;
> @@ -2771,6 +2849,12 @@ int i3c_master_register(struct i3c_master_controller *master,
>   	master->dev.coherent_dma_mask = parent->coherent_dma_mask;
>   	master->dev.dma_parms = parent->dma_parms;
>   
> +	if (has_acpi_companion(master->dev.parent)) {
> +		ret = i3c_acpi_configure_master(master);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	ret = of_populate_i3c_bus(master);
>   	if (ret)
>   		goto err_put_dev;
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index fd58a95ae1c3..f683e2a398ad 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1602,6 +1602,13 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>   	master->maxdevs = ret >> 16;
>   	master->free_pos = GENMASK(master->maxdevs - 1, 0);
>   
> +#if IS_ENABLED(CONFIG_ACPI)
> +	ACPI_COMPANION_SET(&master->base.dev, ACPI_COMPANION(&pdev->dev));
> +	master->base.ahandle = acpi_device_handle(ACPI_COMPANION(&pdev->dev));
> +	if (!master->base.ahandle)
> +		dev_err(&pdev->dev, "Failed to get acpi device handle\n");
> +#endif
> +
>   	INIT_WORK(&master->hj_work, dw_i3c_hj_work);
>   	ret = i3c_master_register(&master->base, &pdev->dev,
>   				  &dw_mipi_i3c_ops, false);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 2a1ed05d5782..367faf7c4bf3 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -523,6 +523,7 @@ struct i3c_master_controller {
>   	} boardinfo;
>   	struct i3c_bus bus;
>   	struct workqueue_struct *wq;
> +	acpi_handle ahandle;
>   };
>   
>   /**


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
