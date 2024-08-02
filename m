Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA0FC52D6D
	for <linux-i3c@archiver.kernel.org>; Fri,  2 Aug 2024 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qnU/8OfbI7I9lLDm6Vc4Icc17hSOc4jV9F4g81UYQTk=; b=PIWiX4C8K/20QY
	sB5WSn/11QlFqRw+reh0hjmFY5/L03+qJ8YrTnUPZPl6MGk93vbJ2Sq2Ki5ZyA1R+xb6yobG8bv05
	sVJJV4pcrNxW08rQhb5SysrHX3wQ+7IT4P/hzjL/SmFoh/gblKWo4+HNl3a4SWA420RZAfqn9UaEd
	cd4/yKDVOipCTjAaYToNSHoF/JReEc0ATwylWwjYe/f9OCOSs6d+qjMWxS1FTp8KVEqCBjCiiwPHo
	piKfb+f6NJ8xy4NWgVhmLAuVNBrDudk2LwAuBiY8P4x83D5kW6lhCaiS0HXYQ7c2bw7X+qx1Oax/i
	9fg4zQ2Xb1nUvI9p++dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsnq-000000090eY-25B6;
	Fri, 02 Aug 2024 13:58:42 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZsnn-000000090e1-3JJU
	for linux-i3c@lists.infradead.org;
	Fri, 02 Aug 2024 13:58:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722607119; x=1754143119;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mj/1clMgFrEPI2KKj2APtQ4WLR9RYvT5ia/+L0lqI14=;
  b=MAxhAmyMTuzkPBkyz3Yt8f8NHZTXMLQCxktWdVujDBtoxioi26TR0Ckx
   AiaDPpHUH/ONtf/Z8RgQzZmY49UhgsSlvrftgj3wupYA3XFWEwCcw+5IM
   BBYFpSiLeJj/GeEFdDvuo+Op1uVE4SHBUSgvAjpGJIs3zEP1dwcOYeDti
   U2av5u2As5cAfYBYnMQZyQCodypb4kBxntFJ3fAJEIyeJMgip9DVM12lY
   6r9N8JY+LZ49p5yHz5h+OR3m1zJVBQ1lbauOsF2dC1UHdtQS4e4QXp4fU
   dPot5qw3QGYWAAkn9caS7QteBy/h7AiIPwP0RtGXZwFi9ZiwVqDfQwCEr
   Q==;
X-CSE-ConnectionGUID: kF1r51WtSoCERDgX6XHCzQ==
X-CSE-MsgGUID: pPpQRpzAROySt+r3tKODaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20800672"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="20800672"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 06:58:35 -0700
X-CSE-ConnectionGUID: dyWcK1jYS8CdclQYZxYZXQ==
X-CSE-MsgGUID: gzTbPkUQSQuuN32SCtMSXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="60236926"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Aug 2024 06:58:33 -0700
Message-ID: <a0f5ea6b-2be4-4fac-8c22-34fc21df84b2@linux.intel.com>
Date: Fri, 2 Aug 2024 16:58:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
 <20240724071245.3833404-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240724071245.3833404-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_065839_881777_41C614BF 
X-CRM114-Status: GOOD (  21.80  )
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

On 7/24/24 10:12 AM, Shyam Sundar S K wrote:
> The AMD HCI controller currently only supports PIO mode but exposes DMA
> rings to the OS, which leads to the controller being configured in DMA
> mode. To address this, add a quirk to avoid configuring the controller in
> DMA mode and default to PIO mode.
> 
> Additionally, introduce a generic quirk infrastructure to the mipi-i3c-hci
> driver to facilitate seamless future quirk additions.
> 
> Co-developed-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Signed-off-by: Krishnamoorthi M <krishnamoorthi.m@amd.com>
> Co-developed-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/Makefile |  3 ++-
>   drivers/i3c/master/mipi-i3c-hci/core.c   | 15 ++++++++++++++-
>   drivers/i3c/master/mipi-i3c-hci/hci.h    |  3 +++
>   3 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
> index a658e7b8262c..1f8cd5c48fde 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/Makefile
> +++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
> @@ -3,4 +3,5 @@
>   obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
>   mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
>   					   cmd_v1.o cmd_v2.o \
> -					   dat_v1.o dct_v1.o
> +					   dat_v1.o dct_v1.o \
> +					   hci_quirks.o

This doesn't build since hci_quirks.c is added by the patch 4/5. One 
idea below.

> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dbc8c38bd962..8bb422ab1d01 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -33,6 +33,7 @@
>   #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>   
>   #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
> +#define HCI_VERSION_V1			0x100	/* MIPI HCI Version number V1.0 */
>   
>   #define HC_CONTROL			0x04
>   #define HC_CONTROL_BUS_ENABLE		BIT(31)
> @@ -745,6 +746,14 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   		return -EINVAL;
>   	}
>   
> +	/* Initialize quirks for AMD platforms */
> +	amd_i3c_hci_quirks_init(hci);
> +
> +	regval = reg_read(HCI_VERSION);
> +
> +	if (hci->quirks & HCI_QUIRK_AMD_PIO_MODE)
> +		hci->RHS_regs = NULL;
> +
>   	/* Try activating DMA operations first */
>   	if (hci->RHS_regs) {
>   		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> @@ -760,7 +769,11 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   	/* If no DMA, try PIO */
>   	if (!hci->io && hci->PIO_regs) {
>   		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
> -		if (!(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
> +		/*
> +		 * HC_CONTROL_PIO_MODE bit not present in HC_CONTROL register w.r.t V1.0
> +		 * specification. So skip checking PIO_MODE bit status
> +		 */
> +		if (regval != HCI_VERSION_V1 && !(reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
>   			dev_err(&hci->master.dev, "DMA mode is stuck\n");
>   			ret = -EIO;
>   		} else {

This is true, I see this now from pre-v1.0, v1.0. v1.1 and v1.2 specs 
too, HC_CONTROL_PIO_MODE bit is present only after v1.0. And therefore 
version != HCI_VERSION_V1 check is not fully correct since bit is not 
present in pre-v1.0 HW versions either.

I'd split this patch and do version check alone here (perhaps as a first 
patch) and do quirk stuff later where hci_quirks.c is added.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
