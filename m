Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D37C5AE59
	for <linux-i3c@archiver.kernel.org>; Thu,  5 Jun 2025 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRTTeGsbcaw5c2bpCivhaXyjdw7iXjCjq6xZdnFMGEk=; b=IZWchjImsBAexK
	wvtIimKteymJx6tRljRfE15dzrQf8Lwn9XehC4V9Ua2HtpfZKdnN3TQ8MFbY3HDENifq80f1MbCwU
	3ifBZU23R0mzlORZZlSYHn0Zwd9jSqok5mlO2HCqFePvYDvFVREVP7IekYy+jet268guA7cZEb5wg
	5x7f85dqRwOg4qs5wIPIsfH2EKgGi4t9MA5kjGLtXpCw9kAZvM1FXerfwCod8f3Ii8SQ10E5DSed6
	I8FAPKj0V/3zKkEmzk80lFyfYEd8+ozuaFvcINrLZb7kYfezOgf5DOShh9vtkmrrM9jjI7Mr8XLcD
	YcamIIx4oLn8FXbPgNMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBNk-0000000FkT3-1R51;
	Thu, 05 Jun 2025 14:15:48 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBFb-0000000FjTH-2y0y
	for linux-i3c@lists.infradead.org;
	Thu, 05 Jun 2025 14:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749132444; x=1780668444;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fP3E0TPRZPKCsxGV+j+OjJISiSlS2dQrovmKbR7WLsQ=;
  b=JyCuryWgpygetn4CW4Yrt2t5GRn+PKsKRQRZF0eugg/C6AeBg+e0Sgbq
   ca4l8elwp1Qy6ZSWDwM97IFuXjkDJNP/OZgg3HHTA1zbIviUyK1wgY6a2
   4VcV59AiHmOYeuzrxXiSjNMKoY+4zNc4XsaZj+7nKVIPBXtaE1YKaPE+B
   DdagQf6pt7kTZMv08EYveYgiL7jRnsfZv0Ch601sLr8/FYDFeqGv+hHmB
   FYKNO0Ze+oT55+FDeS5mK9u7RZMUPnrmixeoyFzTWOxkZN/13c1wVBRN5
   /dU2UAHUxrtZtzgHEzQYQvMlqP3mmwWRXNIC94MoaeGHUiiLlSNA7ISQr
   A==;
X-CSE-ConnectionGUID: 5hK6fYsNTkusZXZtDyJdqQ==
X-CSE-MsgGUID: 3UOSudw2RDGYsKvPELFqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51346706"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="51346706"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 07:07:22 -0700
X-CSE-ConnectionGUID: uf/DCkGFTcKHYa4Z4Vo4Vg==
X-CSE-MsgGUID: lFQZiyveQD6ephmkDPCEhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="146498436"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa008.jf.intel.com with ESMTP; 05 Jun 2025 07:07:21 -0700
Message-ID: <bc599310-9287-4023-a204-682771574528@linux.intel.com>
Date: Thu, 5 Jun 2025 17:07:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic to
 all DMA transfers
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_070723_799279_979818F9 
X-CRM114-Status: GOOD (  22.23  )
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

On 6/4/25 6:00 PM, Frank Li wrote:
> On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
>> Move DMA bounce buffer code for I3C private transfers to be generic for
>> all DMA transfers, and round up the receive bounce buffer size to a
>> multiple of DWORDs.
>>
>> It was observed that when the device DMA is IOMMU mapped and the receive
>> length is not a multiple of DWORDs, the last DWORD is padded with stale
>> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
>>
>> A similar issue, though less severe, occurs when an I3C target returns
>> less data than requested. In this case, the padding does not exceed the
>> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>>
>> Therefore, all I3C private transfer, CCC command payload and I2C
>> transfer receive buffers must be properly sized for the DMA being IOMMU
>> mapped. Even if those buffers are already DMA safe, their size may not
>> be, and I don't have a clear idea how to guarantee this other than
>> using a local bounce buffer.
>>
>> To prepare for the device DMA being IOMMU mapped and to address the
>> above issue, implement a local, properly sized bounce buffer for all
>> DMA transfers. For now, allocate it only when the buffer is in the
>> vmalloc() area to avoid unnecessary copying with CCC commands and
>> DMA-safe I2C transfers.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
>>   drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
>>   2 files changed, 46 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index bc4538694540..24c5e7d5b439 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>>   	return hci->cmd->perform_daa(hci);
>>   }
>>
> ...
>>   }
>>
>> +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
>> +					 struct hci_xfer *xfer)
>> +{
>> +	if (!is_vmalloc_addr(xfer->data))
>> +		return xfer->data;
>> +
>> +	if (xfer->rnw)
>> +		/*
>> +		 * Round up the receive bounce buffer length to a multiple of
>> +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
>> +		 * transfers may corrupt the last DWORD when transfer length is
>> +		 * not a multiple of DWORDs. This was observed when the device
>> +		 * DMA is IOMMU mapped or when an I3C target device returns
>> +		 * less data than requested. Latter case is less severe and
>> +		 * does not exceed the requested number of bytes, assuming the
>> +		 * device DMA is not IOMMU mapped.
>> +		 */
>> +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
>> +					   GFP_KERNEL);
>> +	else
>> +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
>> +					   GFP_KERNEL);
>> +
>> +	return xfer->bounce_buf;
> 
> Why need use bounce_buf? why not use dma_map_single()?, which will check
> alignment and size to decide if use swiotlb as bounce buffer.
> 
We do pass the buffer to the dma_map_single(). I've understood swiotlb 
is transparently used when the DMA cannot directly access the memory but 
that's not the case here.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
