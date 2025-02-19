Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6187C021B0
	for <linux-i3c@archiver.kernel.org>; Wed, 19 Feb 2025 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBSaSB7b+0T/cbyJp2gtUXpCYomt5UikBC4w05C+BLk=; b=QopTlIOHn1w19O
	hN7UI8a2fjdz51HIuPsJRVvy6vBqBxfYjE6hL7oefwuWDlf7PGZ5Mukbhff99KgPUczBvK4vLEP6l
	cup4OURwYS2wILXUyGsarbGugY+u9x5rjy6eT+9xrgh1XhObSWPw23R5G9S3EN42Zj2qylFjo797T
	ElO9tVQ5XrEjxRgP2+iIrAIANZIyf2tLq8t91a1gTVWJbxdAix7y2Y3OGQdUAjP0sKu8fJEdxM9nz
	KnS/dllMfdUy1mhaEg3FKKCameI+wPVTMrr41EiEv/0lmsJW+7Xp+/GwjTO9oj++EdK/qziPra1C4
	62Pvhypry/1Pl1aiUpKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpz7-0000000Ei7k-1kpX;
	Wed, 19 Feb 2025 19:43:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpoM-0000000Eea1-1Iqb
	for linux-i3c@lists.infradead.org;
	Wed, 19 Feb 2025 19:32:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2F98442C1;
	Wed, 19 Feb 2025 19:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739993561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mTKfy7kICDFKddEr+x7hRtzd7d4dgomt790H+xx7rVY=;
	b=CKBKmA4bro4KqPQ2pUoEKMs7RT0d4OQC/BG0weKx6oR3s+xjFbEEgYw5OxW5AdCv6paXQy
	wT1v5aSYQFMHaEVjQS60raqhQnAIG2sjv57ACX8c1OpTD/LvixE0uWmeL38AmK3mrOrqG/
	MoUj5AIY5ZUeG6x4twVhr+AH4sExRTfakLPArpUy6iFoXccVODWCWVMx7Bk7mLMVXqXa63
	xjxk+/fd+9Lvv/gApkTh/3eydMSP1MKLXj3aUqwXWTXCBdIhpr8sGhbE9DBtj8OoW6conJ
	zSN5QfKh1aX8BVUTIRN0wtmfvqA4NDO/XCfEmNHMq0BpaLF+veBozMMMbB0kRw==
Date: Wed, 19 Feb 2025 20:32:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	"Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
Subject: Re: [PATCH] i3c: mipi-i3c-hci: Use physical device pointer with DMA
 API
Message-ID: <20250219193240c9692dda@mail.local>
References: <20250203145513.141466-1-jarkko.nikula@linux.intel.com>
 <69fc72be-4200-48c9-9396-91e3180524e2@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69fc72be-4200-48c9-9396-91e3180524e2@linux.intel.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiheduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepjhgrrhhkkhhordhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgp
 dhrtghpthhtohepkhhrihhshhhnrgdrphhrrggshhgrkhgrrhgrnhesihhnthgvlhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_113246_841924_BC318487 
X-CRM114-Status: GOOD (  23.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 13/02/2025 14:58:02+0200, Jarkko Nikula wrote:
> Hi
> 
> On 2/3/25 4:55 PM, Jarkko Nikula wrote:
> > DMA transfer faults on Intel hardware when the IOMMU is enabled and
> > driver initialization will fail when attempting to do the first transfer:
> > 
> > 	DMAR: DRHD: handling fault status reg 2
> > 	DMAR: [DMA Read NO_PASID] Request device [00:11.0] fault addr 0x676e3000 [fault reason 0x71] SM: Present bit in first-level paging entry
> > 	i3c mipi-i3c-hci.0: ring 0: Transfer Aborted
> > 	mipi-i3c-hci mipi-i3c-hci.0: probe with driver mipi-i3c-hci failed with error -62
> > 
> > Reason for this is that the IOMMU setup is done for the physical devices
> > only and not for the virtual I3C Controller device object.
> > 
> > Therefore use the pointer to a physical device object with the DMA API.
> > 
> > Reported-by: Prabhakaran, Krishna <krishna.prabhakaran@intel.com>
> > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> > ---
> >   drivers/i3c/master/mipi-i3c-hci/dma.c | 45 ++++++++++++++++++---------
> >   1 file changed, 31 insertions(+), 14 deletions(-)
> > 
> Please don't apply this.
> 
> KFENCE started detecting memory corruption from the
> i3c_hci_free_safe_xfer_buf() when IOMMU is on with this patch. Corruption is
> not limited to a bounce buffer only but thanks to KFENCE was noticed.
> 
> Which is obviously much worse than the DMAR fault and driver not loading.
> 
> The corruption happens after the last DMA write address for transfers where
> size is not multiple of DWORDs corrupting the remaining bytes on it or
> extending also to a next DWORD depending on buffer alignment and transfer
> length.
> 
> I'm currently investigating the root cause for this with the experts.
> 
> So before this patch it'd need to have a change to the bounce buffer
> implementation (extend to other use cases and allocate extra DWORDs) and
> apply this patch only after it.

Thanks for the heads up, I was going to apply it!

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
