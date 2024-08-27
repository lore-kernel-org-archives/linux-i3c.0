Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE97AC52D6F
	for <linux-i3c@archiver.kernel.org>; Tue, 27 Aug 2024 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAxv4mireGBo2+b65y6EI6eG59WS+ojEbsqNNbzgIa0=; b=fmubToolIE11UH
	/r5PVy1mYs4vax0b4yPqnkY0o/K4de7wNspOM8oxIys5H4RJm5tS0D6H3/lKyaeQJC36a+Ztj0oPA
	rywklPofU/LjoVZaUs2Hhq4xw3bmscBfOrG6LSVrfF77pUJBkjJ3KWYsvbciO2Sw+zPw5oWY6bAg5
	goy8KYiCxXHvMMNiLJ2Wsils0LuiRUpK/xSWaMe3Fw3pzgi3lwmaLOaCbHy4nzb6FCj1hdydOgNOd
	QcSZYzjXFxuPsTj8JJzzDdCI2kqHi9W9Ps1qOzlC/QXy0HIXkTXiM0dJ8Tx0VVv9gIZsZglkKeCAc
	H2QFxsCS7BHHR6XVODyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqXo-0000000ACDk-45cF;
	Tue, 27 Aug 2024 07:23:13 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siqXm-0000000ACDO-089W
	for linux-i3c@lists.infradead.org;
	Tue, 27 Aug 2024 07:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724743390; x=1756279390;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B7htdUdtKPddLbS/gIn9aNfjx718NPsbBSd7k3pv1v8=;
  b=CTAITwxn0Ty/Qb1nb68c8yzVFLCsDuw2NFn7xttVFAfkT4BLSOAoPrIB
   TTFTeutvJlFL63onlzcifQ67MUAmGuoMMfUUicEr3UJq0sB8GKgVSGXAd
   G0OWFz0RpYeQVmIQs26FZ+gGwRJLAsbtIgH5jINUi3j37iEmyd/CSv98G
   33AdnR3GWcZWFiqPbWE3xAoaG4ey2K+RwQVKzmbYFKG44GpITvPmW7Okd
   Kbb01b7pT2VRy9bDv3i7bBP45gA+gGp5fzyBcmckrVD0rx5hB07cRW8vp
   7a62i47hb8fHAWI4UIy1rdzBdxHdQ3LGLMwqUjewcVFW8eiDnsSQjr8Wm
   w==;
X-CSE-ConnectionGUID: dQQw4TdER2aSv7PK3E9Hug==
X-CSE-MsgGUID: BziZVNBTRo6Hm/D4crgviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23357137"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="23357137"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 00:23:09 -0700
X-CSE-ConnectionGUID: 8VS5XKuRSmWN1f6+r7QuCA==
X-CSE-MsgGUID: Xqv7lKqySpOXbU7l9Me2ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; 
   d="scan'208";a="67584343"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Aug 2024 00:23:08 -0700
Message-ID: <5269394f-ad13-4a1f-a8bf-f58249af8913@linux.intel.com>
Date: Tue, 27 Aug 2024 10:23:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only
 after i3c hci v1.1
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240823141917.692336-1-Shyam-sundar.S-k@amd.com>
 <20240823141917.692336-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240823141917.692336-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_002310_148573_754E7E0C 
X-CRM114-Status: GOOD (  14.68  )
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

On 8/23/24 5:19 PM, Shyam Sundar S K wrote:
> The HC_CONTROL_PIO_MODE bit was introduced in the HC_CONTROL register
> starting from version 1.1. Therefore, checking the HC_CONTROL_PIO_MODE bit
> on hardware that adheres to older specification revisions (i.e., versions
> earlier than 1.1) is incorrect. To address this, add an additional check
> to read the HCI version before attempting to read the HC_CONTROL_PIO_MODE
> status.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index 07de1cecfa30..42d2362d072b 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -630,8 +630,8 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>   
>   static int i3c_hci_init(struct i3c_hci *hci)
>   {
> +	bool size_in_dwords, pio_mode_support;
>   	u32 regval, offset;
> -	bool size_in_dwords;
>   	int ret;
>   
>   	/* Validate HCI hardware version */
> @@ -753,10 +753,13 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   		return -EINVAL;
>   	}
>   
> +	pio_mode_support = hci->version_major > 1 ||
> +				(hci->version_major == 1  && hci->version_minor > 0) ? true : false;
> +
I'd rename this as mode_selector etc. since I've understood PIO mode is 
possible in earlier version(s) too.

Also latter part of statement "? true : false" is needless.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
