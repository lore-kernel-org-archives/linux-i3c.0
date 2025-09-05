Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3775CA1015
	for <linux-i3c@archiver.kernel.org>; Fri,  5 Sep 2025 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NkgjnMHylyvwdY9BvSJPCd385j20xPjbDyeEuv76m0g=; b=mBMwyx62VCMOLV
	tJEflVUpM6Fj3CMtH4wm8bK782mI6kUNjQT/T2fl4a4n+SjWFzMLM2RXzd/g8AjozW6hKfxSWpkdZ
	UZKpkWZ5IokFr4XptxEJ7GAVKKxU7yOh6wWwHDqTT0xsfUJHCL6DY4zhAQgT5B6an+Muq8ANTkjVk
	8zqzDCeP60zHPxQhtX8AFkwAm9F/RhsWAiCjinLb2KrACAtt1zECjBQtn3sX9p9bVIFVMIaksyALe
	dcoKkilNPyocBSYT0KU5ZXiW7lSB6bWpp4KGu1aNspgHY3HHf26WYrp834pBrWEvPM1ood4537sCo
	uNndz6++zPqaq7FtkJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSEC-00000000Wox-378h;
	Fri, 05 Sep 2025 08:55:28 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuR1K-000000004jZ-28fs
	for linux-i3c@lists.infradead.org;
	Fri, 05 Sep 2025 07:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757057886; x=1788593886;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A1ktqc+Gt8y2y623q+zhymKxpmaB+ohfMcodY5V/p8Q=;
  b=MHSGSWrOC2j22gfrDYbFwnDFlgyIch+ej1nQb29Kevi38LNsp4WelQGu
   YnjUlXJGu+So7pPK9hoFYebUlqFrTu34/oPOZYXDN6qExrHxkSiq21AaX
   014BS+pGz2OaD5O9/0J6XZo2maXuU4wx4dEuCmb/yzQp4q4wCYG4KF+No
   q++Sbx2FEwgd5Pl8b8tKPHN7LwgDhUNJuYwg5ANSNTWKtZN9xHAPXOd9s
   E+ct+C2rnM9QqG+fV5moEUPukYF0Y1AlWX2RNv7R9Hv1Ee40H+9W+fzgt
   G/FKgN0x5l0GPO9iejcbSSwOf+cbuVms9g9ptD3juK1OawrnavsfbRphB
   Q==;
X-CSE-ConnectionGUID: AFwytbeZQ6G/S7gwS2wCUg==
X-CSE-MsgGUID: /Y9qM+pmTp+5b+Fqna1N9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="84837182"
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="84837182"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 00:38:06 -0700
X-CSE-ConnectionGUID: HFFCOiptS7mX2ga4DZ45hA==
X-CSE-MsgGUID: kDLIDdRcQ+W7OT8nFGxs4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="171315625"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Sep 2025 00:38:04 -0700
Message-ID: <aefc2b10-b014-49df-85c8-e7508935c19a@linux.intel.com>
Date: Fri, 5 Sep 2025 10:38:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: Fix default I2C adapter timeout value
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
References: <20250904124226.837639-1-jarkko.nikula@linux.intel.com>
 <aLmfY3zznNHPvH4q@shikoro>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aLmfY3zznNHPvH4q@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_003806_845893_14E6B382 
X-CRM114-Status: GOOD (  10.04  )
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

On 9/4/25 5:17 PM, Wolfram Sang wrote:
> On Thu, Sep 04, 2025 at 03:42:26PM +0300, Jarkko Nikula wrote:
>> Commit 3a379bbcea0a ("i3c: Add core I3C infrastructure") set the default
>> adapter timeout for I2C transfers as 1000 (ms). However that parameter
>> is defined in jiffies not in milliseconds.
>>
>> With mipi-i3c-hci driver this wasn't visible until commit c0a90eb55a69
>> ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers").
>>
>> Fix this by setting the default timeout as HZ (CONFIG_HZ) not 1000.
>>
>> Fixes: 1b84691e7870 ("i3c: dw: use adapter timeout value for I2C transfers")
>> Fixes: be27ed672878 ("i3c: master: cdns: use adapter timeout value for I2C transfers")
>> Fixes: c0a90eb55a69 ("i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers")
>> Fixes: a747e01adad2 ("i3c: master: svc: use adapter timeout value for I2C transfers")
>> Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> 
> Fixes: d028219a9f14 ("i3c: master: Add basic driver for the Renesas I3C controller")
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thank you!
> 
Ah, thanks! Somehow my eyes only saw the 1st call to the 
wait_for_completion_timeout() in renesas-i3c.c passing 
msecs_to_jiffies(1000) :-)

I didn't Cc stable since I don't think any of your patches cause any 
other issue than extra long wait in case of I2C transfer error on 
configurations where CONFIG_HZ is less than 1000 but now I'm unsure 
should it be Cc'ed?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
