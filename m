Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD351CA0EDC
	for <linux-i3c@archiver.kernel.org>; Thu, 21 Aug 2025 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CT96el9frAcAlyEAv22vnL/CZ+sewUTtKBJKL/SJYmU=; b=KyzECkR8tDKb5w
	QJSq1B4pbuuQrADaSetsnJ93879MGe0ujiFE/Vn/m+zJztD6q84yIe+NWS2giGW78u/ApveglzBDC
	IaCMigO4nu73Bh+Wh0Ik5NPiMT7b3sac+hjbCiVXrlTePqpAD2IYTKBl1SJLejxrH8fp1exd3R0JQ
	sJO4p27zZQAsK8gkX2zqvXv3SQY07qj+ueO/o1ZrNYf02+MiwqrG2gWTIAIo0wZa5rv7PCejK8654
	+zuL5/pUCJ7WuAM+7MN4QVGYxBrGMjqtK+WxoNaAAGDqPyTtlYQnrFQlt8TS4YdUCpKzMsL98ZYrq
	eT1xs8CprxM79c00m31w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyDc-0000000FuJe-2AkC;
	Thu, 21 Aug 2025 05:52:12 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyD7-0000000FuIp-1EpU
	for linux-i3c@lists.infradead.org;
	Thu, 21 Aug 2025 05:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755755501; x=1787291501;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=BN35GzH7HOFCqc+fuOqfUxx7dBcMtruz7drYtBHuDwc=;
  b=QS2/1fJK7RQjSgfmxPCh4ZQtVeVhQY9wnhJxiuoKOPCM374/qNAQ3NMw
   zF1nJaQLlZfbtX+zWMBWUKPg+dABunMCNJoE3iPtkIGqRaSzqmV+USWDt
   hGlwrmD+wuechVFsrBIpg2lRk6sm/4siKrCkNJBWobn25LAGjb7pILmFG
   GJ3TVXEVhTKwnJjnqcE5Xh9FmkeGuqCDAsSiTTNz2gM5ehLTC4lnHKvFb
   prefp9fgAB+GuqnfwhMoek8bbq5X7mfX7Tn1zzbZPrLLolVYG3LhmdEq9
   Cju3PG7uinaswdCTv2zlidgzHYoAFP1hOmQC45nuaOj3PmTcM008BJVRj
   w==;
X-CSE-ConnectionGUID: p0t0uIJpRUO7R7vRZTldrw==
X-CSE-MsgGUID: 14B5WygCTRWstHh4o/svaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57059155"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57059155"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 22:51:40 -0700
X-CSE-ConnectionGUID: c55SA034ShuAM3zBQ8HgCg==
X-CSE-MsgGUID: AKpIVGaSRrmNHf0a8iSSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168248553"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by orviesa007.jf.intel.com with ESMTP; 20 Aug 2025 22:51:39 -0700
Message-ID: <994e78bb-2b4d-4938-bbda-59fa8884ce4c@linux.intel.com>
Date: Thu, 21 Aug 2025 08:51:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] i3c: mipi-i3c-hci: Use core helpers for DMA
 mapping and bounce buffering
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250820113447.2502071-1-jarkko.nikula@linux.intel.com>
 <20250820113447.2502071-3-jarkko.nikula@linux.intel.com>
 <aKXzrHl/EfJ9JRm3@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aKXzrHl/EfJ9JRm3@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_225141_376787_6DE789C6 
X-CRM114-Status: GOOD (  13.62  )
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

On 8/20/25 7:11 PM, Frank Li wrote:
> On Wed, Aug 20, 2025 at 02:34:45PM +0300, Jarkko Nikula wrote:
>>
>> For now, require bounce buffer only when the buffer is in the
>> vmalloc() area to avoid unnecessary copying with CCC commands and
>> DMA-safe I2C transfers.
> 
> I see below you pass 'false' to i3c_master_dma_map_single(). where
> check buffer in the vmaloc() area?
> 
Yes it's intended in this patch. Driver doesn't especially require a 
bounce here (in the next patch yes) but if buffer is in vmalloc area the 
i3c_master_dma_map_single() does allocate it internally.

>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/core.c | 34 --------------------------
>>   drivers/i3c/master/mipi-i3c-hci/dma.c  | 27 +++++++++-----------
>>   drivers/i3c/master/mipi-i3c-hci/hci.h  |  3 +--
>>   3 files changed, 12 insertions(+), 52 deletions(-)
>>
> [...]
>> @@ -391,21 +390,17 @@ static int hci_dma_queue_xfer(struct i3c_hci *hci,
>>
>>   		/* 2nd and 3rd words of Data Buffer Descriptor Structure */
>>   		if (xfer->data) {
>> -			buf = xfer->bounce_buf ? xfer->bounce_buf : xfer->data;
>> -			xfer->data_dma =
>> -				dma_map_single(&hci->master.dev,
>> -					       buf,
>> -					       xfer->data_len,
>> -					       xfer->rnw ?
>> -						  DMA_FROM_DEVICE :
>> -						  DMA_TO_DEVICE);
>> -			if (dma_mapping_error(&hci->master.dev,
>> -					      xfer->data_dma)) {
>> +			xfer->dma = i3c_master_dma_map_single(&hci->master.dev,
>> +							      xfer->data,
>> +							      xfer->data_len,
>> +							      false,
>> +
> 
> you pass false here.
> 

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
