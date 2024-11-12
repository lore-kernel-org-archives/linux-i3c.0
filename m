Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F6BD42B97
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2024 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IbPAsvfyL5eVDDUp5GnukyknLauHYbXQsosn2b79uLM=; b=3WlxWRd1EUGnF5
	G8243IVjWp62B4n191x33tdRvgIeL4V576qyOA0Cl5yVMzoo9wxPLY0tgNMSUZAE1ZiY85g3d8BA4
	M27P5wMSxiRqBhS072bPoX2xABELn6GtDaOVXgbW9eA6WJOdMziM6thkNy+H9ptezgymaWG1FB/JM
	ZT2XXioTeYG8686dIVuzB13JSvzuX1nca7YUk8zT3kWi7iS17v7zGY/3fkzSj/34ijRquJhN2aYKS
	fRvnzFeCy3vV/HuUSW1pS18yOcZok+tdmFeKZwaCa4JgaSsH49iYncCSbqpHZW62CACaEwGbwcNTS
	K4ACpjXOr23TFSGNmhyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsek-00000003vls-1lCg;
	Tue, 12 Nov 2024 15:18:14 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAseL-00000003vgg-1aJ6
	for linux-i3c@lists.infradead.org;
	Tue, 12 Nov 2024 15:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731424669; x=1762960669;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Iuhdp4YW1PKIzpegGZtWZUYGQeghO6KfqFIt7ql1ZwA=;
  b=mipeAKaign9nLLb/O06stUYsnTk74XL6mLLBm61UdPqeXBzUO6F6v2Cb
   Zu0nZ/NwtRts8O05d2oyuXT6CvtQzo2NCIzEPRf02AX8OyFCTfVRqOmTZ
   unS77HET1JGOEUz0YgJwa2Lsed9V3MubaXzHdRXY9R09LIHegqn3KWLY1
   pBlJVAk5KblVGiG51IQ0HDvi6X9HcSQYt4DuBmdJKALvGHbkGO+yOPXu+
   /yAGzwHB661fheMLibgAAUx+TIOqCmsRWC9uw/OVdP+izEvlps2PWmpq5
   /L8TxieZ9FdV23E37x4TWOKR+BYtEzbKWbn4vw2Z4UTYEC5semRH+rnFS
   Q==;
X-CSE-ConnectionGUID: ZQd63HDCSrurXK39GgwxOQ==
X-CSE-MsgGUID: s0JygcCQRNmnoajb5LnWpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="41891069"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="41891069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:17:45 -0800
X-CSE-ConnectionGUID: 5/1F43/yQlOFxHRxk7tXcg==
X-CSE-MsgGUID: L1NR3vMQSQeS+M+mDoFdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="87673925"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Nov 2024 07:17:43 -0800
Message-ID: <0e0f7ac2-d97d-41b3-9239-2daabe395d4a@linux.intel.com>
Date: Tue, 12 Nov 2024 17:17:42 +0200
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
X-CRM114-CacheID: sfid-20241112_071749_499600_A7E421C8 
X-CRM114-Status: GOOD (  26.76  )
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
To clarify: The DSDT example I mentioned in the previous version I meant 
it would be good to have in the patch/series itself. It helps both 
reviewing the patchset and future documentation.

First I was thinking commit log itself but I guess a full DSDT example 
showing SDP target devices becomes too large and e.g. 
Documentation/firmware-guide/acpi/enumeration.rst is better?

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

These are bit confusing. One could think these are commands while 
I3C_GET_PID is a shift and I3C_GET_ADDR is a mask in the code below.

Since these are actually defines for the ACPI _ADR I tried to find are 
there already similar defines in ACPI headers but could not find and 
e.g. drivers/ata/libata-acpi.c is interpreting itself so I guess it's ok 
to define here?

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
> +		slv_addr = val & I3C_GET_ADDR;
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

slv_addr/static_addr > I3C_MAX_ADDR test is needless due masking above.

> +		boardinfo->pid = val >> I3C_GET_PID;
> +		if ((boardinfo->pid & GENMASK_ULL(63, 48)) ||
> +		    I3C_PID_RND_LOWER_32BITS(boardinfo->pid))
> +			return -EINVAL;
> +

Bit shifting makes PID and also test incorrect?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
