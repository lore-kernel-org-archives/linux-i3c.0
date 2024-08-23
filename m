Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E57C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvq8oiLBMi1+m3vAqgSlmnj7n8gSifDqJvcCq0qUDLA=; b=BofCbPJNFXTB2e
	Ykk+tSX38w8qglGCos5adocF8ZXQqYVwMCvtqw6fbSRzHr5pNg5C6tX9Q7SsfjXaNAnHH7pU/+577
	TUg2QLs3Ymbz3M5/WA31XlYige62OFs35UKsEY3oON6mCVXunFGvG95PrdzPwSHS5jbY7ocFDUQCO
	okYlz7cbbJqjhwjD+0vW0yH7ZSG//TLP4SsNNs4YMl3it97dorwX/EQ6m5hexaW6ahGZTIC3ad4Eq
	XWmXc80fbhHbl9DZ/NDBtvp9lD9mQkKh43y7ZweYuSBsBvGMKsE60hR7VJvtOk2xUtvuWjBF7nBAI
	ISmipOdwvT2h3/nhNigQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQ11-0000000FxVX-0xQt;
	Fri, 23 Aug 2024 08:51:27 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQ0S-0000000FxRW-1uZo
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 08:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724403052; x=1755939052;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S4820Yj8epkSdTFs9Td/DHO5A96eHtVbmEjYzzVrkKE=;
  b=LRvtJ92jv6cWGJnhcNDXqVvbW7aifOUexievKRs7DJ2zPTH8ikIwHABT
   G/mFniftqob5uXfny9IQLkHWUrv4CxTPe0ISGEf3dpvOAvHNzlUHxODLk
   3KhNtI5+bJo5HCdEGdgR+/Q1vUMNGWZl2WwfcvmHggATbeMPhkZTIUxrg
   gWL83JSnuk2drPqlPWegZPXkOmGnNiE7Axisz8HoP9nRxCp7hLR3hssf/
   g2d4YDVfojJJAXW5fHk17jSevHn9UeWz9jRPWTSFaRso0y/2i0lZM1p1n
   luWO6ezrugSTKJ1cj2M5hg5C+im8Eeri4xgm30hIRk2tn1fi+DimY4+EK
   g==;
X-CSE-ConnectionGUID: iM6vSMViQI+iHlRQUzcHoQ==
X-CSE-MsgGUID: 1uQTma6HRaqpvaLJE9kLpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22671269"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="22671269"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 01:50:51 -0700
X-CSE-ConnectionGUID: iv/lGtahQDqenJfIU935KQ==
X-CSE-MsgGUID: /EvWJKMYS0mXx8taZkTpig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66055615"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2024 01:50:49 -0700
Message-ID: <c394ba6d-c219-4b9f-aa6b-3a48389c317a@linux.intel.com>
Date: Fri, 23 Aug 2024 11:50:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] i3c: mipi-i3c-hci: Read HC_CONTROL_PIO_MODE only
 after i3c hci v1.1
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-3-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240821133554.391937-3-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_015052_609403_7D9FE64E 
X-CRM114-Status: GOOD (  17.95  )
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

On 8/21/24 4:35 PM, Shyam Sundar S K wrote:
> The HC_CONTROL_PIO_MODE bit was introduced in the HC_CONTROL register
> starting from version 1.1. Therefore, checking the HC_CONTROL_PIO_MODE bit
> on hardware that adheres to older specification revisions (i.e., versions
> earlier than 1.1) is incorrect. To address this, add an additional check
> to read the HCI version before attempting to read the HC_CONTROL_PIO_MODE
> status.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index b02fbd7882f8..d1952a5619d4 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -33,6 +33,7 @@
>   #define reg_clear(r, v)		reg_write(r, reg_read(r) & ~(v))
>   
>   #define HCI_VERSION			0x00	/* HCI Version (in BCD) */
> +#define HCI_VERSION_V1			0x100   /* MIPI HCI Version number v1.0 */
>   
>   #define HC_CONTROL			0x04
>   #define HC_CONTROL_BUS_ENABLE		BIT(31)
> @@ -756,7 +757,7 @@ static int i3c_hci_init(struct i3c_hci *hci)
>   	/* Try activating DMA operations first */
>   	if (hci->RHS_regs) {
>   		reg_clear(HC_CONTROL, HC_CONTROL_PIO_MODE);
> -		if (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE) {
> +		if (regval > HCI_VERSION_V1 && (reg_read(HC_CONTROL) & HC_CONTROL_PIO_MODE)) {
>   			dev_err(&hci->master.dev, "PIO mode is stuck\n");
>   			ret = -EIO;
>   		} else {

Actually here after this patch regval doesn't contain the version but 
HC_CONTROL which is read some line above. HCI_VERSION read is added by 
the patch 3/6 so this patch alone may cause a regression.

I'd say better to use already set hci->version_major and 
hci->version_minor since then code is not vulnerable if some other 
regval = reg_read(OTHER_REG) is added later before this code block.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
