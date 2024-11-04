Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B6BBD132DE
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Nov 2024 15:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sjak4gfDzInE3YHRZwS7BiEQaGcTXvrRMYXe0+uT7z8=; b=sPN2k5CDm/9pum
	5G++RvmShbmyznoQLbRcSThlDJPJoA9qgkAcGnnC4dIZFs8Wr1z1WK6q+mswJmVixtZsKhw+Y7h+l
	tE8tPEn5hI7EFRFkDUIAHazGrOJ65boYLlLd0UUN3SzyAX/TaRU7ha45n43+95b+ChWYJd23YRjAC
	tsRS1igL1V+Jyp/FgX9w+bJt8ywmBOiC1azMSjqyBvp1pxGpHhij7LchNt2k6dv9mi8hs33b1/ye2
	COZTh75IRan953qpi1O7E22zIcUxnvz0DNnqWLfT8B94xqmVaS1idrmJsZuEqOoBLAlLUoRSRE83V
	esPasJxrdTougQkDmJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yd9-0000000E9Bd-38jx;
	Mon, 04 Nov 2024 15:04:35 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yZZ-0000000E8jL-32oX
	for linux-i3c@lists.infradead.org;
	Mon, 04 Nov 2024 15:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730732454; x=1762268454;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6CwdJQ+w8zHSNyvm3QdjuWgxa1oGhK+8wtCuWv4RDc0=;
  b=RcUcCydQ+MCqJucmDWz47JsWOFtcIV7tNumItNIHBv/irtiHD1KwjrMf
   JKcFE2qUKD2xKpHmy4Wpd4Q+JkqAUqdV5aapKfHSnuSGffwq6wyruADLr
   kmadnyXwKVvSC5VDM/wP6TD6oLIZUEdHi+OwIbBv2GeeJcNeR02Q1+HbP
   7CILrz5vCllzYQLOHYaLblWaCx6YnaLdCGfF8lgN9rXDEjAzh+jfiyUD7
   YOJa9xIa5rcJpG447EoYXJ4ZY9xknD9e4kxSf90gRb86jhgyW0erpsxfF
   xBaPjYSa7MyixCstFrk2OjkduDFO4geaP0UXos2zQTYLpDSGctmdvIq1u
   A==;
X-CSE-ConnectionGUID: lYe1LWu7Qk+6OM3MRPbV5Q==
X-CSE-MsgGUID: WWcpv1lMRoin0gfx4Eo7mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30285314"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30285314"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 07:00:53 -0800
X-CSE-ConnectionGUID: rs+2s/WbT/6R8OdFFhV8OA==
X-CSE-MsgGUID: URAQmgMyRIGeqZBM7vZ93Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83200205"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP; 04 Nov 2024 07:00:51 -0800
Message-ID: <583c5381-11fe-4fc0-83b4-512c2aae50bd@linux.intel.com>
Date: Mon, 4 Nov 2024 17:00:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] i3c: master: Add support for SETAASA CCC
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
 <20241023055118.1400286-6-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241023055118.1400286-6-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_070053_847869_C63E41D9 
X-CRM114-Status: GOOD (  23.24  )
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

On 10/23/24 8:51 AM, Shyam Sundar S K wrote:
> I3C devices like DIMMs over SPD use SETAASA for bus discovery instead of
> SETDASA. Add a new routine for I3C host controller drivers to use. If the
> I3C slave on the bus is an SPD device, skip the regular DAA process.
> 
> According to the SPD spec[1], use SETAASA for bus discovery, and avoid
> sending RSTDAA and DISEC, as they are considered illegal. Skip this entire
> process if the slave is SPD-compliant, as indicated by the "jdec_spd" flag
> from the BIOS.
> 
> [1] https://www.jedec.org/system/files/docs/JESD300-5B.01.pdf
> (section 2.4 and 2.6.3)
> 
SETAASA seems to come in MIPI v1.1.1 specification. I think worth to 
mention in commit log.

> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master.c               | 32 +++++++++++++++++++++++++++++-
>   drivers/i3c/master/dw-i3c-master.c |  1 +
>   include/linux/i3c/ccc.h            |  1 +
>   include/linux/i3c/master.h         |  1 +
>   4 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index ba6f17cb8aa6..1596efd6d82a 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -1657,6 +1657,21 @@ i3c_master_register_new_i3c_devs(struct i3c_master_controller *master)
>   	}
>   }
>   
> +static int i3c_master_setaasa_locked(struct i3c_master_controller *master)
> +{
> +	struct i3c_ccc_cmd_dest dest;
> +	struct i3c_ccc_cmd cmd;
> +	int ret;
> +
> +	i3c_ccc_cmd_dest_init(&dest, I3C_BROADCAST_ADDR, 0);
> +	i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETAASA, &dest, 1);
> +
> +	ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
> +	i3c_ccc_cmd_dest_cleanup(&dest);
> +
> +	return ret;
> +}
> +
>   static int i3c_master_add_spd_dev(struct i3c_master_controller *master,
>   				  struct i3c_dev_boardinfo *boardinfo)
>   {
> @@ -1684,6 +1699,10 @@ static int i3c_master_add_spd_dev(struct i3c_master_controller *master,
>   		i3cdev->info.pid = i3cdev->boardinfo->pid;
>   		i3cdev->info.dyn_addr = i3cdev->boardinfo->init_dyn_addr;
>   
> +		ret = i3c_master_setaasa_locked(master);
> +		if (ret)
> +			goto err_free_dev;
> +
>   		i3c_bus_normaluse_lock(&master->bus);
>   		i3c_master_register_new_i3c_devs(master);
>   		i3c_bus_normaluse_unlock(&master->bus);
> @@ -1907,7 +1926,14 @@ static int i3c_master_bus_init(struct i3c_master_controller *master)
>   		goto err_bus_cleanup;
>   	}
>   
> -	i3c_master_add_spd_dev(master, i3cboardinfo);
> +	/*
> +	 * If the I3C slave on the bus is SPD device, then do not follow the regular
> +	 * DAA process. Also, as per SPD spec SETAASA is required for the bus discovery
> +	 * and sending RSTDAA and DISEC is considered as illegal. So skip the entire process
> +	 * if the jdec_spd flag has been identified from the BIOS.
> +	 */
> +	if (master->jdec_spd)
> +		return i3c_master_add_spd_dev(master, i3cboardinfo);
>   
>   	if (master->ops->set_speed) {
>   		ret = master->ops->set_speed(master, I3C_OPEN_DRAIN_SLOW_SPEED);
> @@ -2311,6 +2337,10 @@ static int i3c_acpi_configure_master(struct i3c_master_controller *master)
>   		return -ENODEV;
>   	}
>   
> +	status = acpi_evaluate_object(master->ahandle, "_STR", NULL, NULL);
> +	if (ACPI_SUCCESS(status))
> +		master->jdec_spd = true;
> +

Am I right "_STR" object should carry a string "jdec_spd"? But this code 
is not actually checking it, only the existence of _STR?

>   	num_dev = device_get_child_node_count(dev);
>   	if (!num_dev) {
>   		dev_err(&master->dev, "Error: no child node present\n");
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index f683e2a398ad..90a43209e55e 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -282,6 +282,7 @@ static bool dw_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
>   	case I3C_CCC_GETSTATUS:
>   	case I3C_CCC_GETMXDS:
>   	case I3C_CCC_GETHDRCAP:
> +	case I3C_CCC_SETAASA:
>   		return true;
>   	default:
>   		return false;
> diff --git a/include/linux/i3c/ccc.h b/include/linux/i3c/ccc.h
> index ad59a4ae60d1..a145d766ab6f 100644
> --- a/include/linux/i3c/ccc.h
> +++ b/include/linux/i3c/ccc.h
> @@ -32,6 +32,7 @@
>   #define I3C_CCC_DEFSLVS			I3C_CCC_ID(0x8, true)
>   #define I3C_CCC_ENTTM			I3C_CCC_ID(0xb, true)
>   #define I3C_CCC_ENTHDR(x)		I3C_CCC_ID(0x20 + (x), true)
> +#define I3C_CCC_SETAASA			I3C_CCC_ID(0x29, true)
>   
>   /* Unicast-only commands */
>   #define I3C_CCC_SETDASA			I3C_CCC_ID(0x7, false)
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 367faf7c4bf3..cd8390d8b469 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -516,6 +516,7 @@ struct i3c_master_controller {
>   	const struct i3c_master_controller_ops *ops;
>   	unsigned int secondary : 1;
>   	unsigned int init_done : 1;
> +	unsigned int jdec_spd : 1;
>   	unsigned int hotjoin: 1;
>   	struct {
>   		struct list_head i3c;


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
