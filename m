Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB73FCAC5A5
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J0ICwStFPffs0ARbl6OMxUcGSzCtQbDH0U1TUuEFFXw=; b=fmb3/+lvE+boQV+/3TqRtf89UZ
	s6hJCpqXL63Go64ujiEUU/nXC5xk/usg16/TU99so9C3IsvCfgSpsLg3nI4dLN3oewZFpJAcAtAwH
	TkXoUmgT/6xZOrL02HtIUbUqA7OJEQBwGQMysExCWSPvmNXeDXrc/gfFsp+nGxD0eX+DDYdW//5t6
	Dfo6qzNtfuFh4qdvp56jlJpz1Bn21PoxCnHk/OKo3FuweZbS+ktqNX8MQgyZHUEQAms4QknpGeTng
	/d5/F0rL/Aplx5QTT3/3EvXUXiweNWKMHw7EgCVySwJAkEWIVirffBbhoxvn7FCeRlpkibV8HZFBS
	xE8G2FhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ksZ-00000008rYD-2gYZ;
	Thu, 25 Sep 2025 12:15:19 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ksW-00000008rVQ-2Cjd
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 12:15:18 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0D771140015D;
	Thu, 25 Sep 2025 08:15:13 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 08:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758802513;
	 x=1758888913; bh=Ai0hYxP2PHoEjzhHhI6JRyRV6fkyqh8ZPvnm+y+DYqY=; b=
	k7ZYVILdsJod+OM49xS7E+s3gGgZ1GA77sHlgC+10UnNRrToF8VAvHnGBIf0aTF1
	hGOJXu07+4t0IPxXE2yTk6e8ZrqSfFC2P0gTJDARJ6B/gVat7bVhnNmE62JgaOIb
	iEGZo6hSwrOrIG5VEDoBAemZsAvn0LypwmSTf7hmQaVaFUBekk12dXtZ0i9Dq63q
	pyTN1FqFzBcGNzvI1dlFzYuoA0kuu+xrnBtTVbRD/FXY2248HTVvnayAiEcgmjOw
	b9HIpAk0vXexXEX+K2R4j0RsPZltnOqaDgnVXeqy5XxPDhsgYXmam3iCm0wGZ76d
	2GYPepUFxAQhP9egZh/yMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758802513; x=
	1758888913; bh=Ai0hYxP2PHoEjzhHhI6JRyRV6fkyqh8ZPvnm+y+DYqY=; b=b
	oAEafgqKRMFLdIFQ7JWyjyZUq/hf0TVQ+50kU+GC8hO1eAvc6Tb8BE9J1lFwj78F
	xKYzW8uGrt0gj5G1SphzE1otiiiGTlAQk57cQlpdWm+RXaHR+WZ5hWCA3y16qXLk
	kfoky9B23tF0UG4KKyg67ra57AJybiiG4Db+5uQ8R2k1nsklU5Xapv+MToOLqa+A
	VY+ai4KNQ9R+AGUqcN8lVBGgLo+rw0aUR2teHjm92s37kJFoCQQzQ2HcyDeCXxzF
	S+XUJe9MJ2nK74B1+wdgXNllzAX58PlvGSN7U6Y1QZK0CdqlQLcVcEbqhW0nSX0x
	/6OQcUQX26UwErgiIYQAA==
X-ME-Sender: <xms:TjLVaDAqfPQJKSeB82080_w8myikU6CFtjJ87KgI6TS3kguuEjONJQ>
    <xme:TjLVaEXqkwbM-rTpVcf-PlfO-AxL5aAS6K07hQx8Q_N26yCiEHu_mA-qlA_--PLXS
    kVaUQQfpKTjyj9thvO967ZOVRArdXYqOwa86YgmE1GtuuVbag2tghc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhhhigrmhdqshhunhgurghrrdhsqdhksegrmhgurdgtohhmpdhrtg
    hpthhtohepghhithesrghmugdrtghomhdprhgtphhtthhopehmrghnihhkrghnthgrrdhg
    uhhnthhuphgrlhhlihesrghmugdrtghomhdprhgtphhtthhopehmihgthhgrlhdrshhimh
    gvkhesrghmugdrtghomhdprhgtphhtthhopehrrgguhhgvhidrshhhhigrmhdrphgrnhgu
    vgihsegrmhgurdgtohhmpdhrtghpthhtohepshhhuhgshhhrrghjhihothhirdgurghtth
    grsegrmhgurdgtohhmpdhrtghpthhtohepshhrihhnihhvrghsrdhgohhuugesrghmugdr
    tghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomh
    dprhgtphhtthhopegsihhllhihpghtshgrihesrghsphgvvgguthgvtghhrdgtohhm
X-ME-Proxy: <xmx:TjLVaMDX1NFaLybwHy91IpY30WTDOhrIX_osSHckubrvs--4eXazTA>
    <xmx:TjLVaBKca4pXGXUILZAhxdDpLLHl1zQz1ZIh0OvEE1mp4q1_0X-UAQ>
    <xmx:TjLVaPFNu3S6CyXqTrXDTyKe43Cd8UWZQFmQDIFJZ9Q4jDW7YgzSKA>
    <xmx:TjLVaEGpeIO1n9n-3qlOOT4Bme4vdCdsNJZWG9Yj-ydvgXL4cqZHOw>
    <xmx:UTLVaIvWpFoULt3HQvQOAm8etplCK4CTnVARH_LQbyAqz4iaznu49IfD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9CE98700069; Thu, 25 Sep 2025 08:15:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0nVfrWCY5as
Date: Thu, 25 Sep 2025 14:14:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>,
 "git (AMD-Xilinx)" <git@amd.com>, "Michal Simek" <michal.simek@amd.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Rob Herring" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "tommaso.merciai.xr@bp.renesas.com" <tommaso.merciai.xr@bp.renesas.com>,
 "quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k,
 Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
 "Kees Cook" <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Cc: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "Goud, Srinivas" <srinivas.goud@amd.com>,
 "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
 "manion05gk@gmail.com" <manion05gk@gmail.com>
Message-Id: <b2ce3e0b-a639-4e70-a5e7-ffbdc855153e@app.fastmail.com>
In-Reply-To: <DM4PR12MB61090F307DBA2B99AFC93B168C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
 <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
 <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4199b1ca-c1c7-41ef-b053-415f0cd80468@app.fastmail.com>
 <DM4PR12MB6109E009DAC953525093FE808C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <134c3a96-4023-47ab-8aa9-fd6ab75e5654@app.fastmail.com>
 <DM4PR12MB610989A03A7560F2A03792838C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <295ee05e-3366-4846-9c8b-85ac09d79d48@app.fastmail.com>
 <DM4PR12MB61090F307DBA2B99AFC93B168C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_051516_916366_EF31F43C 
X-CRM114-Status: GOOD (  25.62  )
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

On Thu, Sep 25, 2025, at 11:26, Guntupalli, Manikanta wrote:

>> Can you explain how that works? What I see is that your
>> readsl_be()/writesl_be() functions do a byteswap on every four bytes, so the
>> bytestream that gets copied to/from the FIFO gets garbled, in particular the final
>> (unaligned) bytes of the kernel buffer end up in the higher bytes of the FIFO register
>> rather than the first bytes as they do on a big-endian kernel.
>>
>> Are both the big-endian and little-endian kernels in your tests on microblaze, using
>> the upstream version of asm/io.h? Is there a hardware byteswap between the CPU
>> local bus and the i3c controller? If there is one, is it set the same way for both
>> kernels?
>>
> To clarify, my testing was performed on the latest upstream kernel on a 
> ZCU102 (Zynq UltraScale+ MPSoC, Cortex-A53, little-endian) with 
> big-endian FIFOs and no bus-level byteswap. For more details, please 
> refer to my reply in Re: [PATCH] [v2] i3c: fix big-endian FIFO 
> transfers.

Ok, thanks fro the clarification. I got confused by your description
mentioning big-endian in [PATCH V7 3/4] and assumed this would be on
a big-endian microblaze CPU, after I saw that the original i3c_readl_fifo()
had a bug in that configuration that your patch addressed and this
being a driver for a xilinx design. That fix just turned out unrelated
to what you were actually trying to do ;-)

> Please don't take this as negative or aggressive-my intention is purely 
> to learn and ensure it works correctly in all cases.

No worries, I should not have jumped to conclusions myself based
on what I saw in your implementation and assumed that fixing the
one bug would address your problem as well.

I do understand that your driver clearly needs a special case,
we just need to come to a conclusion what exactly the hardware
does and how to best deal with it. This is partly about whether
you may be able to use an external DMA engine such as
xlnx,zynqmp-dma-1.0 or xlnx,zynqmp-dpdma, and whether that would
need the same byteswap.

If you already plan to add that support, you likely need to
allocate a bounce buffer and byteswap the data in place
to have it copied in and out of the FIFO, and when you have
that, you can use the regular i3c_readl_fifo() unchanged.
If you are sure that the i3c controller is not going to be
used with DMA, or if the FIFO register as seen by the DMA
master does not require a byteswap, having a local helper
for the transfer is likely easier.

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
