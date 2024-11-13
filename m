Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7171FD41C2A
	for <linux-i3c@archiver.kernel.org>; Wed, 13 Nov 2024 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TiZkHQeVvPkw/8guDjI5i4VDbAn+rYzTRKWDcMSFYz0=; b=ZIq5gxFmST2wjN
	hPRt9hp+kyFumXdrce3g8riaWQ8ulc4YzAdngCnruGRaTE41UEA1gJfwmxQtx82Ren5saTDSd6I8m
	exA0ZAoIARkcxfSkiKsQXhbM160HHPv5qIVdu/94tJEE0IgMHseTK/GK54qjeTlvNRpcIy3m7+1wM
	aEkcaQQzgBIGOmTUDoCYN6Y47h8iD5sUcFvyz/QKGTYWPBz2R9/LN1+O6ioe/jUq67yd6hQyFtR7k
	B6AVMe/viQzkYaWHZ5pm7C8IkFfrPViI0Wioo+YxiblWUAU6FNcZZHFEj/2i7gYznRkiixjPhoBCH
	5BdLUDiaHI+RVw7yfrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBA2e-00000006J92-0WRj;
	Wed, 13 Nov 2024 09:52:04 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9td-00000006Gxz-1pJE
	for linux-i3c@lists.infradead.org;
	Wed, 13 Nov 2024 09:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731490965; x=1763026965;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=CnTg97obo1Lsr06BXYdZdsStwzIsiBw+tlILjkvdR+U=;
  b=WnYBbn3JREPgm3n7im0EyTp2LuAY4jg3/VlhrYEhxPxvjYuJbUC+86jW
   gFFuAqv4TLbYRAKsi0e9+y0fTsdKBiLhu5Ig9ipQqDSH4mKgCGGm35skI
   c5ehiGNdyuFamQsTH15GdgmEY8l8SwTe0rdkWahN52a1N6d1mRkwSYOyi
   IhT/Dqt+L/Y2o8bc4BQ65BRsmUZpG04o0Hw/bhedrvANlqoSfyXDjqWfo
   krWBi9R5jSztjHUPL7X3O9/3KM87urRKvyg3wN2V8yL4s35exUqbY50SP
   tM3svzlcgctdUu3ruxIucNvHawY/TCk0bjdy3AclOWgliLe/3Qxvi2pCU
   g==;
X-CSE-ConnectionGUID: h+6iiNUhSm2qfuHR/zxxlw==
X-CSE-MsgGUID: 2qjp7Bn9QKihuOD6eVlyiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31229448"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31229448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 01:42:36 -0800
X-CSE-ConnectionGUID: ZJXmawWEQXSXDgxWFRqoHg==
X-CSE-MsgGUID: 7sstyEgHRHO20zrSlRz5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92751496"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2024 01:42:35 -0800
Message-ID: <1ad5f698-725a-4779-ad5d-936ae8cbab14@linux.intel.com>
Date: Wed, 13 Nov 2024 11:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] i3c: master: Add ACPI support to i3c subsystem
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
References: <20241108073323.523805-1-Shyam-sundar.S-k@amd.com>
 <20241108073323.523805-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241108073323.523805-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_014245_569073_A7629F74 
X-CRM114-Status: GOOD (  19.52  )
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

On 11/8/24 9:33 AM, Shyam Sundar S K wrote:
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
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
> Cc: linux-acpi@vger.kernel.org
> 
>   drivers/i3c/internals.h            |  3 ++
>   drivers/i3c/master.c               | 84 ++++++++++++++++++++++++++++++
>   drivers/i3c/master/dw-i3c-master.c |  7 +++
>   include/linux/i3c/master.h         |  1 +
>   4 files changed, 95 insertions(+)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7ce..178bc0ebe6b6 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -10,6 +10,9 @@
>   
>   #include <linux/i3c/master.h>
>   
> +#define I3C_GET_PID		0x08
> +#define I3C_GET_ADDR		0x7F
> +
>   void i3c_bus_normaluse_lock(struct i3c_bus *bus);
>   void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
>   
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 6f3eb710a75d..0ceef2aa9161 100644
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
I didn't notice earlier these cause host controller registration to fail 
and thus regression on platforms where DSDT doesn't have these optional 
information for the host controller.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
