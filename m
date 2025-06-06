Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5DBC5AD49
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Jun 2025 07:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xv1sF7BEKSKWs4r9UHMd62oyNviYh2QP+PMp93q4UTE=; b=P/wIURLyX5LwiI
	vMGRWP6p/K3c47IPxcpNF/7mDhpNEdq1YFmyVgQkyRJkM3j3zyHcKJ8NpK1UMG/AOiwNcSrx1nwTy
	S84vK10lHg6ZI31iRGzbDrWymxGe48iw37u8YC6IOyFIYZiJpim/0sTPkPhE+CQlR6j2uclQ8hQ/Q
	NVuqyUX+BFheJuEaY8IwbYR37krFlrymgxp3T1dU0OjK6u93H8Uvu5Ol7dQeyV8WsRSdGiHFhvHHo
	D8VWgf1MvxAxPuciMYA4Uwep94FZEncEdDT+HI4jRJ3F1NHLPOq5PXnhNzmk3HQtRN1yoP7M4M/JA
	sE7BhyWRAA++jtscK4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRJq-0000000HI00-0TLA;
	Fri, 06 Jun 2025 07:16:50 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNRJn-0000000HHzB-2BQn
	for linux-i3c@lists.infradead.org;
	Fri, 06 Jun 2025 07:16:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749194207; x=1780730207;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tLkwHBgM8yd5OGnGRWP9Tfow7LXgI5RgJzdTr7zocrA=;
  b=F75sBO0eYhNzXW7MxTbd1AGH2n0jO1RjsIyKgOE5ZEWu4usSoh5jRedK
   VQ77DJxcausZ6C58YxgqqPf9znP6OrmJUQV0md2wl90i6P4bevEdRj4zu
   8UrFvyQPWyBTimMFZWLJZaVHXWAkkj31aljsMYLTqz4z+r2Bbo1qK78Fu
   qeKg76Kwfuv7CIrMpWvM7Yf99DpwYCgOr68zq7QSbtxPySrjpiqY0L9Y1
   iiBhHF8lbclj6vOwb/v9FK0bibY4PC1uEqf9VAblmPNAaUi0J9e1QXWJn
   3MJE7yet5pNrpKh1ASVBPYirliQVN/HeEe7gvKS/UEq3+iVLTVb/yHuYR
   Q==;
X-CSE-ConnectionGUID: CuJyYWCVQJmlP+5+U8CfMQ==
X-CSE-MsgGUID: X/hPkJAJTzGVs4crqSEWiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51247061"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="51247061"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 00:16:46 -0700
X-CSE-ConnectionGUID: 7Km1qKgPQ+OVRFCc5RRfig==
X-CSE-MsgGUID: W0uxOt9QSkKGPSUA/oAZaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; 
   d="scan'208";a="151008969"
Received: from mylly.fi.intel.com (HELO [10.237.72.154]) ([10.237.72.154])
  by orviesa005.jf.intel.com with ESMTP; 06 Jun 2025 00:16:45 -0700
Message-ID: <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
Date: Fri, 6 Jun 2025 10:16:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic to
 all DMA transfers
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_001647_585413_1333DC8F 
X-CRM114-Status: GOOD (  19.83  )
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

On 6/5/25 6:13 PM, Frank Li wrote:
> On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
>> Hi
>>
>> On 6/4/25 6:00 PM, Frank Li wrote:
>>> On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
>>>> Move DMA bounce buffer code for I3C private transfers to be generic for
>>>> all DMA transfers, and round up the receive bounce buffer size to a
>>>> multiple of DWORDs.
>>>>
>>>> It was observed that when the device DMA is IOMMU mapped and the receive
>>>> length is not a multiple of DWORDs, the last DWORD is padded with stale
>>>> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
>>>>
>>>> A similar issue, though less severe, occurs when an I3C target returns
>>>> less data than requested. In this case, the padding does not exceed the
>>>> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>>>>
>>>> Therefore, all I3C private transfer, CCC command payload and I2C
>>>> transfer receive buffers must be properly sized for the DMA being IOMMU
>>>> mapped. Even if those buffers are already DMA safe, their size may not
>>>> be, and I don't have a clear idea how to guarantee this other than
>>>> using a local bounce buffer.
>>>>
>>>> To prepare for the device DMA being IOMMU mapped and to address the
>>>> above issue, implement a local, properly sized bounce buffer for all
>>>> DMA transfers. For now, allocate it only when the buffer is in the
>>>> vmalloc() area to avoid unnecessary copying with CCC commands and
>>>> DMA-safe I2C transfers.
>>>>
>>>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>>> ---
>>>>    drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
>>>>    drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
>>>>    2 files changed, 46 insertions(+), 35 deletions(-)
>>>>
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> index bc4538694540..24c5e7d5b439 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>>>>    	return hci->cmd->perform_daa(hci);
>>>>    }
>>>>
>>> ...
>>>>    }
>>>>
>>>> +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
>>>> +					 struct hci_xfer *xfer)
>>>> +{
>>>> +	if (!is_vmalloc_addr(xfer->data))
>>>> +		return xfer->data;
>>>> +
>>>> +	if (xfer->rnw)
>>>> +		/*
>>>> +		 * Round up the receive bounce buffer length to a multiple of
>>>> +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
>>>> +		 * transfers may corrupt the last DWORD when transfer length is
>>>> +		 * not a multiple of DWORDs. This was observed when the device
>>>> +		 * DMA is IOMMU mapped or when an I3C target device returns
>>>> +		 * less data than requested. Latter case is less severe and
>>>> +		 * does not exceed the requested number of bytes, assuming the
>>>> +		 * device DMA is not IOMMU mapped.
>>>> +		 */
>>>> +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
>>>> +					   GFP_KERNEL);
>>>> +	else
>>>> +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
>>>> +					   GFP_KERNEL);
>>>> +
>>>> +	return xfer->bounce_buf;
>>>
>>> Why need use bounce_buf? why not use dma_map_single()?, which will check
>>> alignment and size to decide if use swiotlb as bounce buffer.
>>>
>> We do pass the buffer to the dma_map_single(). I've understood swiotlb is
>> transparently used when the DMA cannot directly access the memory but that's
>> not the case here.
> 
> why not? even though you have to use internal buf, why not use
> dma_alloc_coherent().
> 
I don't think it's suitable for "smallish" per transfer 
allocations/mappings and buffer is not accessed concurrently by the CPU 
and DMA during the transfer.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
