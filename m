Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CB74D132D7
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Nov 2024 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP4wf3EUQpTkFLOuN8q7OgQIEB597zx8Dx5fibRUAqk=; b=K5BwhWlgGk2Wa3
	zpeJ8ddsxdhUZnJMrzuSxtUEj0lDAZZvj2dsPvf2H/9O7gLAM5UA25oC7DiXVF/85HKLlHGUIe1gu
	gG/L+DeJ5qlS20GC2V78zfVsyrYZ1H3+4CEy3vgcPrW0pyaiUJLpbpkYdewEViLP4r2GLY8FErdOs
	jhQQ2qoPkEE0nApl1aBo6ZYso8fEA2+643loummvE4n1UA2jmSyMzCursBOxhNetJLOY47T9fAbzC
	nrbbqw/BOSBfkBqHe0ZN/JwCTK/ABp8boAxlxRwGTRcw2S4BqUaGxrVg77k1sT862SUfEhSomjQww
	VW/rJcVvxcrjoX8Ssqxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yT4-0000000E7mF-00sZ;
	Mon, 04 Nov 2024 14:54:10 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7y9w-0000000E3vG-3vWA
	for linux-i3c@lists.infradead.org;
	Mon, 04 Nov 2024 14:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730730864; x=1762266864;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iiXH8mVQOPTOV4xvUPLOj4H0pAr4u/wT1KnOxicTZBA=;
  b=ZYFePSk+GnFB2lCqVxjMBPeV9k3/WdrtodY5KethV7EIs8ESmp+DGJu8
   xgmC6wIG24bjcf1OELLV5bArq/bm+kJLeNdXzb8KoV1DZ3YowxYLAbnz1
   9OnlYYiV/o9Ct3tl4fldaOrQU98J/Sj0qOhap6K5+KOgvSqJxf+62Pn+L
   HoOS9TdsuicKTrV1xsUJSGPlHI3ZwZOmE2OSgZaIziB3Lnlm6cFzP2vUd
   TH6zWbIQbNIRE7SknDp0Hyb5SCtWM5jKp/u8ikoRHvH8HT6BI+axY0m+L
   EZWhjdujIssppesFhAEHPM4WRbEmUZlRJCMAskqwVpAvYZ8xAn+Vvfw61
   w==;
X-CSE-ConnectionGUID: 0Isp2POySOKW7iLR3V6fpw==
X-CSE-MsgGUID: IJxzyOR2TzeI8WQzYZLPiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55830602"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="55830602"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:34:24 -0800
X-CSE-ConnectionGUID: zOEtbfMsRMeYGNQCerqapg==
X-CSE-MsgGUID: Ys8cFRB+TLydmix+5rO7ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83351296"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2024 06:34:23 -0800
Message-ID: <9eb7c88a-c448-45cc-aeaa-88ab59cdadc5@linux.intel.com>
Date: Mon, 4 Nov 2024 16:34:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] i3c: dw: Use IRQF_SHARED flag for dw-i3c-master
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
 <20241023055118.1400286-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241023055118.1400286-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_063425_023458_8EDD4CDA 
X-CRM114-Status: GOOD (  13.04  )
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
> On AMD platforms, the IRQ lines are shared between two instances of I3C.
> Add IRQF_SHARED flag during the interrupt registration process.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/dw-i3c-master.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 1a7c300b6d45..fd58a95ae1c3 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1578,7 +1578,7 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
>   	writel(INTR_ALL, master->regs + INTR_STATUS);
>   	irq = platform_get_irq(pdev, 0);
>   	ret = devm_request_irq(&pdev->dev, irq,
> -			       dw_i3c_master_irq_handler, 0,
> +			       dw_i3c_master_irq_handler, IRQF_SHARED,
>   			       dev_name(&pdev->dev), master);

dw_i3c_master_irq_handler() seems to be otherwise ready for shared 
interrupts but reminded me it might have a similar issue than 
drivers/i2c/busses/i2c-designware-master.c had [1] because both are 
runtime PM managed.

To me it looks dw_i3c_master_irq_handler() may incorrectly process 
interrupt from other device if register reads return all bits one when 
device is suspended. Worth to check.

1. Commit cdbd2f169bf1 ("i2c: designware: Do not process interrupt when 
device is suspended")

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
