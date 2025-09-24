Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F2CCAC5B0
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=EuC1Y1AEYyea1lat0kYkOJ4J5WX/b6qXoVjbU/FDj0E=; b=kBkiZO+pbf4Zo1jjtMokEG0JC7
	9xhJGESu7NHLokPsiYgAnDg9n+T97Uhr+TJvesmfFk8oDD6O1y28HC1JpkGR3EUUJtBvw9wubgMq5
	H/G6cesx2DiNvzZo+2+lg+2VELl2WIBloagaWEwBmyy4iDXoObDOSM2I6moYXKpjasWiMYM3AEeCo
	G8EYbZMmEuXfoeiLp2LKHHeEL8SPlCeX1FyOC03O1WBsmANk0TLHGRNxjBqUvCXhEkgKUNt9H2nS7
	5BFeZWQBLESzaxWLRwYxOJ2V6jJe0Xk9m6Za3hIur8pm/C9Q+Uo3XPK4nMFnqb4jOmx1NtylmNq0a
	9ftTd/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MJ7-0000000GHqU-0y2R;
	Wed, 24 Sep 2025 10:01:05 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MJ4-0000000GHoA-3sV2
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 10:01:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id C5B2A1D00105;
	Wed, 24 Sep 2025 06:01:00 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 06:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758708060;
	 x=1758794460; bh=T3ZHdKUDIfZ1GBfyH2K60XUuWXn/RU/s4ddNa0Ce6zo=; b=
	HSQoFJI2Wf9Jv4yGb8HeXT4W+ySS3xdhmuaFMrjIb+JA65YkGeDrcolwLUudToD6
	RTZaGqQGgvTogqOEBKbvM3TGh81s4HmqY8QigmPXVEiQ5miYkor7hKdS2zE5vQH8
	iR+V/W8LLZMwo96kBk2bJj/iO3oUtC6Z50L0HNqe1DLCi58fADwT3OMh6LFnTlk5
	yAVoCxuroSaH3VQkYad4Fm+CcM/LKUcOmCcs/ac3X+JljCgN+whdwLvs+HWNw06W
	VC5UD7oK9ho8r0AFCQ/kplKlwn+WSmcN6WheVYOIsfldI+r9nypTKEQPw32tvM0K
	sfn0+mNb0xpJ6nf0droCvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758708060; x=
	1758794460; bh=T3ZHdKUDIfZ1GBfyH2K60XUuWXn/RU/s4ddNa0Ce6zo=; b=g
	vMOkp9SGl4akq/TNbiNEYyT9BegGPH0YrYt74D2+LzQ8CECD/CUNz0wnwJzoIPeU
	J2OKPUTKF2xglfg/P2sHwv786Sc3zdLl3D6weiDfQr8/7GH0AMO2/BUlxDXsAiAS
	PwEfJ+HuI4/xn4UWXRsf3EAvs4W8bCUv0cwww5OIPa15aBHkff7PViQnObXPICtc
	LPSyeVnRXu9bEIRkoV88kxWEO+s6O4QmPnqC67IlLlQblRjdS+H0mzjL4MZ+l2KI
	NfT+5toyrk8a2u8cVEpSJWUNuEa2Hc+Vhx++CQCCgRDJzRD30aAddEAyUUj7UAAa
	gll4cAXjnlDEr0Jd2M/uw==
X-ME-Sender: <xms:W8HTaFkBV9OlYdbCtxKoftid08RapANjep28r_KXB7ihKe5LlCl19Q>
    <xme:W8HTaLpc3G5aJxOxabOiTWAOLV-hhTaMNTnlQlXZN62dIYIryDBHAPLH_ucfh45eS
    yQkvczLq7-eAlHphI3ilJt8vyHG8XWKbR8EYZJzP65A4taYdyZ74A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeifeefudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:W8HTaHH39wT-R18D4w1s5F6fVPSYGft8xfVngU2bEP1FA9vt06t0tg>
    <xmx:W8HTaG8gBZQVrWv496UFGg_NJf1IDbAZ4Ay3jjCUIeMvZh5jw6g8aw>
    <xmx:W8HTaIo3wCNsatHw913KTje_ySXgAPULh1L6rkH3FybXpZQjaE8y8g>
    <xmx:W8HTaGaVe3n66kPfd-A4rM0zVh3unyJlmN1yrqkxXw98IT_NzA-bwg>
    <xmx:XMHTaCCf7fxjnC9kMCxXMCH6Q-dCjQlYrMtwZmKAoQoPzkvS6h1Gka7n>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B8554700065; Wed, 24 Sep 2025 06:00:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0nVfrWCY5as
Date: Wed, 24 Sep 2025 12:00:06 +0200
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
Message-Id: <4199b1ca-c1c7-41ef-b053-415f0cd80468@app.fastmail.com>
In-Reply-To: <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
 <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
 <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_030103_023438_002011EA 
X-CRM114-Status: GOOD (  21.03  )
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

On Wed, Sep 24, 2025, at 11:00, Guntupalli, Manikanta wrote:
>> >     if (nbytes & 3) {
>> >             u32 tmp = 0;
>> >
>> >             memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
>> > -           writel(tmp, addr);
>> > +
>> > +           if (endian)
>> > +                   writel_be(tmp, addr);
>> > +           else
>> > +                   writel(tmp, addr);
>>
>> This bit however seems to fix a bug, but does so in a confusing way. The way the
>> FIFO registers usually deal with excess bytes is to put them into the first bytes of the
>> FIFO register, so this should just be a
>>
>>        writesl(addr, &tmp, 1);
>>
>> to write one set of four bytes into the FIFO without endian-swapping.
>>
>> Could it be that you are just trying to use a normal i3c adapter with little-endian
>> registers on a normal big-endian machine but ran into this bug?
> The intention here is to enforce big-endian ordering for the trailing 
> bytes as well. By using __cpu_to_be32() for full words and writel_be() 
> for the leftover word, the FIFO is always accessed in big-endian 
> format, regardless of the CPU's native endianness. This ensures 
> consistent and correct data ordering from the device's perspective.

No, this makes no sense: The 'else' portion is incorrect in the
function, and prevents it from working on all big-endian CPUs because
'writel()' only works for little-endian 32-bit registers. If you just
fix the bug as I described above, this will work correctly on any
driver calling the current function. At that point, your hack becomes
a nop for big-endian systems, while calling the function with
'endian = true' on little-endian kernels is still wrong.

Please start by fixing the existing bug and test that again.

I know that endianess with FIFO registers is hard to understand,
and everyone has to spend the time once to actually wrap their
head around this. Even if you don't believe me, please try the
bugfix below (without your added argument) and think about how
FIFO registers that transfer byte streams are different of
fixed-endian 32-bit registers. Note that your driver uses
little-endian readl() for normal registers, and this is portable
to both LE and BE kernels.

See also the explanation in 41739ee355ab ("asm-generic: io:
don't perform swab during {in,out} string functions").

     Arnd

diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
index 0d857cc68cc5..0f8a25cb71e7 100644
--- a/drivers/i3c/internals.h
+++ b/drivers/i3c/internals.h
@@ -38,7 +38,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
 		u32 tmp = 0;
 
 		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
-		writel(tmp, addr);
+		writesl(addr, &buf, 1);
 	}
 }
 
@@ -55,7 +55,7 @@ static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
 	if (nbytes & 3) {
 		u32 tmp;
 
-		tmp = readl(addr);
+		readsl(addr, &tmp, 1);
 		memcpy(buf + (nbytes & ~3), &tmp, nbytes & 3);
 	}
 }

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
