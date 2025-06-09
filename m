Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FCC61CE8
	for <linux-i3c@archiver.kernel.org>; Mon,  9 Jun 2025 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/Guna4S0s1B0JOMiH07EDAeJ977E2IQc6raFhBEhUA=; b=mI4u1xYV82Laqr
	k5P9bbK36LFrnD203xA8BDYeBvaTUuCA/YPrNQL2ZMEiLZoHHpRwfvMmtjZRWchJT4NW85RNRX8ct
	Jsb+RDjcWVF30KJLqZ4w6AlQ2r1Ff0ymqTwg0XCaCg5XGMh9Z6roalgSPdbPZnbgc0T5DHR7lx2UL
	Ee7JuwG3Cg/H3/F0ikVwuXqWfustVY+2i9uA72Q9t3qnEsxddW14IcdGv6YsawqTlyd2+PUVdNU3h
	leEivT8fZITQ4JUy5Lj7AHACWTlNbBTbQJB+XbJH+Ctwi6mCeNG9v6TFYYG23tNywWoqEslZtWqC7
	6XQtozKYydW3Xs7zdFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdHy-00000004MUJ-1suD;
	Mon, 09 Jun 2025 14:15:50 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdHw-00000004MTw-0SGT
	for linux-i3c@lists.infradead.org;
	Mon, 09 Jun 2025 14:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749478548; x=1781014548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HWsGgzR0VY2uhJg13i1oWXoJgD2m2N11t9Fkyhix6ZE=;
  b=KP/9lkXYnTJA5ie/oFB9myqQatI+Y4Cj8HSm7cKh0e/ELAph4j4qAaxF
   9tMpo2usziS9Utk69rkNB4x2k7wA6TVnyLFex2e90Zrj2hnKCr1pW6NbZ
   7+qDpczz2QayJSWLsRaKjQGGEbW0lyige8UZ0SOY1LJrBblUa0sjpd9WM
   1r8VVfKLSKMoLqcFwJgxxkpJoX20i4qD9mTH4k0sT73AhAjbIpKXnrrJC
   isjbTNE8GQiZ4jWRvirc+NyixGBdjo28f0qSgur6B5+ezqSer/Otdf6vG
   IVYCIQK0l0ptTnoon/6A/vdG7UDOei7l0v1c8MZANPTSTRon/AC2Vy62q
   w==;
X-CSE-ConnectionGUID: 2tCu3TpDQR6jghtQejz6gA==
X-CSE-MsgGUID: 9UZcrVZiTPOAYA/rPKMUMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="76953317"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="76953317"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 07:15:47 -0700
X-CSE-ConnectionGUID: DXTNZFjLRdWPTlq5J2wc5g==
X-CSE-MsgGUID: tEjhYeY5RxCSzp330tdZhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146431268"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa006.jf.intel.com with ESMTP; 09 Jun 2025 07:15:46 -0700
Message-ID: <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
Date: Mon, 9 Jun 2025 17:15:44 +0300
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
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_071548_172549_C05CCC2E 
X-CRM114-Status: GOOD (  23.25  )
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

On 6/6/25 6:02 PM, Frank Li wrote:
> On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
>> Hi
>>
>> On 6/5/25 6:13 PM, Frank Li wrote:
>>> On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
>>>> Hi
>>>>
>>>> On 6/4/25 6:00 PM, Frank Li wrote:
>>>>> On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
>>>>>> Move DMA bounce buffer code for I3C private transfers to be generic for
>>>>>> all DMA transfers, and round up the receive bounce buffer size to a
>>>>>> multiple of DWORDs.
>>>>>>
>>>>>> It was observed that when the device DMA is IOMMU mapped and the receive
>>>>>> length is not a multiple of DWORDs, the last DWORD is padded with stale
>>>>>> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
>>>>>>
>>>>>> A similar issue, though less severe, occurs when an I3C target returns
>>>>>> less data than requested. In this case, the padding does not exceed the
>>>>>> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>>>>>>
>>>>>> Therefore, all I3C private transfer, CCC command payload and I2C
>>>>>> transfer receive buffers must be properly sized for the DMA being IOMMU
>>>>>> mapped. Even if those buffers are already DMA safe, their size may not
>>>>>> be, and I don't have a clear idea how to guarantee this other than
>>>>>> using a local bounce buffer.
>>>>>>
>>>>>> To prepare for the device DMA being IOMMU mapped and to address the
>>>>>> above issue, implement a local, properly sized bounce buffer for all
>>>>>> DMA transfers. For now, allocate it only when the buffer is in the
>>>>>> vmalloc() area to avoid unnecessary copying with CCC commands and
>>>>>> DMA-safe I2C transfers.
>>>>>>
>>>>>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>>>>> ---
>>>>>>     drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
>>>>>>     drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
>>>>>>     2 files changed, 46 insertions(+), 35 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>> index bc4538694540..24c5e7d5b439 100644
>>>>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>>>>>>     	return hci->cmd->perform_daa(hci);
>>>>>>     }
>>>>>>
>>>>> ...
>>>>>>     }
>>>>>>
>>>>>> +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
>>>>>> +					 struct hci_xfer *xfer)
>>>>>> +{
>>>>>> +	if (!is_vmalloc_addr(xfer->data))
>>>>>> +		return xfer->data;
>>>>>> +
>>>>>> +	if (xfer->rnw)
>>>>>> +		/*
>>>>>> +		 * Round up the receive bounce buffer length to a multiple of
>>>>>> +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
>>>>>> +		 * transfers may corrupt the last DWORD when transfer length is
>>>>>> +		 * not a multiple of DWORDs. This was observed when the device
>>>>>> +		 * DMA is IOMMU mapped or when an I3C target device returns
>>>>>> +		 * less data than requested. Latter case is less severe and
>>>>>> +		 * does not exceed the requested number of bytes, assuming the
>>>>>> +		 * device DMA is not IOMMU mapped.
>>>>>> +		 */
>>>>>> +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
>>>>>> +					   GFP_KERNEL);
>>>>>> +	else
>>>>>> +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
>>>>>> +					   GFP_KERNEL);
>>>>>> +
>>>>>> +	return xfer->bounce_buf;
>>>>>
>>>>> Why need use bounce_buf? why not use dma_map_single()?, which will check
>>>>> alignment and size to decide if use swiotlb as bounce buffer.
>>>>>
>>>> We do pass the buffer to the dma_map_single(). I've understood swiotlb is
>>>> transparently used when the DMA cannot directly access the memory but that's
>>>> not the case here.
>>>
>>> why not? even though you have to use internal buf, why not use
>>> dma_alloc_coherent().
>>>
>> I don't think it's suitable for "smallish" per transfer allocations/mappings
>> and buffer is not accessed concurrently by the CPU and DMA during the
>> transfer.
> 
> I still can't understand why need this special handle for i3c. Basic it use
> dma transfer to transfer data. Can you simple descript hci's data flow?
> 
Unfortunately my knowledge doesn't go deeply enough in HW but I could 
guess it's somewhere in MIPI I3C HCI DMA engine implementation and/or 
HCI IP to memory bridge/bus integration.

If it would be a cache line issue then I would think we would see 
corruption independently is the DMA IOMMU mapped or not and in larger 
number of bytes than 1-3 last bytes.

Also another finding that if I3C target returns less data than expected 
then there is also padding in the last DWORD with the real data. But not 
more than requested, i.e. 2 bytes expected, target returns 1, only the 
2nd byte contains stale data and bytes 3-4 untouched. Or 8 bytes 
expected, target returns 1, bytes 2-4 contain stale data and bytes 5-8 
untouched.

So something around trailing bytes handling in the HW when the transfer 
length is not multiple of DWORDs as far as I could guess.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
