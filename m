Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216EC52D7C
	for <linux-i3c@archiver.kernel.org>; Fri,  9 Aug 2024 13:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69z3KDaRmaCbzGUUKWIYWjCGO0bpJpeEWJMH6FaXAes=; b=bI6xRAG3dbqxbY
	Zpfx+FeVtbMeCvKprt749tMx6wu/XbXfP95HuoeDSnsr/Iq6A8vc5/S8DSGcpvQCZl7EuoAwv6iSg
	7NmcNJcQpf09K1ZtwVVcUqktb+dZLPvISm+3maqRS3fFLhK/wUPPqnDMCn8t6mWZhrs5nCCe3aXbB
	5/7nTxBe0E6Q9GGDm/5Om4Q5macT3buSeSs2FuBYurFoYNp4rvGLHaPX8x00e4GHNYjWMRy85jGVZ
	ADTNStrSb86wrEe6hymeOdAmBE1WJ8UO5S9pE/TXNbVX9crYFMeVg1A6yeJWMN28YtPx6QfwiQorg
	jXJsYrrOMibEWKuGE/SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ7R-0000000BQr0-1FAS;
	Fri, 09 Aug 2024 13:57:25 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scQ5o-0000000BQR2-2BnW
	for linux-i3c@lists.infradead.org;
	Fri, 09 Aug 2024 13:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723211744; x=1754747744;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=u3qb9u7xUqfWCyseEYNO2y6Aw00VoHXE9cd46e9bm7g=;
  b=CGNIBBKwuegcezKg0ibyHj3MPCAIJACFyWzgJnfZsBZmt21orCjU8P32
   4zyXYU88TJVJIgwdGxSS52+ijz1xrHZYFKkBBE9V1tLCTq2cDmNp4xcGz
   RFqqcPvXN8GewZYS6unmWmDTkNzYa9geYJ/LgPcw+ZMeSu6uWPghYjcFE
   nrVeMqnUroxi4NdxsP407bg7ytoKXWvdGkJEC/8UuaKca0cytNa0fRrWL
   9Eyr72W78iqg/HD9LJSPiwKRRpO3v4UnXWpiP/BplQRSTpj/t6PWTeg5H
   4HO+2cR3eIKOOzdHbSMhKfP5LFos/ZOTkBkc46blVrjEvbtSCWtBLItwk
   g==;
X-CSE-ConnectionGUID: X01PPCONQrO8KuEwA4vCaQ==
X-CSE-MsgGUID: Ke519VJHStSVnp4GGfuTCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38891109"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="38891109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 06:55:44 -0700
X-CSE-ConnectionGUID: HNMyY+K7TzSrs6VZjAP8ug==
X-CSE-MsgGUID: Gcxom01WTMeHvnEkUCog5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800"; 
   d="scan'208";a="57787766"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2024 06:55:43 -0700
Message-ID: <2a9f6c23-9c7b-496b-9998-ea0afe526b46@linux.intel.com>
Date: Fri, 9 Aug 2024 16:55:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO
 mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240809_065544_610371_0E54ECCB 
X-CRM114-Status: GOOD (  10.34  )
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

On 8/7/24 8:23 AM, Shyam Sundar S K wrote:
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

...

> +void amd_i3c_hci_quirks_init(struct i3c_hci *hci)
> +{
> +#if defined(CONFIG_X86)
> +	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
> +		hci->quirks |= HCI_QUIRK_PIO_MODE;
> +#endif
> +}

I was thinking these quirks can be passed as driver_data more cleanly 
and be specific only to affected HW if AMD HW would have an unique ACPI 
ID for each HW version.

Above X86_VENDOR_AMD might be too generic if and when quirks are fixed 
in the future HW :-)

So something like:

static const struct acpi_device_id i3c_hci_acpi_match[] = {
	{"AMDI1234", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING | 
HCI_QUIRK_RESP_BUF_THLD},
	{}
};

and set them in the i3c_hci_probe() as:

hci->quirks = (unsigned long)device_get_match_data(&pdev->dev);

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
