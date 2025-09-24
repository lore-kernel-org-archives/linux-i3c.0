Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89894CAC5A5
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2TB4SdRa6CY/+BbhnsRQdnWIgQIOAjI8tUQq4OY6Kw4=; b=4COlJBrdLGUCXIlK60tDkW8NVK
	avKmWa6YzmF6A21DKDpGLAvh/n6LRkxLQDiJDsSXNS/unCd+0iHglxsnnaUDcxx7H0IILNvdG5TUk
	TKCqZ2tR0TzFu8JCYjOrVPs6pwqVS/D1iFIEr81WQg5vgMZwyCgZ+VzXrTRZMiaQ0j3XqMazndu1Y
	9IsWHKuOv1hFPCYSDHShIBAV5w81PAqTrhwW0bPugfyGE0qB7ZExPeQidl9lM8/y9Red6p9NaD7P6
	k4S1bXPLSk82lbuhewZi+RznubKuBNEluvWY+BEJldOGwYXqFXKR/QZUKMKXgq8fapQUH1kYd56V4
	W1s0sSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ReI-00000001Omo-1JXy;
	Wed, 24 Sep 2025 15:43:18 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ReF-00000001Ojj-0E7G
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 15:43:16 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id D4E031D000E3;
	Wed, 24 Sep 2025 11:43:12 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 11:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758728592;
	 x=1758814992; bh=JsHZEsMXkjnsb1bbQltuF4dLLYqSINr5KSvPj/nUVX4=; b=
	v/3IuU5QwCLyonLjAMbCC4QovxzEOPB/yLo4a504Cc7rZiVCmgnoLtMS/B7THN+q
	nitzArqjm+TcSzeed63HFvN7mMe7bixA2uHam70OqXrSyyIxP/pnd6Hu0mIg8mNx
	lOpo5urLE4FRGXCt7D9zXw2Ye8K1AmllhGAiz/IspucpmhiuZdjmsuRO5bKrTPnV
	YFQx/g968eIxxXpuhT9NuYJPuFj/ndxMQSTWtGgTXUcIvOFcH6A0ehaeF27kxwPF
	fiBSy33EFiH+G2iiMI9x3LoGN+4ny+Y+7OZ2+b0Xv17uP1NPUZzGfz112BO+hfuJ
	sikWfF8nN54yK/myMjtSsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758728592; x=
	1758814992; bh=JsHZEsMXkjnsb1bbQltuF4dLLYqSINr5KSvPj/nUVX4=; b=S
	slvYwfN7eFNuRHK9fKToAv6lO9lk3lrrJ4XKvcXH6T5jhDpQ6vKAr5L2Tos7AUF3
	xynuwCDbevy4BwGE4cfWTN23q9Zcm2Gz1Kl81Eryzv9IBK9kOn7fHyjfUHpiRMzG
	ajGMk3Q63hCBfyq6hea+8HKx8J6ZfFtJEp3RNLYdUPNFXTMwlmTNO58k6EZ6mOQj
	9tUjBLrbIAgGY/SRlmIl9N4JM6sGTU5F6DGQ+xtBeC4HUcdTeDEXuPcBl+zoz/VC
	xrnl/xL9R9xou1xjtMmgyzZ/HTvZluXAlBBhDYVR8BEuR9Wn43uSDNttYLZIiqHz
	PWa26Ze3uOOrUj+fG+1+Q==
X-ME-Sender: <xms:jRHUaDSR82YrRNoH8mfw86ggowF7nOXpO68HWpplZMfVqV-rYdgDxg>
    <xme:jRHUaPleqHlBzdk9Z42MTGWmCpW5V3fSItlFjsJG4xFA_636Pwku-2sul0mCNPrEq
    vru_YRado0UbIPC3cnCeveNn1PqOgk4cLZSwiAhM0PuC6UGylq76j8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeigedttdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:jRHUaOQr6QBuxylQkv86LWgGP-Glrvkkc4vM61Y4l-jmA7kPhBDDpg>
    <xmx:jRHUaGbH26Lp3ayWnxkqY8HNzXHSDxBd2bFDAwhL4S6uqeDFl87Clg>
    <xmx:jRHUaLU422y6Fkoc8NbG_jP61ZQV0HQ_XfWsQ7jPrnAD035yHAz3AQ>
    <xmx:jRHUaLW2qzpK7JHz1wP-AO59nsq_9Kojcf2J8r4CW0yYN08gryD_Og>
    <xmx:kBHUaL9PeYq5hk3ah1w9Ob7tORZa9N-cmd9Tch5ZzJtGiYCqe3fGgZdi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B0DF2700069; Wed, 24 Sep 2025 11:43:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0nVfrWCY5as
Date: Wed, 24 Sep 2025 17:42:36 +0200
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
Message-Id: <295ee05e-3366-4846-9c8b-85ac09d79d48@app.fastmail.com>
In-Reply-To: <DM4PR12MB610989A03A7560F2A03792838C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
 <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
 <DM4PR12MB61098EA538FCB7CED2E5C47B8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <4199b1ca-c1c7-41ef-b053-415f0cd80468@app.fastmail.com>
 <DM4PR12MB6109E009DAC953525093FE808C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <134c3a96-4023-47ab-8aa9-fd6ab75e5654@app.fastmail.com>
 <DM4PR12MB610989A03A7560F2A03792838C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_084315_405386_4C297D44 
X-CRM114-Status: GOOD (  17.14  )
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

On Wed, Sep 24, 2025, at 17:23, Guntupalli, Manikanta wrote:
>> Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo() and i3c_writel_fifo()
>> > }
>> >
>> > With this approach, both little-endian and big-endian cases works as expected.
>>
>> This version should fix the cases where you have a big-endian kernel with either
>> I3C_FIFO_BIG_ENDIAN or I3C_FIFO_LITTLE_ENDIAN, as neither combination
>> does any byte swaps.
>>
>> However I'm fairly sure it's still broken for little-endian kernels when a driver asks for
>> a I3C_FIFO_BIG_ENDIAN conversion, same as v7.
> We tested using the I3C_FIFO_BIG_ENDIAN flag from the driver on 
> little-endian kernels, and it works as expected.

Can you explain how that works? What I see is that your
readsl_be()/writesl_be() functions do a byteswap on
every four bytes, so the bytestream that gets copied
to/from the FIFO gets garbled, in particular the
final (unaligned) bytes of the kernel buffer end up
in the higher bytes of the FIFO register rather than
the first bytes as they do on a big-endian kernel.

Are both the big-endian and little-endian kernels in
your tests on microblaze, using the upstream version
of asm/io.h? Is there a hardware byteswap between the
CPU local bus and the i3c controller? If there is
one, is it set the same way for both kernels?

    Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
