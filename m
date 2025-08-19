Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FB2CA0EE6
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCDXIHbdgT/JL9q63NZ5iqpCfJgjowRh79XDddlpDBM=; b=jpyVpJYUOykaJN
	mHBB+YLiyxcJPabOJANcN/4Y1ZO1jtdeG/sem2BugV25uxXoHOibYpzWvO3mx5lNWfQ4yjWqxj/C8
	EABQToEeUasf8XKfiSWcSKFLP0UJKWXPH3+7EvUkOFIZK3ExD7sC/b86vosJTG50p0A0Bmu1F9enF
	bC1hK6P+/kdowcwJpMiuBJ+VPmkLjLJjOxsmXE7xWQTzXpcM8ENRPK1F6HFKaGkgCuBuyxdm6RPs5
	/huF2mbhRgiZifOWbWfTBn1Zlvd4UZKx7hEskIADkat8qsKznM9kgeLULhx6LMgthoVOPSYyuJBNh
	2xbGfvQWJllfskyspE1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFoL-00000009Wvi-0qJG;
	Tue, 19 Aug 2025 06:27:09 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFoJ-00000009Wv4-1011
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 06:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755584827; x=1787120827;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xK7ivau+1ivhcjsujlzr0F6Lwsz8B6//Wz8LVwOh5f4=;
  b=BLxYOq0s6jZCS0dIx40EWONAT82vntWtaGlpypOb26lOR6AF8uyKIs6W
   /JNwqgdZ0jQkOd1FXWMscgWbuc8NYlo5VhfChxMxt/0549rpYZebrI37O
   OF7rc+A+Xgb69w0Ev+3onB/bh/s+cHvrgQcMyqdM5KVkSWdoadyG3jXKs
   2IncArWmhmlQRmqCyMoq+Z9dsK6QOZY2TYxs5DohqY4uO6/p3ZKzNtcNk
   1LfjiIY3H4Qh4ebgEbC2h4yP7yNqRO2m9rTBCV1nypS+IK5AjdH27UWCi
   x2KGymqEFOpUih4NFM4FWjto3uy9wgZj1iZ2Jub4yjQC2KpaLX+G+UoiE
   A==;
X-CSE-ConnectionGUID: uX+IowiSSkSHwvlsiyXMIQ==
X-CSE-MsgGUID: bGRGAK88SF+IPIyx1E3HvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57889628"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57889628"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 23:27:07 -0700
X-CSE-ConnectionGUID: v8+aOGLgSBKLAt2ZkJP1/Q==
X-CSE-MsgGUID: PIsrqnH2TO6E8oWmjEN8Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171993916"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2025 23:27:05 -0700
Message-ID: <30b5a638-a571-4cd6-9779-fc5608cbbeca@linux.intel.com>
Date: Tue, 19 Aug 2025 09:27:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] i3c: mipi-i3c-hci: Use physical device pointer
 with DMA API
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-4-jarkko.nikula@linux.intel.com>
 <aKNUqY4h9DEAP69o@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aKNUqY4h9DEAP69o@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_232707_296740_BDCECE60 
X-CRM114-Status: GOOD (  26.59  )
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

On 8/18/25 7:28 PM, Frank Li wrote:
> On Fri, Aug 15, 2025 at 05:12:41PM +0300, Jarkko Nikula wrote:
>> DMA transfer faults on Intel hardware when the IOMMU is enabled and
>> driver initialization will fail when attempting to do the first transfer:
>>
>> 	DMAR: DRHD: handling fault status reg 2
>> 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry is clear
>>   	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
>> 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
>>
>> Reason for this is that the IOMMU setup is done for the physical devices
>> only and not for the virtual I3C Controller device object.
>>
>> Therefore use the pointer to a physical device object with the DMA API.
>>
>> Due to a data corruption observation when the device DMA is IOMMU
>> mapped, a properly sized receive bounce buffer is required if transfer
>> length is not a multiple of DWORDs.
>>
>> Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/dma.c | 46 +++++++++++++++++++--------
>>   1 file changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 295671daae09..8cea91d4d3bf 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/errno.h>
>>   #include <linux/i3c/master.h>
>>   #include <linux/io.h>
>> +#include <linux/pci.h>
>>
>>   #include "hci.h"
>>   #include "cmd.h"
>> @@ -138,6 +139,7 @@ struct hci_rh_data {
>>   };
>>
>>   struct hci_rings_data {
>> +	struct device *sysdev;
>>   	unsigned int total;
>>   	struct hci_rh_data headers[] __counted_by(total);
>>   };
>> @@ -165,20 +167,20 @@ static void hci_dma_cleanup(struct i3c_hci *hci)
>>   		rh_reg_write(IBI_SETUP, 0);
>>
>>   		if (rh->xfer)
>> -			dma_free_coherent(&hci->master.dev,
>> +			dma_free_coherent(rings->sysdev,
>>   					  rh->xfer_struct_sz * rh->xfer_entries,
>>   					  rh->xfer, rh->xfer_dma);
>>   		if (rh->resp)
>> -			dma_free_coherent(&hci->master.dev,
>> +			dma_free_coherent(rings->sysdev,
>>   					  rh->resp_struct_sz * rh->xfer_entries,
>>   					  rh->resp, rh->resp_dma);
>>   		kfree(rh->src_xfers);
>>   		if (rh->ibi_status)
>> -			dma_free_coherent(&hci->master.dev,
>> +			dma_free_coherent(rings->sysdev,
>>   					  rh->ibi_status_sz * rh->ibi_status_entries,
>>   					  rh->ibi_status, rh->ibi_status_dma);
>>   		if (rh->ibi_data_dma)
>> -			dma_unmap_single(&hci->master.dev, rh->ibi_data_dma,
>> +			dma_unmap_single(rings->sysdev, rh->ibi_data_dma,
>>   					 rh->ibi_chunk_sz * rh->ibi_chunks_total,
>>   					 DMA_FROM_DEVICE);
>>   		kfree(rh->ibi_data);
>> @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   {
>>   	struct hci_rings_data *rings;
>>   	struct hci_rh_data *rh;
>> +	struct device *sysdev;
>>   	u32 regval;
>>   	unsigned int i, nr_rings, xfers_sz, resps_sz;
>>   	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>>   	int ret;
>>
>> +	/*
>> +	 * Set pointer to a physical device that does DMA and has IOMMU setup
>> +	 * done for it in case of enabled IOMMU and use it with the DMA API.
>> +	 * Here such device is either
>> +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
>> +	 * grandparent (PCI enumeration).
>> +	 */
>> +	sysdev = hci->master.dev.parent;
>> +	if (sysdev->parent && dev_is_pci(sysdev->parent))
>> +		sysdev = sysdev->parent;
>> +
>>   	regval = rhs_reg_read(CONTROL);
>>   	nr_rings = FIELD_GET(MAX_HEADER_COUNT_CAP, regval);
>>   	dev_info(&hci->master.dev, "%d DMA rings available\n", nr_rings);
>> @@ -213,6 +227,7 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   		return -ENOMEM;
>>   	hci->io_data = rings;
>>   	rings->total = nr_rings;
>> +	rings->sysdev = sysdev;
>>
>>   	regval = FIELD_PREP(MAX_HEADER_COUNT, rings->total);
>>   	rhs_reg_write(CONTROL, regval);
>> @@ -239,9 +254,9 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   		xfers_sz = rh->xfer_struct_sz * rh->xfer_entries;
>>   		resps_sz = rh->resp_struct_sz * rh->xfer_entries;
>>
>> -		rh->xfer = dma_alloc_coherent(&hci->master.dev, xfers_sz,
>> +		rh->xfer = dma_alloc_coherent(rings->sysdev, xfers_sz,
>>   					      &rh->xfer_dma, GFP_KERNEL);
>> -		rh->resp = dma_alloc_coherent(&hci->master.dev, resps_sz,
>> +		rh->resp = dma_alloc_coherent(rings->sysdev, resps_sz,
>>   					      &rh->resp_dma, GFP_KERNEL);
>>   		rh->src_xfers =
>>   			kmalloc_array(rh->xfer_entries, sizeof(*rh->src_xfers),
>> @@ -295,16 +310,16 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   		ibi_data_ring_sz = rh->ibi_chunk_sz * rh->ibi_chunks_total;
>>
>>   		rh->ibi_status =
>> -			dma_alloc_coherent(&hci->master.dev, ibi_status_ring_sz,
>> +			dma_alloc_coherent(rings->sysdev, ibi_status_ring_sz,
>>   					   &rh->ibi_status_dma, GFP_KERNEL);
>>   		rh->ibi_data = kmalloc(ibi_data_ring_sz, GFP_KERNEL);
>>   		ret = -ENOMEM;
>>   		if (!rh->ibi_status || !rh->ibi_data)
>>   			goto err_out;
>>   		rh->ibi_data_dma =
>> -			dma_map_single(&hci->master.dev, rh->ibi_data,
>> +			dma_map_single(rings->sysdev, rh->ibi_data,
>>   				       ibi_data_ring_sz, DMA_FROM_DEVICE);
>> -		if (dma_mapping_error(&hci->master.dev, rh->ibi_data_dma)) {
>> +		if (dma_mapping_error(rings->sysdev, rh->ibi_data_dma)) {
>>   			rh->ibi_data_dma = 0;
>>   			ret = -ENOMEM;
>>   			goto err_out;
>> @@ -369,6 +384,7 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>   		u32 *ring_data = rh->xfer + rh->xfer_struct_sz * enqueue_ptr;
>>   		enum dma_data_direction dir = xfer->rnw ? DMA_FROM_DEVICE :
>>   							  DMA_TO_DEVICE;
>> +		bool need_bounce;
>>
>>   		/* store cmd descriptor */
>>   		*ring_data++ = xfer->cmd_desc[0];
>> @@ -387,10 +403,13 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>
>>   		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>>   		if (xfer->data) {
>> -			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
>> +			need_bounce = device_iommu_mapped(rings->sysdev) &&
>> +				      xfer->rnw &&
> 
> why only read need bounce? if iommu have not map enough size, still fault
> for write.
> 
> such as you try to map IO space [0xffd,0x1000). when hardware try access
> 0x1000, iommu will capture this type error. Maybe it is hard to meet
> allocate io space at close end of page, you have not found this problem.
> 
Yes, only read has been problematic so far on our HW when the device is 
IOMMU mapped and write works fine with or without IOMMU. In my opinnion 
it's better to have another patch if such issue is seen on some other HW.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
