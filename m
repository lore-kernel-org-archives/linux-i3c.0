Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1739C87FCB
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Aug 2025 14:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htI/K1qGlkQGhXuOUdrwqKNogXgR0/Y+jXwhyu5od28=; b=P+dO0KmBNCIol7
	a0a3OrIkZxZGgem4uNj87CkJjkiRmsFDmQ76FEoK+gSNAk49LyRocEHhYnjkaqAwyS2Bk4EoqoBx9
	aZgkaGbshfc7st9q9eH2nP9iU0EHpoiWhcu6SoM6TIMva1HCREWrIcTt1QQIMsj6x4S6DkkkNpyOj
	hhfv489NwRSpuuUnQYsPEXPGQY/Qcw1DZ9DzjBHqgpbRzTj8cqnytGRQVFxv4Vb2NhuYN6m+TVSsN
	bKwuzU1t2KTKCNiwXFKUJYnSvI9uSOhrInpywNZ8d36jwvwnziB9X4PAV8xutFuveVulpJ5fLn6S/
	VwWr8031XpQrSGj/+iUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwAb-0000000AfYz-21A2;
	Mon, 04 Aug 2025 14:28:09 +0000
Received: from mgamail.intel.com ([198.175.65.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivMt-0000000AYXd-1zFU
	for linux-i3c@lists.infradead.org;
	Mon, 04 Aug 2025 13:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754314608; x=1785850608;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qaBVvQtnpez5OZcQWFSQ08sHztTEj6kKnd5oXGntwY0=;
  b=XeQUswGbvzdxovDKs7GiGM9RCbjRYlfH95jYDkQgIHzDJ5p0y4aMIVX0
   GHsWMA+6AYAkmS1GqUv9goRYc5anRvYng/RkVWvY5GzsWAjHSECAF8v1f
   HIc9u6/K3U4uhpe+4VmQ+NXzLylQVdJe7MHu04Nq4rdl03CJDfo3ZxcSZ
   pylBh1sh8xJzh+vX7t8cs7pGoK47n5CLJfuORDUT1HD+S053yBqBDoDSe
   zCDEZnI2jmPMmLKBn3FymUS4ec95lVgRNgYce/dP7pAEc9IKgBBSlgPup
   xpOkQ80pQh+YRbScbk1fkciQjBH1Sav9QmoMWCPnNwWO/daW/QMvFwT90
   w==;
X-CSE-ConnectionGUID: Ff6YRBRVSl+ihdRyJhXC8g==
X-CSE-MsgGUID: lVjdS4+3QRqmM96OduSaqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56447100"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56447100"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 06:36:32 -0700
X-CSE-ConnectionGUID: cOmkBOuSQO+ZLWlprqv8tg==
X-CSE-MsgGUID: wvDTgD1oTNGqt9vzTLo0OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163430285"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2025 06:35:41 -0700
Message-ID: <11c58cf4-16fc-41ce-bde5-65763689652b@linux.intel.com>
Date: Mon, 4 Aug 2025 16:35:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] i3c: master: Add helpers for DMA mapping and bounce
 buffer handling
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <aIzVPNnrOkPQ3fcd@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aIzVPNnrOkPQ3fcd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_063647_559980_005CACF6 
X-CRM114-Status: GOOD (  18.44  )
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

On 8/1/25 5:54 PM, Frank Li wrote:
> On Thu, Jul 31, 2025 at 05:14:17PM +0300, Jarkko Nikula wrote:
>> Add helpers for I3C host controller drivers for DMA mapping/unmapping
>> and bounce buffer handling. A bounce buffer is allocated if the buffer
>> is not DMA'able or when the driver requires it for a transfer.
> 
> You'd better move some patch 2's description to this patch, to descriptor
> why need bounce buffer.
> 
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master.c       | 74 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/i3c/master.h | 20 +++++++++++
>>   2 files changed, 94 insertions(+)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 2ef898a8fd80..a1daf18ea707 100644
>> --- a/drivers/i3c/master.c
>> +++ b/drivers/i3c/master.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/atomic.h>
>>   #include <linux/bug.h>
>>   #include <linux/device.h>
>> +#include <linux/dma-mapping.h>
>>   #include <linux/err.h>
>>   #include <linux/export.h>
>>   #include <linux/kernel.h>
>> @@ -1727,6 +1728,79 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>>   }
>>   EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>>
>> +/**
>> + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
>> + * @dev: device object of a device doing DMA
>> + * @buf: destination/source buffer for DMA
>> + * @len: length of transfer
>> + * @need_bounce: true if buffer is not DMA safe and need a bounce buffer
> 
> Is it possible auto check if 'buf' dma-able?
> 
In some sense yes and I think since I3C being new, and probably 
integrated only to a modern HW, it will simplify things a bit and we 
don't need to deal with e.g. highmem etc. legacy stuff what SPI core 
needs to check for instance.

Idea is to do common checks (currently only the is_vmalloc_addr()) here 
but let drivers to tell if they have their quirk reason for a bounce buffer.

> If use struct i3c_dma __free(kfree) *dma_xfer = NULL; it simple error handle
> 
Will do.

>> +	dma_xfer->addr = dma_map_single(dev, dma_buf, len, dir);
> 
> len should be ALIGN(len, cache_line_size(), otherwise swiotlb will bounce
> again if need_bounce is true
> 
Ah, good to know.

>> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *ptr,
>> +					  size_t len, bool dma_safe,
>> +					  enum dma_data_direction dir);
>> +void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma *dma_xfer);
> 
> needn't dev, save it into struct i3c_dma, so we can use cleanup easily
> 
Ok.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
