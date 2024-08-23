Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CDCC531DC
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETsKFlfBrocPnqRsZ3HAJgn8iSjg1tp4FujCoJb+Lx0=; b=p6pqM2s4smgOh1
	lrasmtUy7lgZplgGVaW6Ykk26SvmO7OB+kO/H4KbJa+LaLHF8AUpM5fJviQO7H7cdpHLdIgbZJtcV
	D1J4GjfQpV1LSoOuPSKN9LPrfDkU+BNs6QB7EiScdHXn+SMdJ03Mr2fubiFIpRQz2dEKvi2qDxVQf
	TJJcLSIxGM1OqFom3z6xI/T97PKmoEUhifCa5pjm3RY3qfGF8tYb3aQOo0gQKSmC0W+AENjBY/8o5
	9Aqwz3aWvjhKtA295fLGCBR+tAxIaKYfB8v4MQ8eKfXAAIWHk5aS+mcoCThOBt54USIYVwCLKE7ib
	XSWyW/2cex9rxrQ1xQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRFa-0000000GFxW-1jEB;
	Fri, 23 Aug 2024 10:10:34 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRFK-0000000GFsH-0940
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 10:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724407818; x=1755943818;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=oMufABWSu43Zhd3K6WgT6JTK0bNbHhwrNC7S1QzUR9U=;
  b=L3xPAtjVPPB+65X4AomYlCvl8n3WZfSU/R7Rv3cXv1qRlOhT4Got/qAZ
   x01XasDl8xpDvt8j7lKvTe61DHLT9Tbvw1vRR4uuCKDEQ01IVyta98XcT
   80tAEzC+gaO87001cqwe5R/QLEM0j8DfpUGoOQEg9QHsiJTjB38PfNSjs
   jzaUt6ryy54/h+515vZx+ba7YOkjgnqzEi32OgmCgtnAm7T4cJfGbSpC6
   2ra5bsMXAYU81Meb2pCNDsSqoQmzqwdvr5YvdMMbscMrsfrRuwIIUYCdZ
   qGpc7LC0VGx+lK/xL5bevJ1ZIqiuUaRoafAJHBfWDrYL1LEAjLdxfz/lL
   A==;
X-CSE-ConnectionGUID: PK3mnl+hRUKlytjkGLnd/A==
X-CSE-MsgGUID: CmYFdlSvR6erEf/CLh9aXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40383746"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="40383746"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 03:10:18 -0700
X-CSE-ConnectionGUID: Ue0gGeQiTMGH4g6tjuUukQ==
X-CSE-MsgGUID: gNJkznafQ4ySYqejExBovw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61758299"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa008.fm.intel.com with ESMTP; 23 Aug 2024 03:10:15 -0700
Message-ID: <5a0ee0ce-c44a-426a-9019-bf801f22d8f6@linux.intel.com>
Date: Fri, 23 Aug 2024 13:10:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240821133554.391937-4-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_031018_122981_5FEF325A 
X-CRM114-Status: GOOD (  15.98  )
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

On 8/21/24 4:35 PM, Shyam Sundar S K wrote:
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
>   drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++++-
>   drivers/i3c/master/mipi-i3c-hci/hci.h  | 1 +
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index d1952a5619d4..3aa4aa9deb56 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -754,6 +754,11 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   		return -EINVAL;
>   	}
>   
> +	/* Quirk for HCI_QUIRK_PIO_MODE on AMD platforms */
> +	regval = reg_read(HCI_VERSION);
> +	if (hci->quirks & HCI_QUIRK_PIO_MODE)
> +		hci->RHS_regs = NULL;
> +
>   	/* Try activating DMA operations first */
>   	if (hci->RHS_regs) {
>   		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);

This looks otherwise ok to me but with "regval = reg_read(HCI_VERSION);" 
removed. I commented that in the patch 2/6.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
