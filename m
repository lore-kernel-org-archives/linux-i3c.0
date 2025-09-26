Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0956FCAC5B9
	for <linux-i3c@archiver.kernel.org>; Fri, 26 Sep 2025 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l9H8Wo4jJDT8WFTcLXrsQNJO5DFNB8YoAm9vhu0cXWM=; b=r63gBN47168DM1IbaVACzAhhhf
	9B0W8mDrqkTFlbBkTydYmLDW24zESq7QtNc9rd3s6pZybDh100QZJQnAiEo1ajrJo5WBS464GMuPt
	YT/A19pXwkswbIYn/9lZ6auKkB6iJN6xEedxeKHsdizP5DqZc9z/7ajfLjGBhvcPYu/6U4HoIB/8U
	tMOMg9CvlwZjgWYBoHF7KPz2/dDQTSJqh/vZEOesEvz7tt6us10CCVFJEJ6jpwViFzZuSfuqgI5++
	SLyunq3A8iQCDbMCocE7SpKljJTVfuk90Zl/HvFKNLeg7xELunyUZjmgFtSP5gYa4ylytT9xynd6F
	ffSd0pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26LK-00000000fxk-3JVV;
	Fri, 26 Sep 2025 11:10:26 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v26LI-00000000fvu-0vIp
	for linux-i3c@lists.infradead.org;
	Fri, 26 Sep 2025 11:10:25 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 3FEAFEC0209;
	Fri, 26 Sep 2025 07:10:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 26 Sep 2025 07:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758885023;
	 x=1758971423; bh=qRImFkmPF9+KEGIYvcQCn7PydMZrzs/++uOGJWkLiNs=; b=
	yc/LWSgFtYGtMEeLfmhIrfr4ItgbBs3CsbThTb3+IgcUmg8jX6rq+qfXKNH9udi/
	NG+dxggVGhGgf49CsGj4npoweYKoQxZ6rAUmczEYhYneKuIC3yD05GySeN7qAybk
	C8yG7kNxSHvpTgXEov2OxHXF4+e5JnZtFMLkeUVZ/IvAzFFTHE1TZsv5Zs+mMsr2
	7AMMQW0N01w2grhi/VojdgzcAtrjALMrsi53dGSo+ZlBG7pNcSEAvxohC4KMEldo
	UG0jW+QdjwhxQgC22iSNK6dP7jjnhTrSW0qfurP1AUsE7LZfNLSJTz4jEv9F2Nkc
	dnCj9uYszaZhbaxmGKnmNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1758885023; x=
	1758971423; bh=qRImFkmPF9+KEGIYvcQCn7PydMZrzs/++uOGJWkLiNs=; b=A
	DHVkpwhmFgx7ipWNayKfjX9cdMnPjQrF1Le3j8dT9sfgRHaRbU1keRiebrtkPyYT
	DJUg2vA+kXlL5vJU09XiyR9CWzE01FTTlX522fpwcdqWp/2EtgN/86fjmVXag1M9
	Xa4/15kxerC1HXEW5Qm1YU4OQMksFCC7/TeJ4yJ7AjcHXg56Fo+aDGzYOxogQKTx
	DKAjx1jDdz3ewQz0PTRzHigD2VbGc8b2zAe+NaBHmPeDE+m/KiJuCzLW0w18k4++
	Ea23PSvCzVB3PJSco+8w+P/UBeJrQ+ShE2EUMF7bKsz5zWeYjR77nhvf0lgSCPDj
	ZFPelHy9lCYf7hJJY6rWw==
X-ME-Sender: <xms:nnTWaNu1PbmDIPSE8-LO9a9LrbwUyASxcw2jn0t5YMA_Lh_y7lvSeQ>
    <xme:nnTWaBQEHLxs3B0v6Lf5UqtHXjJ7KSkw3V5npIOHVBbSYtHz4lrX7Wvj7vBKCOfha
    oyaOfAqg44aMQleh5GZ3624FBpRAvyPGq7F3H7ZQjLfNz_twrJEosk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiledvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:nnTWaINqgrfu7ds06QqsQqcUxBt_YjmHOoEhinvOegFF5lUdNRPpqw>
    <xmx:nnTWaBlL8qxklIHSjkW0IUkMfI0oGgz_7ThAj22UWK1q0BiPlE_0Lg>
    <xmx:nnTWaOwdyJUBk7WiJmTHZr4W5vAZzyl1iP_u4dkL7sH42kU1MDhHRw>
    <xmx:nnTWaCC5LH40aI3Ovwft2K0EFTi-n9pvPxrZonv6iXF3xX9BE_yPyQ>
    <xmx:n3TWaLpo9s07AFg8N68KeP8JXAiLMPS_hVtNzXWRvosyyZNy0W0PbJnC>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 131A8700065; Fri, 26 Sep 2025 07:10:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ANlaf4aDyzkw
Date: Fri, 26 Sep 2025 13:09:37 +0200
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
Message-Id: <93704e82-ea7d-45ea-8527-8ce92108eccc@app.fastmail.com>
In-Reply-To: <20250926105349.2932952-5-manikanta.guntupalli@amd.com>
References: <20250926105349.2932952-1-manikanta.guntupalli@amd.com>
 <20250926105349.2932952-5-manikanta.guntupalli@amd.com>
Subject: Re: [PATCH V8 4/5] i3c: master: Add endianness support for i3c_readl_fifo()
 and i3c_writel_fifo()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_041024_331405_13EEE0AB 
X-CRM114-Status: GOOD (  11.23  )
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

On Fri, Sep 26, 2025, at 12:53, Manikanta Guntupalli wrote:
> Add endianness handling to the FIFO access helpers i3c_readl_fifo() and
> i3c_writel_fifo(). This ensures correct data transfers on platforms where
> the FIFO registers are expected to be accessed in either big-endian or
> little-endian format.
>
> Update the Synopsys, Cadence, and Renesas I3C master controller drivers to
> pass the appropriate endianness argument to these helpers.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

I don't think this is a good interface, based on our discussion
so far, and I had hoped you'd change it the way I had suggested
with a separate function for the xi3c driver, so normal drivers
don't have to worry about the AMD specific quirk.

I think this should also avoid mentioning "endianess" in the
changelog and in the code itself, since that would likely
confuse readers into thinking (as I did in my earlier replies)
that this is related to using big-endian kernels.

i3c_readl_fifo()/i3c_writel_fifo() are already portable and
handle endianess correctly by using the readsl()/writesl()
functions.

    Arnd

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
