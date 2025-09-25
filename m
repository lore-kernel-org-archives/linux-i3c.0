Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA4CAC5AA
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FtocNKZGyyUWnIMLWaMaC1BU3SB6zROxd/knhH13ImA=; b=wA7YLVT/ZZ/mD4SyprvFfN+L3O
	97GvKL0jG8U4gh9zol8wjWb5EO5zCRYU9i0UTB0sR7sHxYazUcjpX+vo9aPrjejjvtfdnab1xbMzp
	9QD2C2SSkZnOQBZVVlcBdsqhf48vZZb5cYNy5ZgF+HK7z5eUkiwEViD/3Ekx/tKxTYxBHOX36cdkE
	fSlykV9t4PsnBat+dmAP+2K8vOeSVOS+uLcnH9kKtjOmWtn0QqGSm/Cmx1S4VasIfmgufnU9JTH7B
	pYD27xzb8gp2PK9GGV5RZcye8RW8RuDZjM7YA+YFftMLFwaxuaPsHuZh9qOqE9uuAApFLsMJ3tEP/
	/c+c3FUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hlj-00000007LEu-0Kjs;
	Thu, 25 Sep 2025 08:56:03 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1hlg-00000007LEQ-1ivq
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 08:56:02 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id BC2FE1D001A0;
	Thu, 25 Sep 2025 04:55:58 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 04:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758790558;
	 x=1758876958; bh=arJvu+z/2kX0g5MUfgkzJqfIjLRwEItHD4NVpoLyF24=; b=
	Jzxm3Rgj9hiVTs0SxBBymRmYk1qyueD/fd9xwJiuNVmj1EAcSCZxIbQwhTCUYCSS
	3Z0SrBEcovNlYScke2YJF6dEeL+Lo8/AKpVPumhextRIXAqxydKlJdNGKB2qE/hg
	1pNOEF7BZPar3H/RwTW4AYdmpgh8ZL2c8PopVykX0DRroK8DVoPI8LHaxOLSH9Wp
	BhPvWvGgV1wn3qeovCuxN/bnq6z42OeHKUfJ0Ci883poOKHn4egIVwogadYH8Cco
	dlL5hnpDf9Wd/qhWv1fqDDvsgUVVnbNBSloT4jKqvlruqRhiq2rMIRMbbQN+Rmdi
	v1PuQxAXZGBEI/q4X8epmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758790558; x=
	1758876958; bh=arJvu+z/2kX0g5MUfgkzJqfIjLRwEItHD4NVpoLyF24=; b=T
	7Fq3lClrpXrp84PwgUQBu6H3bXaY78toWKbGRIJX622U6cFjVSap5tNsP4LYQ4cZ
	0ovOTk7Cya0Nd6pqkggcru5ZnqKZECNIzohAlYdUPgad36DSNcVSnJtV5alFy9yp
	IbL5wteq/O2GIwuPdU2DWkRSPvxTS2ml4Ftj5g6a81qCV2JCphCN6q6o4b985zt2
	XDCpadf5oKEZ7c5pNrwzQTHk3Na3uJmHEbNCTVf7DzPBi4RIZ9q4mF9vByAWBFn3
	hfIzPv87sXWoBO7dqPGSZlL+qnL2NUUjRuLshX5Jvh2RohxLRahY1sbUw+dKMdYt
	175tXd+oWmwMl7SpfcSxg==
X-ME-Sender: <xms:nQPVaOwH1-jHIh8ChhbbGAM3HLEJWLtr8BKkhHMwkn84POiB5DR7dg>
    <xme:nQPVaFE7yyWqpQIhvMHwOMH4oeaJ47bkwx5ypvkdtzfFYwIQ2Dz2nAMfWCrgfjDg1
    jiNI5f7CEGsNFb3pawnWrIgJ_AHtGrRb-7GG8Z0Qmt8wlWJ_piFNgU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiiedtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepghhithesrghmugdrtghomhdprhgtphhtthhopehmrghnihhkrghnth
    grrdhguhhnthhuphgrlhhlihesrghmugdrtghomhdprhgtphhtthhopehmihgthhgrlhdr
    shhimhgvkhesrghmugdrtghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghsse
    grnhgrlhhoghdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepghgrshhtmhgrihgvrhesghhmrghilh
    drtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    lhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehfrhgrnhhkrdhlihesnhigphdrtghomh
X-ME-Proxy: <xmx:nQPVaEWi6rAMfps2t2_tX4U6WpDbbLxyOJ5Gomp_gIb4csnBwGAPUg>
    <xmx:ngPVaEfoMYYselD9_6jbdApxbYjmONEoBGHPmUdhgm_bqLXtKPXObQ>
    <xmx:ngPVaFbLLn3XAgW5nZv04-eUp81pjABb5vzjGZi6Ve58MHXppNZrZQ>
    <xmx:ngPVaINCFRz6QpcdmmeCDOJ8y9uL8qjLFcVpgV8C0IN3oLIxa4in3A>
    <xmx:ngPVaI8i-wydrm3tFx7W3qQdTaKhRqvl5XmXssapJckfJ6RdD1oQ_FrI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DB2F4700065; Thu, 25 Sep 2025 04:55:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnQDLTKpvobg
Date: Thu, 25 Sep 2025 10:55:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>,
 "Jorge Marques" <gastmaier@gmail.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "git (AMD-Xilinx)" <git@amd.com>, "Michal Simek" <michal.simek@amd.com>
Message-Id: <f2171867-f0d4-49d3-b5b1-8467d9721c67@app.fastmail.com>
In-Reply-To: <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250924201837.3691486-1-arnd@kernel.org>
 <2wtpklapw5ogsevuvk2l4ngvw7hymer2y4cc454h47u2d7tq44@4mknmpk5yzil>
 <DM4PR12MB6109367F36487B582ED8EA968C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
Subject: Re: [PATCH] [v2] i3c: fix big-endian FIFO transfers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_015600_963571_710B2540 
X-CRM114-Status: GOOD (  25.28  )
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

On Thu, Sep 25, 2025, at 09:37, Guntupalli, Manikanta wrote:
>
> This patch fixes the sub-word transfer case on big-endian kernels, but 
> it still does not address the scenario of little-endian kernels 
> accessing big-endian FIFOs.
>
> With the current version, i3c_writel_fifo() and i3c_readl_fifo() only 
> work when the FIFO has the same endianness as the CPU. On platforms 
> such as the ZCU102 (Zynq UltraScale+ MPSoC, Cortex-A53, little-endian), 
> the I3C FIFOs are big-endian, and this patch alone is not sufficient - 
> transfers fail in that configuration.
>
> We have validated this on ZCU102, and the mismatch between LE kernel 
> and BE FIFO is still an issue.

Hi Manikanta,

Thanks a lot for testing my patch and the description of
how you tested it. I think there is still a communication
problem because the term "big-endian FIFO" makes no sense
to me.

If you need an extra byteswap on a little-endian arm64 kernel,
what you have is what I would describe as a "byte-reversed FIFO",
presumably as the result of a peripheral that was initially
designed for big-endian MMIO access, but then adapted for use with
little-endian readl() helpers by adding a data swizzle in front
of each MMIO access including both the MMIO registers and the FIFO.

The result of that is that FIFO data comes out reversed in readsl(),
but does so on both little-endian and big-endian arm64 kernels,
because the hardware byte-reverse remains in place regardless of
the CPUs internal state.

If I'm interpreting this correctly, the function you'd
actually need to make the driver work on both big-endian
and little-endian (arm64) kernels would look roughly
like

static inline void i3c_writel_fifo_bytereversed(void __iomem *addr,
                         const void *buf, int nbytes)
{
        /*
         * byteswap each 32-bit word to work around FIFO quirk.
         * Note: this is different from iowrite32be(), which
         * would only swap on little-endian kernels.
         */
        while (nbytes >= 4) {
                __raw_writel(swab32p(buf), addr);
                buf += 4;
                nbytes -= 4;
        }

        if (nbytes > 0) {
                u32 tmp = 0;

                memcpy(&tmp, buf, nbytes);
                swab32s(&tmp);
                __raw_writel(addr, &tmp, 1);
        }
}

The idea here is to have a function that works the same
way as i3c_writel_fifo() but instead of never swapping the
FIFO data, it would always swap it regardless of the CPU
state, making it portable to (most of) the architectures we
support in Linux. In your version of writesl_be(), the
swap would happen on little-endian kernels but not happen
on big-endian kernels, which is inconsistent with the
documented writesl() behavior, and still makes no sense to
me conceptually. 

I think the i3c_writel_fifo_bytereversed() function would
be obscure enough that we don't need it (or the
underlying writesl_bytereversed() helper) and could
be part of your own driver as you had in the original
versions, but that is something for the i3c maintainers
to decide.

Are you able to test big-endian arm64 kernels to verify this?
Linux-next now has a patch to disallow that configuration,
but you should be able to still use v6.17 and earlier if you
have access to big-endian userspace.

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
