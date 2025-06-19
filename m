Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C05C7115A
	for <linux-i3c@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HQtiwR2Phuk5/JUQ1MOnMWM4oVFDjDue6dznjcThsq0=; b=37zZwxt6Rly4aU
	rccHeSOLImoPJJ2jmP0I8FdeIXlu0qI9ZbOMosF6FvZRxvMhJNuTE8E6HAIZ+ccG32aol3vBK0raz
	m06sawINRwVyV8/MOWzxRoWwGnf4PJrpFpTopg0yZxGtyAYyPZlxZsahmfT2VHHTSX4m72AMAu0SB
	ffE8Z1JzOdA/vCyaVJg3eX5YRE0bT1XDeVpMbFHRE6CfhUOpf7bMBefncP7XmPtt7zDRLEG8WDAGR
	J8pRxTfCIGFumpCLl6C7Ab2ahD5Q1BYonMcaL/BqrFV3fnOhXoSGG2SdgpvY8B2ug92Z/3r32Rut+
	qoyqoyT6Xc+XMffQlL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWS-0000000DZKY-1l41;
	Thu, 19 Jun 2025 15:49:52 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFSQ-0000000DCSy-0RIm
	for linux-i3c@lists.infradead.org;
	Thu, 19 Jun 2025 13:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750340254; x=1781876254;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=izluKa7DrDQzwN73uYS2jYjd40VNETSBwWuLmGIXTlc=;
  b=OK1KUTISviBWayJS46TZGZc5q6E7nMI1u9qudBpUq3B+oEjBtQovVx2n
   FaLWlyI/X6L1npcw2jCeq5I0xhw7yViGWvLsg5UbFDAmvuL+jzfg2Nvwd
   fxJSfOqS+XW0hhrbXWBJQq8nR7vrb/NEG3WgL4g3gnbo8FfnPsrU305d4
   k2JnwlCM/qn/3HCDl+1e//XxPUyxeDYJncMyxQ1W69aPe9oa/yMlZkQyo
   dDe0lmDPYf0mg/tok41JXXq8uCRnCtpFwPAb93zjHgzlr69JD/g7ZSYYz
   HAN7KwUN4YluDQQH7LdrWGU/Mm01/6c4uEn5il+bPwiOqRNC2VeSqLzNt
   w==;
X-CSE-ConnectionGUID: K0rbbQo5SXqPDQcdmWuzsA==
X-CSE-MsgGUID: sRP3Zr42SvKYU1h0l2zJyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52684364"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52684364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 06:37:32 -0700
X-CSE-ConnectionGUID: v5IIb6qfSNG4F9KGmzmcKQ==
X-CSE-MsgGUID: +TiDJ/1YTHClESHPOUciGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="187867188"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa001.jf.intel.com with ESMTP; 19 Jun 2025 06:37:31 -0700
Message-ID: <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
Date: Thu, 19 Jun 2025 16:37:30 +0300
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
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
 <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
 <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_063734_185169_95AD8F09 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On 6/17/25 6:09 PM, Frank Li wrote:
>> Thanks, I finially understand the problem you faced. I think other master
>> controller face similar issue if they use dma. Let me think more. If alloc
>> buffer size is not align to cache line, swtlib will bounce again.
>>
>> rough idea i3c core layer provide an i3c_(un)map_api to do that.
> 
> struct i3c_dma {
> 	void *bounce;
> 	dma_addr_t addr;
> 	enum dma_data_direction;
> 	void *data;
> 	size_t data_size;
> 	size_t bounce_size;
> }
> 
> struct i3c_dma *i3c_dma_map_single(struct device *dev, void *data, size_t sz, enum dma_data_direction dir)
> {
> 	struct i3c_dma *p
> 
> 	p = kmalloc(sizeof(*p));
> 	if (!p)
> 		return p;
> 
> 	if (is_vmalloc_addr(data)) {
> 		p->bounce = kmalloc(align_up(sz, CACHE_LINE_SIZE)); //avoid swtlib bounce again.

I'll try to look at your idea next week. Do you have pointers to the 
above allocation size rounding is it required?

I've understood from the Documentation/core-api/dma-api-howto.rst 
"Architectures must ensure that kmalloc'ed buffer is DMA-safe" and 
"ARCH_DMA_MINALIGN must be set so that the memory allocator makes sure 
that kmalloc'ed buffer doesn't share a cache line with the others.".

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
