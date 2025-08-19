Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A10CA0EE9
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 06:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OFnmBzff+8w86SvDYN3KMr2adClSzehjVLLvILg1mQg=; b=ZHAz9Si4CArqx7
	2yNGQ0TPKFiXUTX3ZJlv3bNxWaR0g2kmgNKJBbJwKiFBQJa+S27pviBSGJZ/mFri42JE54f12IMQ1
	3OxJ9ztlzd+DUC051+xKPTiMoxxa7TlL94Gzglxjqu0+PzjZIfCudiFnKdNuBsZxcSeRlUBQm+eGb
	4fZ0Sy3hjHLWsdqIx3tttna7SeTRhPF0tNzbHiy9k5eeu8qNAiHYupPkwtn539S2iwXE+9mWHsIL6
	3+eB02nSQ0fCn6YjoiqIC/6wYNp+6HF8ylB2oVWqhydpmwKIva+1O3p2KpRnPAZl8ZVaNottI5vuG
	zCCwyS+iY8OMBdOuVSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFWX-00000009UjB-0HmM;
	Tue, 19 Aug 2025 06:08:45 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFWU-00000009UiM-1fg7
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 06:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755583722; x=1787119722;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PIGAqEtTTYvCvzWDp2EVHzDBSJuJo5cietEx2uHRM+E=;
  b=RM/Joq9pL+b9JeM44E4eV+3hMGLVxAklOB81b7/+7BDdBmZfH3K92VSQ
   2Bca5jFz8JUVX3XG/oNmmg1crpXWTYS2cQDsEmZ80+VveHq8FhRUQ3LSO
   RBJy/rteS2pyiciEXo4SUoo4wqj/7ReiWw1YlGSng/us59lOnEUWntQZZ
   KKLxPGJDSbJIy9b0NaAb5G5v0827p+l3FESV4hMoTxtHW7ClNDYZZlwDR
   8l7HdIK+qaUVwTbKuadhaxdEiyWBMBKrkqtNAAtfIjAIaAfCSdUzh8xyk
   4sBcfG5L+yvepaWv5dwCmFlbdWMI4Lhs77/FzT/XdgKHFltJChwiicy+D
   Q==;
X-CSE-ConnectionGUID: a/PnpgrJQiSqShHjd0MgZQ==
X-CSE-MsgGUID: dl9xbgR/TPypfX7vkYsJaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57744054"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57744054"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 23:08:39 -0700
X-CSE-ConnectionGUID: D28oGXRqRpGq+rreVtr40A==
X-CSE-MsgGUID: xL1Ksi+aQ/mJkYWhhlH5+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172193445"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2025 23:08:37 -0700
Message-ID: <8c3627b9-9730-4ced-aaa1-f9003b4e942f@linux.intel.com>
Date: Tue, 19 Aug 2025 09:08:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] i3c: master: Add helpers for DMA mapping and
 bounce buffer handling
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-2-jarkko.nikula@linux.intel.com>
 <aKNPp+xieX4soWCj@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aKNPp+xieX4soWCj@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_230842_457940_2A68E27F 
X-CRM114-Status: GOOD (  17.42  )
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

On 8/18/25 7:07 PM, Frank Li wrote:
> On Fri, Aug 15, 2025 at 05:12:39PM +0300, Jarkko Nikula wrote:
>> Some I3C controllers such as MIPI I3C HCI may pad the last DWORD (32-bit)
>> with stale data from the RX FIFO in DMA transfers if the receive length
>> is not DWORD aligned and when the device DMA is IOMMU mapped.
>>
>> In such a case, a properly sized bounce buffer is required in order to
>> avoid possible data corruption. In a review discussion, proposal was to
>> have a common helpers in I3C core for DMA mapping and bounce buffer
>> handling.
>>
>> Drivers may use the helper i3c_master_dma_map_single() to map a buffer
>> for a DMA transfer. It internally allocates a bounce buffer if buffer is
>> not DMA'able or when the driver requires it for a transfer.
>>
>> Helper i3c_master_dma_unmap_single() does the needed cleanups and
>> data copying from the bounce buffer.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master.c       | 69 ++++++++++++++++++++++++++++++++++++++
>>   include/linux/i3c/master.h | 26 ++++++++++++++
>>   2 files changed, 95 insertions(+)
>>
>> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
>> index 2ef898a8fd80..497bff57248a 100644
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
>> @@ -1727,6 +1728,74 @@ int i3c_master_do_daa(struct i3c_master_controller *master)
>>   }
>>   EXPORT_SYMBOL_GPL(i3c_master_do_daa);
>>
>> +/**
>> + * i3c_master_dma_map_single() - Map buffer for single DMA transfer
>> + * @dev: device object of a device doing DMA
>> + * @buf: destination/source buffer for DMA
>> + * @len: length of transfer
>> + * @need_bounce: true if buffer is not DMA safe and need a bounce buffer
>> + * @dir: DMA direction
>> + *
>> + * Map buffer for a DMA transfer and allocate a bounce buffer if required.
>> + *
>> + * Return: I3C DMA transfer descriptor or NULL in case of error.
>> + */
>> +struct i3c_dma *i3c_master_dma_map_single(struct device *dev, void *buf,
>> +	size_t len, bool need_bounce, enum dma_data_direction dir)
>> +{
>> +	struct i3c_dma *dma_xfer __free(kfree) = NULL;
>> +	void *bounce __free(kfree) = NULL;
>> +	void *dma_buf = buf;
>> +
>> +	dma_xfer = kzalloc(sizeof(*dma_xfer), GFP_KERNEL);
>> +	if (!dma_xfer)
>> +		return NULL;
> 
> nit: add empty line here
> 
>> +	dma_xfer->dev = dev;
>> +	dma_xfer->buf = buf;
>> +	dma_xfer->dir = dir;
>> +	dma_xfer->len = len;
>> +	dma_xfer->map_len = len;
>> +
>> +	if (is_vmalloc_addr(buf))
>> +		need_bounce = true;
>> +
>> +	if (need_bounce) {
>> +		dma_xfer->map_len = ALIGN(len, cache_line_size());
>> +		if (dir == DMA_FROM_DEVICE)
>> +			bounce = kzalloc(dma_xfer->map_len, GFP_KERNEL);
>> +		else
>> +			bounce = kmemdup(buf, dma_xfer->map_len, GFP_KERNEL);
>> +		if (!bounce)
>> +			return NULL;
>> +		dma_buf = bounce;
>> +	}
>> +
>> +	dma_xfer->addr = dma_map_single(dev, dma_buf, dma_xfer->map_len, dir);
>> +	if (dma_mapping_error(dev, dma_xfer->addr))
>> +		return NULL;
>> +
>> +	dma_xfer->bounce_buf = no_free_ptr(bounce);
>> +	return no_free_ptr(dma_xfer);
>> +}
>> +EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
>> +
>> +/**
>> + * i3c_master_dma_unmap_single() - Unmap buffer after DMA
>> + * @dma_xfer: DMA transfer and mapping descriptor
>> + *
>> + * Unmap buffer and cleanup DMA transfer descriptor.
>> + */
>> +void i3c_master_dma_unmap_single(struct i3c_dma *dma_xfer)
>> +{
>> +	struct i3c_dma *d __free(kfree) = dma_xfer;
>> +	void *bounce __free(kfree) = d->bounce_buf;
> 
> This simple free, call free(dma_xfer) after memcpy directly.
> 
I'm confused. So should I use __free() infra only in 
i3c_master_dma_map_single() and use explicit kfree() for dma_xfer and 
bounce_buf here?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
