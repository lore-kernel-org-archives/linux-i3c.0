Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83624CAC5AC
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Sep 2025 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ps1bvDnY7NrchI3HBc9rjCtAtQiGBtYAEmRIBpaMmLo=; b=k8WMCCiwvVqpVWP6/H44fUEKD2
	3wp8tB3kFwAJfsts3tZSXmwmC7RJTnLWmbb0DDJX17qBeF8JZWiP2zMVh1Ip6IKTX6K2fsmZepfGw
	ATg+e5zGZ+idoRSo12MG4KH/D67T49jg6iBSHtSXOc/ngv8Z72FB2rF880x8JSetYREpU8z3eCsuC
	kjnTlyAx800+k4ZqkMy/ysuAGvzp7yTDDLkBEXJDMRn2ldgCtU1EdUuq8zR+SPwrHhqZxQQqDLIMp
	uUC3ttY1yhEK/q0ez//vE2C+FOOk2LXUKKuLbk/KMJl++cfaXXs9jVxjpNhlMqDvsVGvwUuAsgKmh
	ueONjZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1874-0000000EZji-14cE;
	Tue, 23 Sep 2025 18:51:42 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1872-0000000EZjJ-1YZZ
	for linux-i3c@lists.infradead.org;
	Tue, 23 Sep 2025 18:51:41 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E19787A01E3;
	Tue, 23 Sep 2025 14:51:38 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 23 Sep 2025 14:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758653498;
	 x=1758739898; bh=lmf2MPQeiwJsAwtLP2v5pSNutJHWBNm/aiiaZc+tP84=; b=
	4iYvt3am4dDjecetJmpP7NM6jm2VaJZPHdE/6j5qNIaso/URWs4m++GO5uy31o2J
	21wnqrnJ+7sFWH1nxLC8uOhVAvp9ry0HeEuBJo/+O+brl/naFv4PWNXHmntMYWlO
	xGeEFs3y15Bz/W1GdB2cxMW0BtvJF+lzd+WuXL9536dtvDMaG2qYCIdx6HVfqfap
	wUr+cU2t849eML9sA29VjJ2Rzm09VQHexK9fLgEu9IizJTAGbtxqZaZXbsWVtjC9
	28aNTzDj4IKiofjP5ezxA637WWRu1xI/cbSOvN0LRau/X0BlKCnUDcNz6aPqjeX5
	Maqds4OauF5iLsGeU7vY0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758653498; x=
	1758739898; bh=lmf2MPQeiwJsAwtLP2v5pSNutJHWBNm/aiiaZc+tP84=; b=N
	fi1wlRmhRc1pKrk5aQTnBpJQ7uMjxXcikr0G1JpxQfnloNlTuIYq7tMPcd8L8cAK
	LSzt0TgkyPJca7G9mft3+3ZgYNwSOpSxR+IAO+2fngXRAS2o/8TOV+sQsiySlsIQ
	+DnbvXn9hZfk/HStct2K1ZaWnVFe81nXRhpweDX0paEIZ5GZCQPVklAerrIRTeyr
	+hOMrrwPSwqckOqflloGOUGiLWZlwxwyzghf7HRnBQortOINYjxQHZ0lzPulZdO1
	tpEcyZaLZyWfgm+Je9kPLX0WFnE3YftOTNlDoEg1Uc+/FE7JiqMFS66jOkfJVGhz
	cKWztcMGS4X75PR/ChTVw==
X-ME-Sender: <xms:OezSaLUDIbvpiCUzGA7ce962ySuhoSMt3VLSskyS8atjkW-ZmuAvOQ>
    <xme:OezSaOYFzpIpEAVCIlnF6gB18r5CM6Sc1Q6IMY5tNatwoqahhk5iTREq6AiQ9mgb6
    1CA76ctiQ6AIKcfG--HAZPNwHmypM-lTWz4OV4Mf5Fs5CKYWjtuqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiudeglecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:OezSaK2PRjsvapyaVhaiJFjPFm0xxDyxNB8kLn988afpOOQE73pEwA>
    <xmx:OezSaPvZka9D2kdZrWN4DtB_9aDLDiGI734audr5bPNa_V0qAvUGTA>
    <xmx:OezSaCYAb8Ikf5A0WQpK_tI2mKOuXJlAZ2YeuHLgjtACQ-HU9_-FZg>
    <xmx:OezSaNIn80nRVoEzDuc83gmGPbIw6d75Rh-Wj5EUEm4dJwl4ssbE7Q>
    <xmx:OuzSaMzP4FJYnq2wSBvS22jGwixsuPQa5aRoWHk_BzAKbJcHG_kOzG68>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2A93270006D; Tue, 23 Sep 2025 14:51:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0nVfrWCY5as
Date: Tue, 23 Sep 2025 20:51:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, git@amd.com,
 "Michal Simek" <michal.simek@amd.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 =?UTF-8?Q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 tommaso.merciai.xr@bp.renesas.com, quic_msavaliy@quicinc.com,
 Shyam-sundar.S-k@amd.com, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>,
 "Kees Cook" <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
 "Jorge Marques" <jorge.marques@analog.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-hardening@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com, srinivas.goud@amd.com,
 shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Message-Id: <13bbd85e-48d2-4163-b9f1-2a2a870d4322@app.fastmail.com>
In-Reply-To: <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-4-manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V7 3/4] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_115140_468640_EC6B2AEB 
X-CRM114-Status: GOOD (  18.31  )
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

On Tue, Sep 23, 2025, at 17:45, Manikanta Guntupalli wrote:
>  /**
>   * i3c_writel_fifo - Write data buffer to 32bit FIFO
>   * @addr: FIFO Address to write to
>   * @buf: Pointer to the data bytes to write
>   * @nbytes: Number of bytes to write
> + * @endian: Endianness of FIFO write
>   */
>  static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> -				   int nbytes)
> +				   int nbytes, enum i3c_fifo_endian endian)
>  {
> -	writesl(addr, buf, nbytes / 4);
> +	if (endian)
> +		writesl_be(addr, buf, nbytes / 4);
> +	else
> +		writesl(addr, buf, nbytes / 4);
> +

This seems counter-intuitive: a FIFO doesn't really have
an endianness, it is instead used to transfer a stream of
bytes, so if the device has a fixed endianess, the
FIFO still needs to be read using a plain writesl().

I see that your writesl_be() has an incorrect definition, which
would lead to the i3c_writel_fifo() function accidentally still
working if both the device and CPU use big-endian registers:

static inline void writesl_be(volatile void __iomem *addr,
			      const void *buffer,
			      unsigned int count)
{
	if (count) {
		const u32 *buf = buffer;
		do {
			__raw_writel((u32 __force)__cpu_to_be32(*buf), addr);
			buf++;
		} while (--count);
	}
}

The __cpu_to_be32() call that you add here means that the
FIFO data is swapped on little-endian CPUs but not swapped
on big-endian ones. Compare this to the normal writesl()
function that never swaps because it writes a byte stream.

>  	if (nbytes & 3) {
>  		u32 tmp = 0;
> 
>  		memcpy(&tmp, buf + (nbytes & ~3), nbytes & 3);
> -		writel(tmp, addr);
> +
> +		if (endian)
> +			writel_be(tmp, addr);
> +		else
> +			writel(tmp, addr);

This bit however seems to fix a bug, but does so in a
confusing way. The way the FIFO registers usually deal
with excess bytes is to put them into the first bytes
of the FIFO register, so this should just be a

       writesl(addr, &tmp, 1);

to write one set of four bytes into the FIFO without
endian-swapping.

Could it be that you are just trying to use a normal
i3c adapter with little-endian registers on a normal
big-endian machine but ran into this bug?

     Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
