Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F337AC0219D
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Feb 2025 12:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A+RMZgrS2pqt5BdvbH/XAloTf9y25iB8+/NgCMRXM8=; b=DGwrEO7NAKxqSE
	YYUzzm0Dg2yDYJkZoO37ItVKCjXn9HfIhurRZUa5H/gha2VXOypXv7L7fpu678g3lOSWvc60HiQzm
	5fMEUUSpp+UPv+erICMD4SDP/WQF7KFHfbEeyxgEFS+/swG1XkphAppxnuVOkrC4zMr0/z3SZbkup
	Q/tDbE2U3jP7o8VSvfKqG18P3mnVDt3UpITH7iyMfFY7QdmkM4xO0GEU9vrHujgMJPYWqP2+Dr+Mr
	Sq+/TyZ7WqkGDDrvxlKJzPwRew4EA4eTSe4ygBAOc8TD/JbnSr4xS5w9pXyNht4X+Zv0/WRp8v8D0
	8d1IN+xccKAOAX9NA05w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYoA-0000000B4Nw-2oeW;
	Thu, 13 Feb 2025 12:59:10 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYn8-0000000B4IM-0M2O
	for linux-i3c@lists.infradead.org;
	Thu, 13 Feb 2025 12:58:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739451486; x=1770987486;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zL+FO3kAxJ6Aa9JQBNbr+7WYxSBhWFq/NSF5wyfUgHg=;
  b=LsPK15MDOHn41Bm6yev1BQ7uKIOpbXo4Cbn1KHX8Zzi11L3pPDXXWRhy
   lSaFlhHNBy9oKk1xnSw5e5vzkIl2FsVvJ4q1UH/jWWAgsRGx7s6QdJZ1a
   PxpK9usYvixHzpSWPysCI15snZglFvLxIzp+/kW7duKxT6MvSJFjlrksN
   gpejJX/pUc4AeJwv/5nhA5eMsBxrS3suuO0oeakwVvOK7bCdBcm3TDvZ2
   O9X1sgFTbDHOKLUkQn4YZ/qvA8zEhN1RxLCSGYwFIw4jnRxNutp/uvF2t
   OGDwXnhxFoX9D4hOm/7piKGkKveVBGftyJ7etHmtsswg5FSzEo6FOQjby
   Q==;
X-CSE-ConnectionGUID: XQFrGbttTmmtqFtehMqS/w==
X-CSE-MsgGUID: aTAHbpDiSd67r75F/C80rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50797947"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50797947"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 04:58:04 -0800
X-CSE-ConnectionGUID: Av+aCRfuRVGRPTBsk+AhzQ==
X-CSE-MsgGUID: j8LRjNlySlKAbz3WEx7udg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="118226917"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2025 04:58:03 -0800
Message-ID: <69fc72be-4200-48c9-9396-91e3180524e2@linux.intel.com>
Date: Thu, 13 Feb 2025 14:58:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i3c: mipi-i3c-hci: Use physical device pointer with DMA
 API
To: linux-i3c@lists.infradead.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
References: <20250203145513.141466-1-jarkko.nikula@linux.intel.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250203145513.141466-1-jarkko.nikula@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_045806_153313_AC4E05A7 
X-CRM114-Status: GOOD (  14.41  )
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

On 2/3/25 4:55 PM, Jarkko Nikula wrote:
> DMA transfer faults on Intel hardware when the IOMMU is enabled and
> driver initialization will fail when attempting to do the first transfer:
> 
> 	DMAR: DRHD: handling fault status reg 2
> 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry
> 	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
> 
> Reason for this is that the IOMMU setup is done for the physical devices
> only and not for the virtual I3C Controller device object.
> 
> Therefore use the pointer to a physical device object with the DMA API.
> 
> Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/dma.c | 45 ++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 14 deletions(-)
> 
Please don't apply this.

KFENCE started detecting memory corruption from the 
i3c_hci_free_safe_xfer_buf() when IOMMU is on with this patch. 
Corruption is not limited to a bounce buffer only but thanks to KFENCE 
was noticed.

Which is obviously much worse than the DMAR fault and driver not loading.

The corruption happens after the last DMA write address for transfers 
where size is not multiple of DWORDs corrupting the remaining bytes on 
it or extending also to a next DWORD depending on buffer alignment and 
transfer length.

I'm currently investigating the root cause for this with the experts.

So before this patch it'd need to have a change to the bounce buffer 
implementation (extend to other use cases and allocate extra DWORDs) and 
apply this patch only after it.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
