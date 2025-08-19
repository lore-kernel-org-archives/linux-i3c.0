Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0A9CA0EED
	for <linux-i3c@archiver.kernel.org>; Tue, 19 Aug 2025 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lM2fmEY29pn8KUhN1bgyE/MXUzg1FnAphu5S4ymGKU8=; b=ck1e0sRPG09tb2
	QX8p4jKUpSQRak7u0Mbz61PMBopokxE0fJt6CUV4Tfq+0p2Tw0Cn5hp+NiNXjTaGWi0zVGorqve9g
	cODBgaNb7LCBBa1KiD3sltY0p345pPgUp/omiKvRVQKpsSwAl0Ag2lyNsr9pVcnQGFscQLPcsZR/C
	cSA/saoJhTCDMqivB7XfKEnACqTpKsjwpLqSBGUxEi883SAHe2vj2qT1ggSKeT1XynFy/PvhSAa3E
	R7wPHVpIK6jQRVFO49pNDKPtxoOaqVBrKXyUouy2iprMyq9yz/+53SEKDTUWmsn5x5ohd8u5Wwrvs
	+agkZ8HvdEOWEiXEDZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFd7-00000009VqC-0CbH;
	Tue, 19 Aug 2025 06:15:33 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoFd4-00000009Vp2-0ac2
	for linux-i3c@lists.infradead.org;
	Tue, 19 Aug 2025 06:15:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755584130; x=1787120130;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nUSoCBWIXstlTzHn9SfHxAyTYPoW02fWAApquJo/SPA=;
  b=T4MXZPy1f8FE3dv4MdDslRw5uAOKeanGdc/PfbLTPZUKxOCNrcL8EQYo
   uKI3/vRHs5mlkBPMRzNb45APSvkTrKnxvLwQYqMsFfwy9cdR2gaXZ1mnX
   umjLNMn7Wz7CVfKsUOgpdwn2av+xC3lSiJuatUN3zyZwkLwzrcaKagjFw
   z3dtnHaxbYuGFgAUD3Xnd72kxLb3p901MYoEgQ11RwF3b9svd+qiQRBMr
   eimAy+bCZ5Q4hDYDLLsMLzdLOJ33dvlvKjaVlNt3ALdA8y/Qrg7QAOwm0
   0Z0etb5VP4BryvqqE+f/B1oyq0k3X0JPE6Dxuqt3j2guSBjfTiGfM7heU
   g==;
X-CSE-ConnectionGUID: 9uVsBcrlTLa4iOR8MuRWqA==
X-CSE-MsgGUID: FCoM/xVbRXSN3Zos3hnu2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57744604"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57744604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 23:15:30 -0700
X-CSE-ConnectionGUID: jzabacFFT4Sm2YRm0BZxGw==
X-CSE-MsgGUID: GQjjiDjbTz6kRDc+5fiILA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="172194247"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2025 23:15:28 -0700
Message-ID: <3e520726-bf64-49a8-bed6-b7c27d3e61fa@linux.intel.com>
Date: Tue, 19 Aug 2025 09:15:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250815141242.2013767-1-jarkko.nikula@linux.intel.com>
 <20250815141242.2013767-3-jarkko.nikula@linux.intel.com>
 <aKNSBaRgLusZE53R@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aKNSBaRgLusZE53R@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_231530_198538_C10EF351 
X-CRM114-Status: GOOD (  18.93  )
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

On 8/18/25 7:17 PM, Frank Li wrote:
> On Fri, Aug 15, 2025 at 05:12:40PM +0300, Jarkko Nikula wrote:
>> So far only I3C private and I2C transfers have required a bounce buffer
>> for DMA transfers when buffer is not DMA'able.
>>
>> It was observed that when the device DMA is IOMMU mapped and the receive
>> length is not a multiple of DWORDs (32-bit), the last DWORD is padded
>> with stale data from the RX FIFO, corrupting 1-3 bytes beyond the
>> expected data.
>>
>> A similar issue, though less severe, occurs when an I3C target returns
>> less data than requested. In this case, the padding does not exceed the
>> requested number of bytes, assuming the device DMA is not IOMMU mapped.
>>
>> Therefore, all I3C private transfer, CCC command payload and I2C
>> transfer receive buffers must be properly sized for the DMA being IOMMU
>> mapped. Even if those buffers are already DMA safe, their size may not
>> be DWORD aligned.
>>
>> To prepare for the device DMA being IOMMU mapped and to address the
>> above issue, use helpers from I3C core for DMA mapping and bounce
>> buffering for all DMA transfers.
>>
>> For now, require bounce buffer only when the buffer is in the
>> vmalloc() area to avoid unnecessary copying with CCC commands and
>> DMA-safe I2C transfers.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
>>   drivers/i3c/master/mipi-i3c-hci/dma.c  | 32 +++++++++---------------
>>   drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
>>   3 files changed, 13 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 60f1175f1f37..b2977b6ac9f7 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -272,34 +272,6 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
>>   	return hci->cmd->perform_daa(hci);
>>   }
>>
>> -static int i3c_hci_alloc_safe_xfer_buf(struct i3c_hci *hci,
>> -				       struct hci_xfer *xfer)
>> -{
>> -	if (hci->io != &mipi_i3c_hci_dma ||
>> -	    xfer->data == NULL || !is_vmalloc_addr(xfer->data))
>> -		return 0;
>> -
>> -	if (xfer->rnw)
>> -		xfer->bounce_buf = kzalloc(xfer->data_len, GFP_KERNEL);
>> -	else
>> -		xfer->bounce_buf = kmemdup(xfer->data,
>> -					   xfer->data_len, GFP_KERNEL);
>> -
>> -	return xfer->bounce_buf == NULL ? -ENOMEM : 0;
>> -}
>> -
>> -static void i3c_hci_free_safe_xfer_buf(struct i3c_hci *hci,
>> -				       struct hci_xfer *xfer)
>> -{
>> -	if (hci->io != &mipi_i3c_hci_dma || xfer->bounce_buf == NULL)
>> -		return;
>> -
>> -	if (xfer->rnw)
>> -		memcpy(xfer->data, xfer->bounce_buf, xfer->data_len);
>> -
>> -	kfree(xfer->bounce_buf);
>> -}
>> -
>>   static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>>   			      struct i3c_priv_xfer *i3c_xfers,
>>   			      int nxfers)
>> @@ -333,9 +305,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>>   		}
>>   		hci->cmd->prep_i3c_xfer(hci, dev, &xfer[i]);
>>   		xfer[i].cmd_desc[0] |= CMD_0_ROC;
>> -		ret = i3c_hci_alloc_safe_xfer_buf(hci, &xfer[i]);
>> -		if (ret)
>> -			goto out;
>>   	}
>>   	last = i - 1;
>>   	xfer[last].cmd_desc[0] |= CMD_0_TOC;
>> @@ -359,9 +328,6 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>>   	}
>>
>>   out:
>> -	for (i = 0; i < nxfers; i++)
>> -		i3c_hci_free_safe_xfer_buf(hci, &xfer[i]);
>> -
>>   	hci_free_xfer(xfer, nxfers);
>>   	return ret;
>>   }
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> index 491dfe70b660..295671daae09 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dma.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
>> @@ -342,16 +342,11 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   static void hci_dma_unmap_xfer(struct i3c_hci *hci,
>>   			       struct hci_xfer *xfer_list, unsigned int n)
>>   {
>> -	struct hci_xfer *xfer;
>>   	unsigned int i;
>>
>>   	for (i = 0; i < n; i++) {
>> -		xfer = xfer_list + i;
>> -		if (!xfer->data)
>> -			continue;
>> -		dma_unmap_single(&hci->master.dev,
>> -				 xfer->data_dma, xfer->data_len,
>> -				 xfer->rnw ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
>> +		struct hci_xfer *xfer = xfer_list + i;
>> +		struct i3c_dma *dma_xfer __free(i3c_master_dma_unmap_single) = xfer->dma;
> 
> same here, directlly call i3c_master_dma_unmap_single();
> 
Does that then make needless to define DEFINE_FREE() for the 
i3c_master_dma_unmap_single() in the patch 1/4 since then there won't be 
user for it?

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
