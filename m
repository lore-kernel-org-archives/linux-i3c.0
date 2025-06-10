Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DBDC5B552
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Jun 2025 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhTu7RKAiq80pKtNizr3BOA8bxsc7NabNkmZy/Dpbf8=; b=gYUadiZgJxAOx8
	BzqBRS0OH5yW/UEHu5mDDN3IgJt+0erx2sj8MrF9EAF7DAia2+a/wiZE3wZsqhg84WML8+Tq8Fgin
	OVbTOWNMS8XKzyG/LmRqt2u2J/DeJl85mUakLgBoVTsVPoKkXDv1xbKuITN+8sKtgGfUbQT2uLKAz
	ld0YAsnkgyUZQ5B5wyoenEG4fRrjCYgaG0tKw78r0uor/3yNw+cAIba9lb7DZLn5ipRtclvZF79eo
	2Zrl3sAsbzf80Odds4M0yf3T55+nleRWuU59/UrY8T/qLwVoL6ndFv2OrmxeqZ3f1rEmUbugI2Eeh
	0airaioPD/7vqj/wMy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1lE-00000007SMF-1kHk;
	Tue, 10 Jun 2025 16:23:40 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzFP-000000070z0-2MLy
	for linux-i3c@lists.infradead.org;
	Tue, 10 Jun 2025 13:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749562959; x=1781098959;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nz5sHSIgOZ3ldRk3ZekEoOqSHUxxYlMVYeLHkw1KC0o=;
  b=PTj844InsvQF7TgMgdV+Ljk9GfBFcT62hfzH245jycq+Zx6FuVOFKLOx
   Ig9HL2MEzm2mM6Xc6mc27UC9vi4NjvLqAN9YEqhgOaj24lOOBAEZGdUiO
   qxQi+smA5N+2AWHdi09q0nRANexZ3c7IRc4PH5HH2kl3FOB0a69kj33i5
   5OG8+TMoeNiKCbG3E7kbiD9LFBxZJc/4pkTtAWnAYaW4zCitVkuZ8d0S+
   jNt0gFY64Jl0u1TAKLDYa41T57kd1TqkyBjUJcJfraPffRHGfIoc+8tZQ
   W5hzVPwWxzQBlIrcj6UA4ip09c9CK+Vh9C5aqmc9dpXeg1CFQxU4TG2fi
   w==;
X-CSE-ConnectionGUID: KmwANZsHRnaUcmpXFE3eWA==
X-CSE-MsgGUID: jCCTBFCrQZijoz/XN4VaJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77077254"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="77077254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 06:42:37 -0700
X-CSE-ConnectionGUID: d95vjA9GRzuvElSZ+Y899Q==
X-CSE-MsgGUID: l74w0jLmTY6k5DR6SP4cMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="150690272"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jun 2025 06:42:37 -0700
Message-ID: <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
Date: Tue, 10 Jun 2025 16:42:35 +0300
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
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064239_622718_06FFA2A5 
X-CRM114-Status: GOOD (  32.40  )
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

On 6/9/25 6:04 PM, Frank Li wrote:
> On Mon, Jun 09, 2025 at 05:15:44PM +0300, Jarkko Nikula wrote:
>> On 6/6/25 6:02 PM, Frank Li wrote:
>>> On Fri, Jun 06, 2025 at 10:16:44AM +0300, Jarkko Nikula wrote:
>>>> Hi
>>>>
>>>> On 6/5/25 6:13 PM, Frank Li wrote:
>>>>> On Thu, Jun 05, 2025 at 05:07:19PM +0300, Jarkko Nikula wrote:
>>>>>> Hi
>>>>>>
>>>>>> On 6/4/25 6:00 PM, Frank Li wrote:
>>>>>>> On Wed, Jun 04, 2025 at 03:55:11PM +0300, Jarkko Nikula wrote:
>>>>>>>> Move DMA bounce buffer code for I3C private transfers to be generic for
>>>>>>>> all DMA transfers, and round up the receive bounce buffer size to a
>>>>>>>> multiple of DWORDs.
>>>>>>>>
>>>>>>>> It was observed that when the device DMA is IOMMU mapped and the receive
>>>>>>>> length is not a multiple of DWORDs, the last DWORD is padded with stale
>>>>>>>> data from the RX FIFO, corrupting 1-3 bytes beyond the expected data.
>>>>>>>>
>>>>>>>> A similar issue, though less severe, occurs when an I3C target returns
>>>>>>>> less data than requested. In this case, the padding does not exceed the
>>>>>>>> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>>>>>>>>
>>>>>>>> Therefore, all I3C private transfer, CCC command payload and I2C
>>>>>>>> transfer receive buffers must be properly sized for the DMA being IOMMU
>>>>>>>> mapped. Even if those buffers are already DMA safe, their size may not
>>>>>>>> be, and I don't have a clear idea how to guarantee this other than
>>>>>>>> using a local bounce buffer.
>>>>>>>>
>>>>>>>> To prepare for the device DMA being IOMMU mapped and to address the
>>>>>>>> above issue, implement a local, properly sized bounce buffer for all
>>>>>>>> DMA transfers. For now, allocate it only when the buffer is in the
>>>>>>>> vmalloc() area to avoid unnecessary copying with CCC commands and
>>>>>>>> DMA-safe I2C transfers.
>>>>>>>>
>>>>>>>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/i3c/master/mipi-i3c-hci/core.c | 34 -------------------
>>>>>>>>      drivers/i3c/master/mipi-i3c-hci/dma.c  | 47 +++++++++++++++++++++++++-
>>>>>>>>      2 files changed, 46 insertions(+), 35 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>>>> index bc4538694540..24c5e7d5b439 100644
>>>>>>>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>>>>>>>> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>>>>>>>>      	return hci->cmd->perform_daa(hci);
>>>>>>>>      }
>>>>>>>>
>>>>>>> ...
>>>>>>>>      }
>>>>>>>>
>>>>>>>> +static void *hci_dma_alloc_safe_xfer_buf(struct i3c_hci *hci,
>>>>>>>> +					 struct hci_xfer *xfer)
>>>>>>>> +{
>>>>>>>> +	if (!is_vmalloc_addr(xfer->data))
>>>>>>>> +		return xfer->data;
>>>>>>>> +
>>>>>>>> +	if (xfer->rnw)
>>>>>>>> +		/*
>>>>>>>> +		 * Round up the receive bounce buffer length to a multiple of
>>>>>>>> +		 * DWORDs. Independently of buffer alignment, DMA_FROM_DEVICE
>>>>>>>> +		 * transfers may corrupt the last DWORD when transfer length is
>>>>>>>> +		 * not a multiple of DWORDs. This was observed when the device
>>>>>>>> +		 * DMA is IOMMU mapped or when an I3C target device returns
>>>>>>>> +		 * less data than requested. Latter case is less severe and
>>>>>>>> +		 * does not exceed the requested number of bytes, assuming the
>>>>>>>> +		 * device DMA is not IOMMU mapped.
>>>>>>>> +		 */
>>>>>>>> +		xfer->bounce_buf = kzalloc(ALIGN(xfer->data_len, 4),
>>>>>>>> +					   GFP_KERNEL);
>>>>>>>> +	else
>>>>>>>> +		xfer->bounce_buf = kmemdup(xfer->data, xfer->data_len,
>>>>>>>> +					   GFP_KERNEL);
>>>>>>>> +
>>>>>>>> +	return xfer->bounce_buf;
>>>>>>>
>>>>>>> Why need use bounce_buf? why not use dma_map_single()?, which will check
>>>>>>> alignment and size to decide if use swiotlb as bounce buffer.
>>>>>>>
>>>>>> We do pass the buffer to the dma_map_single(). I've understood swiotlb is
>>>>>> transparently used when the DMA cannot directly access the memory but that's
>>>>>> not the case here.
>>>>>
>>>>> why not? even though you have to use internal buf, why not use
>>>>> dma_alloc_coherent().
>>>>>
>>>> I don't think it's suitable for "smallish" per transfer allocations/mappings
>>>> and buffer is not accessed concurrently by the CPU and DMA during the
>>>> transfer.
>>>
>>> I still can't understand why need this special handle for i3c. Basic it use
>>> dma transfer to transfer data. Can you simple descript hci's data flow?
>>>
>> Unfortunately my knowledge doesn't go deeply enough in HW but I could guess
>> it's somewhere in MIPI I3C HCI DMA engine implementation and/or HCI IP to
>> memory bridge/bus integration.
>>
>> If it would be a cache line issue then I would think we would see corruption
>> independently is the DMA IOMMU mapped or not and in larger number of bytes
>> than 1-3 last bytes.
>>
>> Also another finding that if I3C target returns less data than expected then
>> there is also padding in the last DWORD with the real data. But not more
>> than requested, i.e. 2 bytes expected, target returns 1, only the 2nd byte
>> contains stale data and bytes 3-4 untouched. Or 8 bytes expected, target
>> returns 1, bytes 2-4 contain stale data and bytes 5-8 untouched.
>>
>> So something around trailing bytes handling in the HW when the transfer
>> length is not multiple of DWORDs as far as I could guess.
> 
> That's reason why should not manually handle dma buffer here. It is
> small memory and less proformance requirement.
> 
> If you use dma provided api, you should not take care such detial. DMA
> buffer at least one cache line size. otherwise, dma may currupt some data,
> which is hard to find.
> 
Do you know what solution would solve the problem here?

Let's take a look at the CCC command which is the easiest here. For 
example GETPID where payload length is 6 bytes and is allocated using 
the kzalloc() which guarantees the buffer is cache line aligned and 
ought to be DMA-safe.

i3c_master_getpid_locked()
	i3c_ccc_cmd_dest_init() // Allocates 6-byte payload buffer
	i3c_master_send_ccc_cmd_locked()
		i3c_hci_send_ccc_cmd() // mipi-i3c-hci
			xfer[i].data = ccc->dests[i].payload.data;
			hci_dma_queue_xfer()
				// bounce buffer stuff, this patchset
				dma_map_single()
				// setup hw with DMA address
				// and queue the transfer

The DMA streaming API dma_map_single() maps buffer's CPU virtual address 
to the DMA address and we use that to setup the HW and do the DMA.

Assume now the DMA is IOMMU mapped. DMA writes correctly 6 bytes to the 
payload buffer + 2 extra stale bytes. In this case perhaps harmless (due 
to kzalloc() allocated buffer) but nevertheless corruption which KFENCE 
may be able to detect.

More difficult territory are I3C private transfers and especially I2C 
transfers. I3C private transfers are expected to pass a DMA-able buffer 
but I've noticed it may not be always true especially when I3C support 
is added into existing I2C or SPI target device drivers and that are 
using regmap_bulk_read(). Those use cases may pass a stack variable (not 
DMA-able and will be rejected by DMA API), structure member or buffer 
index and pointer into those come as it via regmap_bulk_read().

I2C message buffers are not even expected to be DMA-able. 
drivers/i2c/i2c-core-base.c has a helper i2c_get_dma_safe_msg_buf() but 
I see it has the same problem than with the CCC command payload buffer.

So far I haven't figured out any better solution than using a local 
bounce buffer for all of these transfer types.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
