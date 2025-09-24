Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59400CAC5AE
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 14:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A+l0CfFcE80vsYcVikZzIjsNv5N/afU3f+zyEfw51po=; b=zkFTS6Pq52XLIkvz6opP2XfPA/
	qkJuEH4aFlOky4zWERnVf0xfidcQO7lCuFiR+Zgnby6Y3GA9n+6WBBKEqy63c+9P7Go2CWwBw8z49
	WO6BMFqQ+/OPAs9tB3SWW2rDn+nT2oYRFXMKQJskhNNjJWopCaQvg77NYYjspQgUi4ag5aa7AkcRh
	bilIdTO9O7VFrjwYeE1fC80JX3HiXCGtyY0bUZd5iu4CkM6Pi2orQalrLZzVIPLYTAAWT+IRLXSUb
	UJCie0Gwv2GNvjMb3WoL92vFBHOLg3Pxjh4ltUqSgJQj3p6atbQab6XfdMCRMTaz6VDSbIuiJsv4c
	4OagT+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q8C-00000000Tb1-0P6O;
	Wed, 24 Sep 2025 14:06:04 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Q89-00000000TZi-01T6
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 14:06:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D6D6D1D00188;
	Wed, 24 Sep 2025 10:05:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 10:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758722758;
	 x=1758809158; bh=IBcStZeO9c1HBcH0rLSii4gME1fU0JXoiIWwS/KYvto=; b=
	bRiuonoLSVsEJs3RW/1B2I+BS4PFriNl9YItil+iZmgo57iICRZyp45kyyLPHR8z
	Bi/3+dy8sSZfcpV3+sgnWzI1lnoClT18RxBs4U3ckSXhQG1pGmY9dxCmVjlFIRdN
	U+BT7adAZWC8JFcErWmoEwZbedXp2tHFQ21DkK6nz4qLvlptu31Q/B916LNPcGe+
	F1sA6bGsXftk/0bSeM3/PTIo2DWs1rcSA+Zh9oFAq0LXqKuhjjq8gkjisf+H1Sdo
	zWDSWX29MKyVqG8XMgK41K2/zsRIPhl+LLs5c2qbWoiU8fm7R/z7/dZNcNLMiysa
	+c6ZRX2SzDoi3/w4TxaAkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758722758; x=
	1758809158; bh=IBcStZeO9c1HBcH0rLSii4gME1fU0JXoiIWwS/KYvto=; b=R
	w73ToYFF1cgeNtPC6j55Mmd8ZcV91EDe6BJ0Ofp3Q1A65N9wyLeXf7SJYYfnbX4F
	NAYrvAAOWffhDh1Zc2oyEDWJbhc2rJj8GI9htSEyiGTtAWqEYGf+oNtgEa0oRxbi
	LNnpToDE0o3Dw77xYcS5RzX8ojCgwUzyfA50l+7N6Z2ukoe1fvmzk2qAnWBD1pYA
	fpW9ZSQ5ww1gimYApC6qFK6xAtvDGSCLMp3hMQyFmOtS/H9aVMnG0wYMQZlMEdO8
	nxHNWRbVY49kVX9Ft8Mza28FlXNGkJIxlDmZpaocBhBMHqj2fFklczFgi4nxGHSg
	MtO+VLvoZ7ru2uXl6Nu2Q==
X-ME-Sender: <xms:xfrTaEvH2JuH3zfBHMcvH0AOVRBnmNXrVY9Eh4HV9s9HA7Jxf9QAvA>
    <xme:xfrTaMQQDb2a-hr-7DKc13zwUgWCTuAjOb9OhA8azW4xWbb3bS61M-wthrkUDacNr
    yYZz5U7uJrNgPmNNvN77nRzbqDjfyAEEAO-E-X513JvkpriHKCXa-k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeifeektdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:xfrTaHMTci2rBtuNS1lbcZGzEzbsW-dDQ_hYT-ifE3U2jMVacYDixg>
    <xmx:xfrTaEnZBBPjfaXaKALn4VNdfKJltVttlijWAGd9Bu2mHwSTh4C9lw>
    <xmx:xfrTaFzIrWuCUJ33p3xnh6h2cFnL1l8obnni1aighpAo826wUprq2g>
    <xmx:xfrTaNDqVidmfXjKGVsW5FdItMn5zQlrZw1UmmlH6kXv1RqueDi5Gw>
    <xmx:xvrTaGqTlniruo7sjxK6HOJfcNsrasNg6OFcY1r7VI2gFQxwKOs6aaKL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1E25770006D; Wed, 24 Sep 2025 10:05:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0nVfrWCY5as
Date: Wed, 24 Sep 2025 16:05:26 +0200
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
Message-Id: <134c3a96-4023-47ab-8aa9-fd6ab75e5654@app.fastmail.com>
In-Reply-To: <DM4PR12MB6109E009DAC953525093FE808C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
 <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
 <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4199b1ca-c1c7-41ef-b053-415f0cd80468@app.fastmail.com>
 <DM4PR12MB6109E009DAC953525093FE808C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_070601_559068_7A97364C 
X-CRM114-Status: GOOD (  19.21  )
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

On Wed, Sep 24, 2025, at 14:22, Guntupalli, Manikanta wrote:

>> @@ -55,7 +55,7 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void
>> *buf,
>>       if (nbytes & 3) {
>>               u32 tmp;
>>
>> -             tmp = readl(addr);
>> +             readsl(addr, &tmp, 1);
>>               memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
>>       }
>>  }
>
> We have not observed any issue on little-endian systems in our testing 
> so far (as I mentioned earlier in asm-generic/io.h: Add big-endian MMIO 
> accessors).

Did you test the little-endian system with the 'endian' flag set
to I3C_FIFO_BIG_ENDIAN though? Your v7 code will still work on
little-endian kernels if that flag is set to I3C_FIFO_LITTLE_ENDIAN,
and it will also work on big-endian kernels if the flag is
set to I3C_FIFO_BIG_ENDIAN. But is broken for the other two:

- on little-endian kernels with I3C_FIFO_BIG_ENDIAN, the entire
  data buffer is byteswapped in 32-bit chunks

- on big-endian kernels with I3C_FIFO_LITTLE_ENDIAN, you run into
  the existing bug of the swapped tail word.

> That said, I understand your point about FIFO semantics being different 
> from fixed-endian registers. To cover both cases, we considered using 
> writesl() for little-endian and introducing a writesl_be() helper for 
> big-endian, as shown below:
>
> static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
>                                    int nbytes, enum i3c_fifo_endian endian)
> {
>         if (endian)
>                 writesl_be(addr, buf, nbytes / 4);
>         else
>                 writesl(addr, buf, nbytes / 4);
>
>         if (nbytes & 3) {
>                 u32 tmp = 0;
>
>                 memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
>
>                 if (endian)
>                         writesl_be(addr, &tmp, 1);
>                 else
>                         writesl(addr, &tmp, 1);
>         }
> }
>
> With this approach, both little-endian and big-endian cases works as expected.

This version should fix the cases where you have a big-endian
kernel with either I3C_FIFO_BIG_ENDIAN or I3C_FIFO_LITTLE_ENDIAN,
as neither combination does any byte swaps.

However I'm fairly sure it's still broken for little-endian
kernels when a driver asks for a I3C_FIFO_BIG_ENDIAN conversion,
same as v7.

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
