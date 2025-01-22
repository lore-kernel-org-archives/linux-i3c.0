Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C49C02181
	for <linux-i3c@archiver.kernel.org>; Wed, 22 Jan 2025 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qt2vTHswQh9OZrxT/Ai6BGY447spAMB1vUpye+pUQpw=; b=UaaWeeUjV+WxOFkANVg5y0ap3o
	xyTtqoIrNN5yp8Ov1/VryZwrm6kFQ+Th+aaz5C8yAexAyM9PEbtKhVvfbVlWwi4iSYTqb1wR2ED5M
	5Yrk1mxe/fuDpyNkU9tzaXLUSShjj+tzQRub2lp/u1LYpYs7dZvgiDoQKmQ8eD5Z6r2kHYOz3MKqN
	ugBt5o4Njg3sUhUPI2gFAG8GAOfXIdxrEEXGfNCfjmf4tGL7c2a8CW1uupxQX/lkrWlrRKPoXzuyC
	GgSneLXhieZJ1ngUvZMiFK6ESBpeaEANW+1ntI3DKY5YMKNdiSAxJJ8AZ7TCK4P0Ej1l5X6rhJVhE
	pquWpakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taW5w-00000009iCf-0mxa;
	Wed, 22 Jan 2025 08:28:16 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taW5t-00000009iBj-2m6Q
	for linux-i3c@lists.infradead.org;
	Wed, 22 Jan 2025 08:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737534494; x=1769070494;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Tu4m3JYNS2WOgNLvRZWFqW9xbZk1lxgTFdXLuVVF0UA=;
  b=eRlQrs0TlkNQaYVRwFbHH65MgDS1mpoh/xwJDXnGnWZ80iWn14vGrsqR
   LA9dkCZ39Vu1/hJ04niBEDGRjfKmsChEKM9AyYbTcU8bdb0R0NSnzBkWv
   Iu/rQHknM+MK3+NfjlBlTZ+/9FeF3k09s+DxPYrLq5ZhsIqRKpWR/HGNk
   xqxWpRGgJNQjkltrWpvHUn1HzlTvMYGILyRDnmFjNCcN4CLIG7lZ8l/Nb
   4UhOWpzf/2XuH9QK/JaUy/ZziKTHK2B86w2rcHYpyZjOrLZc9D1rmLdpR
   vKaX0H3ptw+e6HDeR4VMfaBQgYG5L3n8cxYzkdc1Wry/BgiTBLgbQFyMU
   w==;
X-CSE-ConnectionGUID: N+uxljUeQVKyGGXN64MFmA==
X-CSE-MsgGUID: OBQY+u4US3S5/wLws0QIHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="41653911"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; 
   d="scan'208";a="41653911"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 00:28:06 -0800
X-CSE-ConnectionGUID: ySUgBcSTT06/jBqx/mfX9A==
X-CSE-MsgGUID: PsOHW7OeR0yx37rOQBEK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144318446"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2025 00:28:02 -0800
Message-ID: <82ce69fe-42fc-4199-bf78-4a147c26048a@linux.intel.com>
Date: Wed, 22 Jan 2025 10:28:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] i3c: mipi-i3c-hci: Use DMA-safe buffer for I2C
 transfers
To: Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
 wsa+renesas@sang-engineering.com, xiaopei01@kylinos.cn,
 Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250121110756.214714-1-billy_tsai@aspeedtech.com>
 <20250121110756.214714-2-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250121110756.214714-2-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_002813_752427_03D86FFD 
X-CRM114-Status: GOOD (  15.65  )
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

On 1/21/25 1:07 PM, Billy Tsai wrote:
> The i2c_get_dma_safe_msg_buf function is used to ensure safe handling of
> I2C messages in HCI DMA mode.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index a408feac3e9e..3567cd566339 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -382,7 +382,7 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>   		return -ENOMEM;
>   
>   	for (i = 0; i < nxfers; i++) {
> -		xfer[i].data = i2c_xfers[i].buf;
> +		xfer[i].data = i2c_get_dma_safe_msg_buf(&i2c_xfers[i], 1);
>   		xfer[i].data_len = i2c_xfers[i].len;
>   		xfer[i].rnw = i2c_xfers[i].flags & I2C_M_RD;
>   		hci->cmd->prep_i2c_xfer(hci, dev, &xfer[i]);

This allow to remove calls to i3c_hci_alloc_safe_xfer_buf() and 
i3c_hci_free_safe_xfer_buf() in i3c_hci_i2c_xfers().

I was pondering the i2c_get_dma_safe_msg_buf() when making commit 
4afd72876942 ("i3c: mipi-i3c-hci: Add DMA bounce buffer for private 
transfers") but decided to reuse the same (own) helper for both 
i3c_hci_priv_xfers() and i3c_hci_i2c_xfers().

In that sense I'd modify the commit log a bit that instead of ensuring 
safe handling patch switches from custom helper to 
i2c_get_dma_safe_msg_buf() and i2c_put_dma_safe_msg_buf() (please note 
the comment from Wolfram).

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
